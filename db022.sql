
CREATE SEQUENCE seq_address INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_account INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_board INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_card_info INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_customer INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_cart INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_delivery INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_hashtag INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_product INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_purchase INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_pro_size INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_pro_img INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_tag_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_qna INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_sales INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_search INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_style INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_style_reply INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_style_img INCREMENT BY 1 START WITH 1;


create table customer(
    id number(7) not null,
    email varchar2(20) not null unique,
    userid varchar2(20) not null unique,
    userpw varchar2(200) not null,
    hp varchar2(20) not null,
    shoesize varchar2(20),
    agreement varchar2(1) not null ,
    privacy_policy varchar2(1) not null,
    sms_allow varchar2(1) not null,
    email_allow varchar2(1) not null,
    image varchar2(1000),
    message varchar2(1000),
    rank varchar2(8) not null,
    point number(10) default 0,
    type varchar2(20) not null,
    role varchar2(20) not null,
    regdate date default sysdate,
    CONSTRAINT pk_customer PRIMARY KEY (id)
);
insert into customer (id, email, userid, userpw, hp, shoesize, agreement, privacy_policy, sms_allow, email_allow, rank, type, role)
values(seq_customer.nextval, 'melon@melon.com','melon','222melon','010-0101-1111','260','Y','Y','Y','Y','GOLD','일반','USER');

CREATE TABLE product (
    id           NUMBER(20) primary key,
    brand         VARCHAR2(50) NOT NULL,
    collection    VARCHAR2(50) NOT NULL,
    category      VARCHAR2(50) NOT NULL,
    sub_category varchar2(50) not null,
    name          VARCHAR2(100) NOT NULL,
    gender        VARCHAR2(10),
    release       VARCHAR2(50),
    release_price NUMBER(30),
    model_number  VARCHAR2(100),
    color         VARCHAR2(50),
    post_status   VARCHAR2(30),
    kor_name      VARCHAR2(100),
    regdate date default sysdate, 
    CONSTRAINT product_gender CHECK (gender IN ( '남성', '여성', '키즈'))
);
insert into product (id, brand, collection, category, sub_category, name, gender, release, release_price, model_number, color, post_status, kor_name)
values(seq_product.NEXTVAL, '윤정', '오산', '스니커즈', '스니커즈', '도란친구', '여성', '21/12/25', '2000000', '100-6867', 'purple', '게시중','가즈아');

create table address(
    id number(7) not null primary key,
    customer_id number(7) not null,
    name varchar2(20) not null,
    hp varchar2(20) not null,
    zipcode varchar2(20) not null,
    detail1 varchar2(20) not null,
    detail2 varchar2(20) not null,
    flag varchar(20) default 'OFF',
    regdate date default sysdate,
     constraint fk_add foreign key(customer_id) references customer(id)
);
insert into address (id, customer_id, name, hp, zipcode, detail1, detail2)
values(seq_address.NEXTVAL, 1, '김사과', '010-1111-1111','12345','사과마시쪙','굳굳');
insert into address (id, customer_id, name, hp, zipcode, detail1, detail2)
values(seq_address.NEXTVAL, 2, '반하나', '010-2222-1111','33335','바아나아나','길쭉');
insert into address (id, customer_id, name, hp, zipcode, detail1, detail2)
values(seq_address.NEXTVAL, 3, '최레몬', '010-3333-1111','44445','레몬은셔','동글');
insert into address (id, customer_id, name, hp, zipcode, detail1, detail2)
values(seq_address.NEXTVAL, 4, '오렌지', '010-4441-1111','11211','레드향사조','왕커');
insert into address (id, customer_id, name, hp, zipcode, detail1, detail2)
values(seq_address.NEXTVAL, 5, '이메론', '010-5555-1111','44511','큰참외;;','별루');

create table account(
    id number(7) not null primary key,
    bank varchar2(20) default '정보없음',
    account_number varchar2(20) default '정보없음',
    name varchar2(20) default '정보없음',
    customer_id number(7) not null,
    CONSTRAINT fk_sales_email FOREIGN KEY (customer_id) REFERENCES customer(id)
);
insert into account(id, customer_id) values(seq_account.NEXTVAL, 1);
insert into account(id, customer_id) values(seq_account.NEXTVAL, 2);
insert into account(id, bank, account_number, name, customer_id) values(seq_account.NEXTVAL, '국민', '420-1211-5577', '강아쥥', 3);
insert into account(id, bank, account_number, name, customer_id) values(seq_account.NEXTVAL, '하나', '5232-121-1272', '김사과', 4);
insert into account(id, bank, account_number, name, customer_id) values(seq_account.NEXTVAL, '신한', '1200-111-1277', '수정과', 5);


create table card_info(
    id number(7) not null primary key,
    card_company varchar2(50) not null,
    card_number varchar2(20) not null,
    expiration varchar2(20) not null,
    birthdate varchar2(20) not null,
    card_flag varchar2(20) not null,
    cardpw varchar2(20) not null,
    customer_id number(7) not null,
    constraint fk_card foreign key(customer_id) references customer(id)
);
insert into card_info (id, card_company, card_number, expiration, birthdate, card_flag, cardpw, customer_id) 
values (seq_card_info.NEXTVAL, '하나', '2212414144','21','12/11','ON','0757',1);
insert into card_info (id, card_company, card_number, expiration, birthdate, card_flag, cardpw, customer_id) 
values (seq_card_info.NEXTVAL, '신한', '9984557222','24','01/28','ON','1755',2);
insert into card_info (id, card_company, card_number, expiration, birthdate, card_flag, cardpw, customer_id) 
values (seq_card_info.NEXTVAL, '국민', '109832344444','24','07/16','ON','0997',3);
insert into card_info (id, card_company, card_number, expiration, birthdate, card_flag, cardpw, customer_id) 
values (seq_card_info.NEXTVAL, '카뱅', '2408884656','23','06/24','ON','2547',4);
insert into card_info (id, card_company, card_number, expiration, birthdate, card_flag, cardpw, customer_id) 
values (seq_card_info.NEXTVAL, '우리', '68147991100','22','07/27','ON','4137',5);


create table purchase(
    id  NUMBER(7) not null primary key,
    product_id number(20) not null, /*product 참조*/
    customer_id number(20) not null, /* customer 참조 */
    price number(30) not null,
    period number(7) not null,
    size_type varchar2(30) not null,
    status1 varchar2(30) not null,
    status2 varchar2(30) not null,
    status3 varchar2(30) not null,
    address_id number(7) not null,
    card_info_id number(7) not null,
    regdate DATE DEFAULT sysdate,
    CONSTRAINT fk_purchase_product FOREIGN KEY (product_id) REFERENCES product(id),
    CONSTRAINT fk_purchase_customer FOREIGN KEY (customer_id) REFERENCES customer(id),
    CONSTRAINT fk_purchase_card_info FOREIGN KEY (card_info_id) REFERENCES card_info(id),
    CONSTRAINT fk_purchase_address FOREIGN KEY (address_id) REFERENCES address(id)
);
insert into purchase (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id)
values(seq_purchase.NEXTVAL, 2, 1, 100000, 1, '250', '구매입찰','발송완료','구매',1,6);
insert into purchase (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id)
values(seq_purchase.NEXTVAL, 3, 2, 200000, 2, '255', '구매입찰','발송완료','구매',2,7);
insert into purchase (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id)
values(seq_purchase.NEXTVAL, 4, 3, 300000, 3, '260', '구매입찰','발송완료','구매',3,8);
insert into purchase (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id)
values(seq_purchase.NEXTVAL, 5, 4, 400000, 4, '270', '구매입찰','발송완료','구매',4,9);
insert into purchase (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id)
values(seq_purchase.NEXTVAL, 6, 5, 500000, 5, '270', '구매입찰','발송완료','구매',5,10);

create table sales(
    id  NUMBER(7) not null primary key,
    product_id number(20) not null, 
    customer_id number(20) not null, 
    price number(10) not null,
    period varchar2(20) not null,
    size_type varchar2(10) not null,
    status1 varchar2(30) not null,
    status2 varchar2(30) not null,
    status3 varchar2(30) not null,
    address_id number(7) not null,
    card_info_id number(7) not null,
    account_id number(7) not null,
    regdate date default sysdate,
    CONSTRAINT fk_sales_product FOREIGN KEY (product_id) REFERENCES product(id), /* 상품 id 참조*/
    CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id) REFERENCES customer(id), /* 고객 id 참조 */
    CONSTRAINT fk_sales_card_info FOREIGN KEY (card_info_id) REFERENCES card_info(id),
    CONSTRAINT fk_sales_account FOREIGN KEY (account_id) REFERENCES account(id),
    CONSTRAINT fk_sales_address FOREIGN KEY (address_id) REFERENCES address(id)
);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 2, 1, 100000, 10, '250', '판매입찰', '발송완료','판매',1,6,6);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 3, 2, 100000, 10, '250', '판매입찰', '발송완료','판매',2,7,7);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 4, 3, 100000, 10, '250', '판매입찰', '발송완료','판매',3,8,8);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 5, 4, 100000, 10, '250', '판매입찰', '발송완료','판매',4,9,9);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 6, 5, 100000, 10, '250', '판매입찰', '발송완료','판매',5,10,10);

create table delivery(
    id NUMBER(7) not null primary key,
    purchase_id number(7) not null,
    delivery_status VARCHAR2(50) not null, /*배송 상태*/
    dev_company VARCHAR2(50) not null, /*배송 회사*/
    track_num number(30) not null,  /* 송장번호 */
    regdate DATE DEFAULT sysdate,
    CONSTRAINT fk_purchase_dev FOREIGN KEY (purchase_id) REFERENCES purchase(id)
);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 2, '배송중', '로젠', 123546052);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 3, '배송중', '씨제이', 287050513);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 2, '배송중', '씨제이', 123546052);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 3, '배송중', '로젠', 444440513);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 4, '배송중', '로젠', 669997045);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 5, '배송중', '로젠', 1506608879);

CREATE TABLE style (
    id  NUMBER(7) PRIMARY KEY,
    customer_id  Number(7) NOT NULL,
    content  VARCHAR2(5000) NOT NULL,
    hit  NUMBER(7) default 0,
    regdate DATE DEFAULT sysdate,
    constraint fk_user foreign key(customer_id) references customer(id)
);
insert into style(id, customer_id, content, hit)values(seq_style.NEXTVAL, 1, '영이 너무 졸려', 12);
insert into style(id, customer_id, content, hit)values(seq_style.NEXTVAL, 2, '미정 배안고파?', 60);
insert into style(id, customer_id, content, hit)values(seq_style.NEXTVAL, 3, '영범은 틀딱이', 2);
insert into style(id, customer_id, content, hit)values(seq_style.NEXTVAL, 4, '한길도 틀딱이', 102);
insert into style(id, customer_id, content)values(seq_style.NEXTVAL, 5, '윤정언니 자러가');
insert into style(id, customer_id, content)values(seq_style.NEXTVAL, 1, '정순언니 밥머거');
insert into style(id, customer_id, content)values(seq_style.NEXTVAL, 2, '재성이 재성이');

create table cart(
    id number(7) not null,
    size_type varchar2(20) not null,
    customer_id number(7) not null,
    product_id number(10) not null,
    regdate date default sysdate,
    constraint fk_custom foreign key(customer_id) references customer(id),
    constraint fk_product foreign key(product_id) references product(id)
);
insert into cart(id, size_type, customer_id, product_id) values(seq_cart.NEXTVAL, '250',1,2);
insert into cart(id, size_type, customer_id, product_id) values(seq_cart.NEXTVAL, '250',2,3);
insert into cart(id, size_type, customer_id, product_id) values(seq_cart.NEXTVAL, '250',3,4);
insert into cart(id, size_type, customer_id, product_id) values(seq_cart.NEXTVAL, '250',4,5);
insert into cart(id, size_type, customer_id, product_id) values(seq_cart.NEXTVAL, '250',5,6);

create table pro_size(
    id  NUMBER(7) not null primary key,
    product_id number(20) not null,
    size_type varchar(100) not null,
    CONSTRAINT fk_prosize FOREIGN KEY (product_id) REFERENCES product(id)
);

insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '230');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '235');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '240');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '245');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '250');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '255');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '260');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '265');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '270');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '275');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '280');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 1, '285');

insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '230');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '235');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '240');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '245');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '250');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '255');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '260');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '265');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '270');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '275');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '280');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 2, '285');

insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '230');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '235');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '240');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '245');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '250');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '255');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '260');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '265');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '270');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '275');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '280');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 3, '285');

insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '230');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '235');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '240');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '245');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '250');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '255');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '260');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '265');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '270');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '275');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '280');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 4, '285');

insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '230');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '235');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '240');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '245');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '250');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '255');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '260');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '265');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '270');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '275');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '280');
insert into pro_size (id, product_id, size_type) values(seq_pro_size.NEXTVAL, 5, '285');

create table board(
    id number(7) not null,
    category varchar(20) not null,
    title varchar2(1000) not null,
    content varchar2(5000) not null,
    registrant varchar2(20) not null,
    regdate date default sysdate
);
drop table board;
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '공지', '기대할 쇼쇼쇼ㅛ쇼쇼숏', '안녕','미정파워');
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '공지', '안녕안녕안녕안녕안녕', '안녕','미정파워');
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '공지', '안녕안녕안녕안녕안녕', '안녕','미정파워');
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '공지', '안녕안녕안녕안녕', '안녕','미정파워');
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '공지', '안녕안녕안녕안녕안녕', '안녕','미정파워');

create table qna(
    id number(7) not null primary key,
    status varchar2(20) not null,
    type varchar2(20) not null,
    customer_id number(7) not null,
    title varchar2(100) not null,
    content varchar2(1000) not null,
    registrant varchar2(20),
    answer varchar2(20),
    acomment varchar2(200),
    regdate date default sysdate,
    constraint fk_custo_qna foreign key(customer_id) references customer(id)
);
drop table qna;
insert into qna(id, status, type, customer_id, title, content) 
values(seq_qna.NEXTVAL, '미처리', '이용문의', 1, '오라클 힘들어요','나만 힘드로?');
insert into qna(id, status, type, customer_id, title, content) 
values(seq_qna.NEXTVAL, '미처리', '구매문의', 2, '피카츄','조깦츄라이츄파이리꼽욱이');
insert into qna(id, status, type, customer_id, title, content) 
values(seq_qna.NEXTVAL, '미처리', '이용문의', 3, '포켓몬유나이트','하고시퍼이이잉ㅇ');
insert into qna(id, status, type, customer_id, title, content) 
values(seq_qna.NEXTVAL, '미처리', '계정문의', 4, '에이쏍 내 통잔잔고 반쪼가리','뿌애애ㅐ애앵');
insert into qna(id, status, type, customer_id, title, content) 
values(seq_qna.NEXTVAL, '미처리', '판매문의', 5, '뿌애애ㅐ애앵 힘들어요','나만 뿌애애ㅐ애앵?');


create table style_reply (
    id         number(7) primary key,
    userid     varchar2(20) NOT NULL, /*댓글 작성한 유저 아이디*/
    style_id   number(5) NOT NULL, /*댓글 저장된 게시글 번호*/
    content    varchar2(20) NOT NULL,
    hit        number(5) default 0,
    parent_id  number(5), /*댓글 계층 class0 부모(댓글), class(1) 대댓글*/
    depth      number(5),  /* 댓글의 그룹(댓글에 연결될 대댓글) */
    regdate    date default sysdate,
    CONSTRAINT fk_reply FOREIGN KEY ( userid ) REFERENCES customer ( userid ),
    CONSTRAINT fk_stylenum FOREIGN KEY ( style_id ) REFERENCES style (id)
);
INSERT INTO style_reply ( id, userid, style_id, content, hit, parent_id, depth) VALUES (
    seq_style_reply.NEXTVAL, 'apple', 1, '성공쓰', 0,0,0);
INSERT INTO style_reply ( id, userid, style_id, content, hit, parent_id, depth) VALUES (
    seq_style_reply.NEXTVAL, 'banana', 2, '성공쓰', 0,0,0);
    
CREATE TABLE product_tag (
    id          number(7) primary key,
    product_id  number(7) not null,
    style_id    number(7) not null, --스타일 게시글 id
    CONSTRAINT fk_userid_tag FOREIGN KEY ( product_id ) REFERENCES product ( id ),
    CONSTRAINT fk_styletag_tag FOREIGN KEY ( style_id ) REFERENCES style ( id )
);
insert into product_tag (id,product_id,style_id) values(seq_tag_id.nextval,2,1);
insert into product_tag (id,product_id,style_id) values(seq_tag_id.nextval,3,1);

CREATE TABLE hash_tag (
    id   NUMBER(10) NOT NULL primary key, 
    style_id  NUMBER(20) , --스타일 게시글 id
    tag_name  VARCHAR(100) NOT NULL,
    CONSTRAINT fk_hash_tag FOREIGN KEY ( style_id ) REFERENCES style ( id )
);
insert into hash_tag (id,style_id,tag_name) values(seq_hashtag.nextval,1,'가을룩첼린지');
insert into hash_tag (id,style_id,tag_name) values(seq_hashtag.nextval,1,'#스타일챌린지');

create table search(
    id  NUMBER(7) not null primary key,
    customer_id number(20) not null,
    search_content varchar(500) not null,
    CONSTRAINT fk_search FOREIGN KEY (customer_id) REFERENCES customer (id)
);
insert into search (id, customer_id, search_content) values(seq_search.NEXTVAL, 3, '쉬이바');


create table style_img(
    id  NUMBER(7) not null primary key,
    style_id number(20) not null,
    style_img varchar(500) not null,
    CONSTRAINT fk_styleimg FOREIGN KEY (style_id) REFERENCES style (id)
);

create table pro_img(
    id number(7) not null,
    orig_file_name varchar2(100) not null,
    file_path varchar2(100) not null,
    file_size varchar2(100) not null,
    product_id number(7) not null,
    regdate date default sysdate,
    CONSTRAINT fk_pro_img FOREIGN KEY (product_id) REFERENCES product(id)
);

