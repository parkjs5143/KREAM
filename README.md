# KREAM
### Kream 반응형 리셀 사이트 구축 (Spring-boot, RESTful API)
http://www.kream.co.kr

```
1. 기간 : 2021.09 ~ 2021.11
2. 환경 : Apache Tomcat v9.0 , Chrome 브라우저
3. 주제 : 반응형 리셀 사이트 구축
4. 개발툴 : IntelliJ, OracleDeveloper, Postman
5. 사용 언어 : Java(Spring-boot v2.5), HTML5, CSS3, Javascript(ES6)
6. 사용 기술 : Gradle, Spring Security5, JPA/Hibernate, Thymeleaf, SMTP(Mail Service), Cool SMS, Ajax, Open API(다음카카오)
7. 인원 : 프론트엔드 - 진서영, 김미정, 이재성, 소윤정, 박정순(나) / 백엔드 - 정영범
```

### 개요
Kream 은 한정판 상품의 정가품 여부, 하자 및 퀄리티 등을 정품인지 아닌지를 검수하여 판매자와 구매자 간 중개업을 하는 거래 플랫폼입니다.
기본적으로는 판매자와 구매자를 익명으로 연결해줍니다. 주식이나 암호 화폐 등의 거래 방식과 비슷하게 Maker가 판매 또는 구매를 원하는 가격을 제시하고, Taker가 해당 가격을 수락하는 식으로 이루어집니다. 호가 거래의 특성상, 물건이 모두 동일하다는 전제가 필요하기 때문에 중고품 등은 취급하지 않습니다.
주 거래 품목은 의류나 패션 잡화 등의 한정판 상품입니다. 그래픽 카드 대란이 일어난 후에는 그래픽 카드 되팔이 거래도 활발하게 이루어지고 있습니다.
또한 단순한 거래 중개 플랫폼에서 벗어나 패션과 리셀 시장을 즐기는 고객들이 상품과 콘텐츠를 기반으로 상호 소통할 수 있는 플랫폼을 지향합니다.

### 나의 역할 ( 기여도 20% )
- 로그인 / 회원가입 / 계정찾기
    - 로그인 (input 이벤트 발생할 때 마다 유효성 검사, submit 시 스프링 시큐리티 이용하여 loginSuccess, Faliure 구현)
    - 스프링 시큐리티로 권한마다 접근할 수 있는 페이지 설정, 사용자 인증,권한 부여
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
- 샵
    - 상품 구매 시 주소, 카드 선택하는 페이지
- 스타일 : 소셜 플랫폼 기능입니다. shop 에서 보여지는 상품들을 태그하여 사진을 포함한 게시물을 올릴 수 있습니다.
    - 스타일 계정 이미지, 이름, 계정 아이디 수정
    - 게시물 좋아요, 댓글 좋아요, 삭제, 대댓글 달기
    - 이미지 슬라이드(Swiper) API 활용

### ERD
![ERD1](https://user-images.githubusercontent.com/75155418/148678461-ab9cea87-8e25-4ce5-a6b4-9f7af6ca9174.png)

### 발표영상
https://youtu.be/quJpnHbCUFU

### 시연 영상
![video](https://github.com/jeongyoungbeom/KREAM/blob/main/image/%EB%8F%99%EC%98%81%EC%83%81.gif?raw=true)

### 로그인 페이지
![login](https://user-images.githubusercontent.com/75155418/145078943-eb6f41cf-d1a5-4f07-9a1d-8f1ef8684c07.png)

### 메인 페이지1
![main1](https://user-images.githubusercontent.com/75155418/145079118-ca5553e9-621a-447e-a1d2-0d5acb933267.png)

### 메인 페이지2
![main2](https://user-images.githubusercontent.com/75155418/145079033-48fc475b-64b5-43a1-b920-e4742a3dd2ef.png)

### 마이페이지
- 결제할 카드와 계좌, 주소를 등록할 수 있고 수정 · 삭제가 가능합니다.
- 구매 내역, 판매 내역을 조회할 수 있습니다. 카테고리가 대분류, 중분류로 나뉘어진 SPA로 제작하였습니다.
- 관심 상품 리스트를 조회/삭제할 수 있습니다.
![mypage](https://user-images.githubusercontent.com/75155418/145079167-71ddba85-5254-4e33-a3d8-0b6cfbf80dc5.png)

### 마이페이지
- 회원 정보 (이메일 주소, 비밀번호(기존 비밀번호 확인 후 변경), 이름, 휴대폰 번호, 사이즈, 광고 수신 동의 여부) 변경할 수 있습니다.
- 회원 탈퇴 페이지 (탈퇴 시 기존 정보가 일부 삭제되고 탈퇴 테이블로 넘어갑니다.)
![mypage_edit](https://user-images.githubusercontent.com/75155418/145079198-9de6ddae-dff8-49be-97ad-01a0fd2f0a36.png)

### shop 카테고리, 검색 페이지
![shop](https://user-images.githubusercontent.com/75155418/145079314-1e016004-c37f-45cd-bcf4-9ead8358021d.png)

### shop 상품 디테일 페이지
- 관리자가 상품의 이미지, 사이즈, 상세 정보를 등록하고 나면 판매를 원하는 사용자가 일정 가격에 판매를 등록하고, 구매를 원하는 사용자가 구매를 할 수 있습니다.
- 판매, 구매 모두 원하는 가격에 거래할 수 있도록 미리 예약을 걸어 놓을 수 있는 입찰 시스템이 마련되어있습니다.
- 따라서 구매자가 원하는 가격으로 입찰 구매를 등록 했을 경우 해당 가격으로 상품을 올리면 거래가 체결되고 자동으로 배송 테이블에 올라갑니다.
- 만약, 등록한 기한 이후까지 거래가 체결되지 않으면 거래가 불가합니다.
![shop1](https://user-images.githubusercontent.com/75155418/145079356-7b963b39-8027-46e2-a73a-0554681b3298.png)

### shop 구매 페이지
![shop2](https://user-images.githubusercontent.com/75155418/145079484-41727d2c-eefb-45e9-92cc-942041f79a20.png)

### style 인기게시물
- 사용자가 이미지를 여러 장 올릴 수 있고 shop에서 보여지는 상품과 인스타그램처럼 일반 해시태그를 태그할 수 있습니다.
![style](https://user-images.githubusercontent.com/75155418/145079568-ed3ce061-8321-43d6-9446-62d8c512f7e9.png)

### style 게시물 디테일
- 게시물에 좋아요, 댓글 기능을 구현했습니다. 댓글은 3계층형으로 이루어져 있으며 댓글마다 삭제, 좋아요를 할 수 있습니다.
- 계정 아이디와 이름, 소개, 이미지를 등록하고 수정할 수 있습니다.
<img width="1280" alt="style_info2" src="https://user-images.githubusercontent.com/75155418/145079613-af79ff15-bfed-4a91-beee-dbee841e7475.png">
<img width="1280" alt="style_info1" src="https://user-images.githubusercontent.com/75155418/145079726-e52654b0-585f-4527-a1cc-1f68b9155d61.png">

### 관리자페이지 대시보드
![image](https://user-images.githubusercontent.com/75155418/153438291-c434ae47-998b-4efa-b74c-aba5dd8f2446.png)

### 상품 등록/수정
![image](https://user-images.githubusercontent.com/75155418/153438243-788d9373-e9c4-44f8-a02e-f5be310dc5df.png)

### 공지사항&이벤트 등록/수정/삭제
![image](https://user-images.githubusercontent.com/75155418/153438206-bc866c36-da82-42b1-b772-f8237b0e1ee5.png)

### 회원관리(회원조회/블랙리스트 등록/관리자 권한부여/탈퇴회원 관리)
![image](https://user-images.githubusercontent.com/75155418/153438160-9a8dffa7-7a6b-489d-87fc-8fabe5057386.png)
