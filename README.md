# KREAM
### Kream 반응형 리셀 사이트 구축 (Spring-boot, RESTful API)
http://www.kream.co.kr

```
1. 기간 : 2021.08.15 ~ 2021.10.15
2. 환경 : Apache Tomcat v9.0 , Chrome 브라우저
3. 주제 : 반응형 리셀 사이트 구축
4. 개발툴 : IntelliJ, OracleDeveloper, Postman
5. 사용 언어 : Java(Spring-boot v2.5), HTML5, CSS3, Javascript(ES6)
6. 사용 기술 : Gradle, Spring Security5, JPA/Hibernate, Thymeleaf, SMTP(Mail Service), Cool SMS, Ajax, Open API(다음카카오)
```

### 주요 개발건(나의 역할)
- 로그인 / 회원가입 / 계정찾기
    - 로그인 (input 이벤트 발생할 때 마다 유효성 검사, submit 시 스프링 시큐리티 이용하여 loginSuccess, Faliure 구현)
    - 스프링 시큐리티로 권한마다 접근할 수 있는 페이지 설정
    - 로그인 성공 시 사용자의 systemId값과 email값 세션 등록
    - 회원가입 (input 이벤트 발생할 때 마다 유효성 검사, Password Encoder 사용하여 단방향 비밀번호 암호화 )
    - 아이디 찾기 (서버 단에서 일부 아이디 *처리 후 프론트에 alert)
    - 비밀번호 찾기 (임시 비밀번호 생성 후 SMTP 사용하여 메일 발송)
- 헤더
    - 상품 검색 기능 구현, localStorage로 최근 검색어 구현
- 마이페이지
    - 구매,판매 내역 바닐라 자바스크립트 이용, SPA 구현 (카테고리 클릭 시 팝업 내용 및 출력 내용 변환)
    - 관심 상품 페이지
    - 정보 수정 페이지
    - 계좌/카드/주소 등록 및 수정 삭제 페이지
- 스타일
    - 스타일 계정 이미지, 이름, 계정 아이디 수정
    - 게시물 좋아요, 댓글 좋아요, 삭제, 대댓글 달기
    - 이미지 슬라이드(Swiper) API 활용

# 구동 화면
### 시연영상
https://youtu.be/quJpnHbCUFU

![video](https://github.com/jeongyoungbeom/KREAM/blob/main/image/%EB%8F%99%EC%98%81%EC%83%81.gif?raw=true)

### ERD
![ERD1](https://user-images.githubusercontent.com/75155418/148678461-ab9cea87-8e25-4ce5-a6b4-9f7af6ca9174.png)

### 로그인 페이지
![login](https://user-images.githubusercontent.com/75155418/145078943-eb6f41cf-d1a5-4f07-9a1d-8f1ef8684c07.png)

### 메인 페이지1
![main1](https://user-images.githubusercontent.com/75155418/145079118-ca5553e9-621a-447e-a1d2-0d5acb933267.png)

### 메인 페이지2
![main2](https://user-images.githubusercontent.com/75155418/145079033-48fc475b-64b5-43a1-b920-e4742a3dd2ef.png)

### 마이페이지1
![mypage](https://user-images.githubusercontent.com/75155418/145079167-71ddba85-5254-4e33-a3d8-0b6cfbf80dc5.png)

### 마이페이지2
![mypage_edit](https://user-images.githubusercontent.com/75155418/145079198-9de6ddae-dff8-49be-97ad-01a0fd2f0a36.png)

### shop 카테고리, 검색 페이지
![shop](https://user-images.githubusercontent.com/75155418/145079314-1e016004-c37f-45cd-bcf4-9ead8358021d.png)

### shop 상품 디테일 페이지
![shop1](https://user-images.githubusercontent.com/75155418/145079356-7b963b39-8027-46e2-a73a-0554681b3298.png)

### shop 구매 페이지
![shop2](https://user-images.githubusercontent.com/75155418/145079484-41727d2c-eefb-45e9-92cc-942041f79a20.png)

### style 인기게시물
![style](https://user-images.githubusercontent.com/75155418/145079568-ed3ce061-8321-43d6-9446-62d8c512f7e9.png)

### style 게시물 디테일
<img width="1280" alt="style_info2" src="https://user-images.githubusercontent.com/75155418/145079613-af79ff15-bfed-4a91-beee-dbee841e7475.png">
<img width="1280" alt="style_info1" src="https://user-images.githubusercontent.com/75155418/145079726-e52654b0-585f-4527-a1cc-1f68b9155d61.png">


