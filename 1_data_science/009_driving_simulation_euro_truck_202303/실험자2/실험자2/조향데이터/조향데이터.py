import pygame
import time
import pandas as pd
import datetime
import keyboard

pygame.init()

# 조이스틱 초기화
pygame.joystick.init()
pad = pygame.joystick.Joystick(0)
pad.init()

# 데이터 저장할 빈 리스트 생성
data = []

while True:
    pygame.event.pump()

    # s 키 누르면 데이터 저장
    if keyboard.is_pressed('s'):
        # if event.type == pygame.KEYDOWN and event.key == pygame.K_LSHIFT:
        print("데이터 저장 완료")
        now = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")  # 현재일시 가져오기
        filename = f"data_{now}.csv"  # 파일명 만들기
        df = pd.DataFrame(data, columns=["조향각", "엑셀", "브레이크"])
        df.to_csv(filename, index=False, encoding='utf-8-sig')

    # r 키 누르면 data 초기화
    elif keyboard.is_pressed('r'):
        # elif event.type == pygame.KEYDOWN and event.key == pygame.K_CAPSLOCK:
        print("데이터 초기화")
        data = []

    # x 키 누르면 프로그램 종료
    elif keyboard.is_pressed('x'):
        # elif event.type == pygame.KEYDOWN and event.key == pygame.K_TAB:
        pygame.quit()
        print("프로그램 종료")
        exit()

    # 조향각, 엑셀, 브레이크 값 계산
    angle = pad.get_axis(0)
    accel = pad.get_axis(1)
    brake = pad.get_axis(2)

    # 데이터 리스트에 값 추가
    data.append((angle, accel, brake))

    # 값 출력
    print("조향각 : ", angle)
    print("엑셀 : ", accel)
    print("브레이크 : ", brake)

    time.sleep(0.001)