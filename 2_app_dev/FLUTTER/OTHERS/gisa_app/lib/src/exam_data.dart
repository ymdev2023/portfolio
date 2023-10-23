class Question {
  // final int? id, answer;
  final String? q_num, question;
  final List<String>? options;
  final int? a_num;

  Question({this.q_num, this.question, this.a_num, this.options});
}

// const List sampleData = [
//   {
//     "id": 1,
//     "question":
//         "Flutter is an open-source UI software development kit created by ______",
//     "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
//     "answer_index": 1,
//   },
//   {
//     "id": 2,
//     "question": "When google release Flutter.",
//     "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
//     "answer_index": 2,
//   },
//   {
//     "id": 3,
//     "question": "A memory location that holds a single letter or number.",
//     "options": ['Double', 'Int', 'Char', 'Word'],
//     "answer_index": 2,
//   },
//   {
//     "id": 4,
//     "question": "What command do you use to output data to the screen?",
//     "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
//     "answer_index": 2,
//   },
// ];

const List examData2020_1 = [
  {
    "q_num": "001",
    "question":
        "검토회의 전에 요구사항 명세서를 미리 배포하여 사전 검토한 후 짧은 검토 회의를 통해 오류를 조기에 검출하는데 목적을 두는 요구 사항 검토 방법은?",
    "options": ['빌드 검증', '동료 검토', '워크 스루', '개발자 검토'],
    "a_num": 3,
  },
  {
    "q_num": "002",
    "question": "코드 설계에서 일정한 일련번호를 부여하는 방식의 코드는?",
    "options": ['연상 코드', '블록 코드', '순차 코드', '표의 숫자 코드'],
    "a_num": 3,
  },
  {
    "q_num": "003",
    "question": "객체지향 프로그램에서 데이터를 추상화하는 단위는?",
    "options": ['메소드', '클래스', '상속성', '메시지'],
    "a_num": 2,
  },
  {
    "q_num": "004",
    "question": "데이터 흐름도(DFD)의 구성요소에 포함되지 않는 것은?",
    "options": ['process', 'data flow', 'data store	', 'data dictionary'],
    "a_num": 4,
  },
  {
    "q_num": "005",
    "question": "소프트웨어 설계시 구축된 플랫폼의 성능특성 분석에 사용되는 측정 항목이 아닌 것은?",
    "options": [
      '응답시간(Response Time)',
      '가용성(Availability)',
      '사용률(Utilization)',
      '서버 튜닝(Server Tuning)'
    ],
    "a_num": 4,
  },
  {
    "q_num": "006",
    "question": "UML 확장 모델에서 스테레오 타입 객체를 표현할 때 사용하는 기호로 맞는 것은?",
    "options": ['《 》', '(( ))', '{{ }}', '[[ ]]'],
    "a_num": 1,
  },
  {
    "q_num": "007",
    "question": "GoF(Gang of Four)의 디자인 패턴에서 행위 패턴에 속하는 것은?",
    "options": ['Builder', '❷ Visitor', 'Prototype', 'Bridge'],
    "a_num": 2,
  },
  // {
  //   "q_num": "00",
  //   "question": "",
  //   "options": ['', '', '', ''],
  //   "a_num": ,
  // },
];
