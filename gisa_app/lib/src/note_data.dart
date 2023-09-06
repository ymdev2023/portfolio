class NoteData {
  // final int? id, answer;
  final String? subNum, title, pointNum;
  final List<String>? hashtag;

  NoteData(
    this.title,
    this.pointNum,
    this.hashtag, {
    this.subNum,
  });
}

const List noteData = [
  {
    "subNum": "1",
    "pointNum": "1",
    "title": "소프트웨어 생명 주기(Software Life Cycle)",
    "contents":
        '''소프트웨어 생명 주기는 소프트웨어 개발 방법론의 바탕이 되는 것으로, 소프트웨어를 개발하기 위해 정의하고 운용, 유지보수 등의 과정을 각 단계별로 나눈 것이다.
•소프트웨어 생명 주기는 소프트웨어 개발 단계와 각 단계별 주요 활동, 그리고 활동의 결과에 대한 산출물로 표현한다. 소프트웨어 수명 주기라고도 한다.
•소프트웨어 생명 주기를 표현하는 형태를 소프트웨어 생명 주기 모형이라고 하며, 소프트웨어 프로세스 모형 또는 소프트웨어 공학 패러다임이라고도 한다.''',
    "hashtag": ['생명주기', '소프트웨어공학'],
  },
];
