# chat

회원가입과 로그인으로 채팅을 하는 플러터 앱

## Getting Started

flutter, dart, firebase 서버이용

![](https://github.com/pswon5894/chat/blob/master/1%20%EB%A1%9C%EA%B7%B8%EC%9D%B8%20%ED%99%94%EB%A9%B4.jpg) 로그인 화면 | ![]([https://github.com/pswon5894/chat/blob/master/2%20%EC%B1%84%ED%8C%85%EC%B0%BD.jpg](https://github.com/pswon5894/chat/blob/master/2%20%EC%B1%97%20%EC%8A%A4%ED%81%AC%EB%A6%B0.png)) 채팅 화면
---|---|

## 보안점
firebase Auth는 사용자가 로그인하면 다음과 같은 방식으로 정보를 저장합니다:
토큰 기반 인증 유지: Firebase는 사용자의 인증 정보를 기반으로 ID 토큰과 Refresh 토큰을 발급
발급된 refresh 토큰이 무기한 로그인 유지를 해준다, 로그인된 기기 분실시 보안 문제, 모든 기기 로그아웃 기능 추가 필요

등록 이메일로 비밀번호 분실시 비밀번호 초기화 기능 미구현
