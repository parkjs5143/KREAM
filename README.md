# KREAM
### Kream 반응형 리셀 사이트 구축 (Spring-boot, RESTful API)
http://www.kream.co.kr

```
1. 기간 : 2021.08.15 ~ 2021.10.15
2. 환경 : Apache Tomcat v9.0 , Chrome 브라우저
3. 주제 : 반응형 리셀 사이트 구축
4. 개발 : IntelliJ, OracleDeveloper, Postman, 
5. 사용 언어 : Java(Spring-boot v2.5), HTML5, CSS3, Javascript(ES6)
6. 사용 기술 : axios, Ajax, Open API(다음카카오), SMTP(Mail Service), Cool SMS, Gradle, Spring Security5, JPA/Hibernate, Thymeleaf
```
### 주요 개발건
- 로그인 / 회원가입 / 계정찾기
    - 로그인 (onchange 이벤트 발생할 때 마다 유효성 검사, submit 시 스프링 시큐리티 이용하여 loginSuccess, Faliure 구현)
    - 스프링 시큐리티로 권한마다 접근할 수 있는 페이지 설정
    - 로그인 성공 시 사용자의 systemId값과 email값 세션 등록
    - 회원가입 (onchange 이벤트 발생할 때 마다 유효성 검사, Password Encoder 사용하여 단방향 비밀번호 암호화 )
    - 아이디 찾기 (서버 단에서 일부 아이디 *처리 후 프론트에 alert)
    - 비밀번호 찾기 (임시 비밀번호 생성 후 SMTP 사용하여 메일 발송)
- 헤더
    - 상품 검색 기능 구현, localStorage로 최근 검색어 구현
- 마이페이지
    - 구매,판매 내역 바닐라 자바스크립트만으로 SPA 구현 (카테고리 클릭 시 팝업 내용 및 출력 내용 변환)
    - 관심 상품 페이지
    - 정보 수정 페이지
    - 계좌/카드/주소 등록 및 수정 삭제 페이지
- 스타일
    - 스타일 계정 이미지, 이름, 계정 아이디 수정
    - 게시물 좋아요, 댓글 좋아요, 삭제, 대댓글 달기
    - 이미지 슬라이드(Swiper)
### 프로젝트 기술서
https://brick-booth-68a.notion.site/Kream-b4099274b5174bc5ab6a261a6d6a615f

### 구동 화면
###### 메인 페이지(게시물)
