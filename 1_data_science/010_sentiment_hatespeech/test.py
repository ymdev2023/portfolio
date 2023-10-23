#!/usr/bin/env python
# coding: utf-8

import tensorflow as tf
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from tensorflow.keras.layers import (
    Input,
    Embedding,
    Conv1D,
    BatchNormalization,
    Activation,
    Dense,
    GlobalMaxPooling1D,
)
from tensorflow.keras.models import Model
from collections import Counter
from wordcloud import WordCloud
import re
from gensim.models import Word2Vec
import tensorflow_addons as tfa

# 데이터 로드
data = pd.read_csv('dataset.csv', sep="\t")  # 데이터셋 파일 경로에 맞게 수정

# 데이터셋을 문장과 레이블로 분리
texts = data['content'].values
labels = data['label'].values

# 데이터셋 분포 확인
class_distribution = data['label'].value_counts()
print(class_distribution)

# 데이터 전처리
def remove_special_characters(text):
    text = re.sub(r'[^A-Za-z가-힣\s]', '', text)
    return text

texts = [remove_special_characters(text) for text in texts]

# Tokenizer를 이용한 텍스트 전처리
tokenizer = Tokenizer()
tokenizer.fit_on_texts(texts)

# 텍스트를 정수 시퀀스로 변환
sequences = tokenizer.texts_to_sequences(texts)

# 시퀀스를 일정한 길이로 패딩
max_sequence_length = 100  # 문장 최대 길이에 맞게 조절
sequences = pad_sequences(sequences, maxlen=max_sequence_length)

# Word2Vec 모델 학습
sentences = [text.split() for text in texts]
word2vec_model = Word2Vec(sentences, vector_size=128, window=5, min_count=1, sg=1)

# Embedding Matrix 생성
embedding_matrix = np.zeros((len(tokenizer.word_index) + 1, 128))
for word, i in tokenizer.word_index.items():
    if word in word2vec_model.wv:
        embedding_matrix[i] = word2vec_model.wv[word]

# 데이터셋 분할
X_train, X_test, y_train, y_test = train_test_split(sequences, labels, test_size=0.2, random_state=42)

# VDCNN 모델 정의
input_layer = Input(shape=(max_sequence_length,))
embedding_layer = Embedding(input_dim=len(tokenizer.word_index) + 1, output_dim=128, weights=[embedding_matrix], trainable=False)(input_layer)

def conv1d_block(x, filters, kernel_size, dilation_rate):
    x = Conv1D(filters, kernel_size, padding='same', dilation_rate=dilation_rate)(x)
    x = BatchNormalization()(x)
    x = Activation('relu')(x)
    return x

# Convolutional Blocks
block1 = conv1d_block(embedding_layer, filters=64, kernel_size=3, dilation_rate=1)
block2 = conv1d_block(block1, filters=64, kernel_size=3, dilation_rate=2)
block3 = conv1d_block(block2, filters=128, kernel_size=3, dilation_rate=4)
block4 = conv1d_block(block3, filters=128, kernel_size=3, dilation_rate=8)

# Max-Pooling
pooling = GlobalMaxPooling1D()(block4)

dense1 = Dense(128, activation='relu')(pooling)
output_layer = Dense(1, activation='sigmoid')(dense1)

model = Model(inputs=input_layer, outputs=output_layer)

# Add Causality Attention Layer
model = tfa.layers.CausalAttention(128)(model)

model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# 모델 학습
model.fit(X_train, y_train, epochs=5, batch_size=64, validation_data=(X_test, y_test))

# 모델 평가
loss, accuracy = model.evaluate(X_test, y_test)
print(f'Accuracy: {accuracy * 100:.2f}%')
