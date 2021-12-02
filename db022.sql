
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
values(seq_customer.nextval, 'melon@melon.com','melon','222melon','010-0101-1111','260','Y','Y','Y','Y','GOLD','�Ϲ�','USER');

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
    CONSTRAINT product_gender CHECK (gender IN ( '����', '����', 'Ű��'))
);
insert into product (id, brand, collection, category, sub_category, name, gender, release, release_price, model_number, color, post_status, kor_name)
values(seq_product.NEXTVAL, '����', '����', '����Ŀ��', '����Ŀ��', '����ģ��', '����', '21/12/25', '2000000', '100-6867', 'purple', '�Խ���','�����');

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
values(seq_address.NEXTVAL, 1, '����', '010-1111-1111','12345','������å�','����');
insert into address (id, customer_id, name, hp, zipcode, detail1, detail2)
values(seq_address.NEXTVAL, 2, '���ϳ�', '010-2222-1111','33335','�پƳ��Ƴ�','����');
insert into address (id, customer_id, name, hp, zipcode, detail1, detail2)
values(seq_address.NEXTVAL, 3, '�ַ���', '010-3333-1111','44445','��������','����');
insert into address (id, customer_id, name, hp, zipcode, detail1, detail2)
values(seq_address.NEXTVAL, 4, '������', '010-4441-1111','11211','���������','��Ŀ');
insert into address (id, customer_id, name, hp, zipcode, detail1, detail2)
values(seq_address.NEXTVAL, 5, '�̸޷�', '010-5555-1111','44511','ū����;;','����');

create table account(
    id number(7) not null primary key,
    bank varchar2(20) default '��������',
    account_number varchar2(20) default '��������',
    name varchar2(20) default '��������',
    customer_id number(7) not null,
    CONSTRAINT fk_sales_email FOREIGN KEY (customer_id) REFERENCES customer(id)
);
insert into account(id, customer_id) values(seq_account.NEXTVAL, 1);
insert into account(id, customer_id) values(seq_account.NEXTVAL, 2);
insert into account(id, bank, account_number, name, customer_id) values(seq_account.NEXTVAL, '����', '420-1211-5577', '���Ƣ�', 3);
insert into account(id, bank, account_number, name, customer_id) values(seq_account.NEXTVAL, '�ϳ�', '5232-121-1272', '����', 4);
insert into account(id, bank, account_number, name, customer_id) values(seq_account.NEXTVAL, '����', '1200-111-1277', '������', 5);


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
values (seq_card_info.NEXTVAL, '�ϳ�', '2212414144','21','12/11','ON','0757',1);
insert into card_info (id, card_company, card_number, expiration, birthdate, card_flag, cardpw, customer_id) 
values (seq_card_info.NEXTVAL, '����', '9984557222','24','01/28','ON','1755',2);
insert into card_info (id, card_company, card_number, expiration, birthdate, card_flag, cardpw, customer_id) 
values (seq_card_info.NEXTVAL, '����', '109832344444','24','07/16','ON','0997',3);
insert into card_info (id, card_company, card_number, expiration, birthdate, card_flag, cardpw, customer_id) 
values (seq_card_info.NEXTVAL, 'ī��', '2408884656','23','06/24','ON','2547',4);
insert into card_info (id, card_company, card_number, expiration, birthdate, card_flag, cardpw, customer_id) 
values (seq_card_info.NEXTVAL, '�츮', '68147991100','22','07/27','ON','4137',5);


create table purchase(
    id  NUMBER(7) not null primary key,
    product_id number(20) not null, /*product ����*/
    customer_id number(20) not null, /* customer ���� */
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
values(seq_purchase.NEXTVAL, 2, 1, 100000, 1, '250', '��������','�߼ۿϷ�','����',1,6);
insert into purchase (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id)
values(seq_purchase.NEXTVAL, 3, 2, 200000, 2, '255', '��������','�߼ۿϷ�','����',2,7);
insert into purchase (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id)
values(seq_purchase.NEXTVAL, 4, 3, 300000, 3, '260', '��������','�߼ۿϷ�','����',3,8);
insert into purchase (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id)
values(seq_purchase.NEXTVAL, 5, 4, 400000, 4, '270', '��������','�߼ۿϷ�','����',4,9);
insert into purchase (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id)
values(seq_purchase.NEXTVAL, 6, 5, 500000, 5, '270', '��������','�߼ۿϷ�','����',5,10);

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
    CONSTRAINT fk_sales_product FOREIGN KEY (product_id) REFERENCES product(id), /* ��ǰ id ����*/
    CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id) REFERENCES customer(id), /* �� id ���� */
    CONSTRAINT fk_sales_card_info FOREIGN KEY (card_info_id) REFERENCES card_info(id),
    CONSTRAINT fk_sales_account FOREIGN KEY (account_id) REFERENCES account(id),
    CONSTRAINT fk_sales_address FOREIGN KEY (address_id) REFERENCES address(id)
);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 2, 1, 100000, 10, '250', '�Ǹ�����', '�߼ۿϷ�','�Ǹ�',1,6,6);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 3, 2, 100000, 10, '250', '�Ǹ�����', '�߼ۿϷ�','�Ǹ�',2,7,7);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 4, 3, 100000, 10, '250', '�Ǹ�����', '�߼ۿϷ�','�Ǹ�',3,8,8);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 5, 4, 100000, 10, '250', '�Ǹ�����', '�߼ۿϷ�','�Ǹ�',4,9,9);
insert into sales (id, product_id, customer_id, price, period, size_type, status1, status2, status3, address_id, card_info_id, account_id)
values(seq_sales.NEXTVAL, 6, 5, 100000, 10, '250', '�Ǹ�����', '�߼ۿϷ�','�Ǹ�',5,10,10);

create table delivery(
    id NUMBER(7) not null primary key,
    purchase_id number(7) not null,
    delivery_status VARCHAR2(50) not null, /*��� ����*/
    dev_company VARCHAR2(50) not null, /*��� ȸ��*/
    track_num number(30) not null,  /* �����ȣ */
    regdate DATE DEFAULT sysdate,
    CONSTRAINT fk_purchase_dev FOREIGN KEY (purchase_id) REFERENCES purchase(id)
);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 2, '�����', '����', 123546052);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 3, '�����', '������', 287050513);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 2, '�����', '������', 123546052);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 3, '�����', '����', 444440513);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 4, '�����', '����', 669997045);
insert into delivery(id, purchase_id, delivery_status, dev_company, track_num)
values(seq_delivery.NEXTVAL, 5, '�����', '����', 1506608879);

CREATE TABLE style (
    id  NUMBER(7) PRIMARY KEY,
    customer_id  Number(7) NOT NULL,
    content  VARCHAR2(5000) NOT NULL,
    hit  NUMBER(7) default 0,
    regdate DATE DEFAULT sysdate,
    constraint fk_user foreign key(customer_id) references customer(id)
);
insert into style(id, customer_id, content, hit)values(seq_style.NEXTVAL, 1, '���� �ʹ� ����', 12);
insert into style(id, customer_id, content, hit)values(seq_style.NEXTVAL, 2, '���� ��Ȱ���?', 60);
insert into style(id, customer_id, content, hit)values(seq_style.NEXTVAL, 3, '������ Ʋ����', 2);
insert into style(id, customer_id, content, hit)values(seq_style.NEXTVAL, 4, '�ѱ浵 Ʋ����', 102);
insert into style(id, customer_id, content)values(seq_style.NEXTVAL, 5, '������� �ڷ���');
insert into style(id, customer_id, content)values(seq_style.NEXTVAL, 1, '������� ��Ӱ�');
insert into style(id, customer_id, content)values(seq_style.NEXTVAL, 2, '�缺�� �缺��');

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
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '����', '����� ����˼���', '�ȳ�','�����Ŀ�');
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '����', '�ȳ�ȳ�ȳ�ȳ�ȳ�', '�ȳ�','�����Ŀ�');
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '����', '�ȳ�ȳ�ȳ�ȳ�ȳ�', '�ȳ�','�����Ŀ�');
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '����', '�ȳ�ȳ�ȳ�ȳ�', '�ȳ�','�����Ŀ�');
insert into board(id, category, title, content, registrant) values(seq_board.NEXTVAL, '����', '�ȳ�ȳ�ȳ�ȳ�ȳ�', '�ȳ�','�����Ŀ�');

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
values(seq_qna.NEXTVAL, '��ó��', '�̿빮��', 1, '����Ŭ ������','���� �����?');
insert into qna(id, status, type, customer_id, title, content) 
values(seq_qna.NEXTVAL, '��ó��', '���Ź���', 2, '��ī��','��������������̸��ſ���');
insert into qna(id, status, type, customer_id, title, content) 
values(seq_qna.NEXTVAL, '��ó��', '�̿빮��', 3, '���ϸ�������Ʈ','�ϰ���������פ�');
insert into qna(id, status, type, customer_id, title, content) 
values(seq_qna.NEXTVAL, '��ó��', '��������', 4, '���̛� �� �����ܰ� ���ɰ���','�Ѿ־֤��־�');
insert into qna(id, status, type, customer_id, title, content) 
values(seq_qna.NEXTVAL, '��ó��', '�ǸŹ���', 5, '�Ѿ־֤��־� ������','���� �Ѿ־֤��־�?');


create table style_reply (
    id         number(7) primary key,
    userid     varchar2(20) NOT NULL, /*��� �ۼ��� ���� ���̵�*/
    style_id   number(5) NOT NULL, /*��� ����� �Խñ� ��ȣ*/
    content    varchar2(20) NOT NULL,
    hit        number(5) default 0,
    parent_id  number(5), /*��� ���� class0 �θ�(���), class(1) ����*/
    depth      number(5),  /* ����� �׷�(��ۿ� ����� ����) */
    regdate    date default sysdate,
    CONSTRAINT fk_reply FOREIGN KEY ( userid ) REFERENCES customer ( userid ),
    CONSTRAINT fk_stylenum FOREIGN KEY ( style_id ) REFERENCES style (id)
);
INSERT INTO style_reply ( id, userid, style_id, content, hit, parent_id, depth) VALUES (
    seq_style_reply.NEXTVAL, 'apple', 1, '������', 0,0,0);
INSERT INTO style_reply ( id, userid, style_id, content, hit, parent_id, depth) VALUES (
    seq_style_reply.NEXTVAL, 'banana', 2, '������', 0,0,0);
    
CREATE TABLE product_tag (
    id          number(7) primary key,
    product_id  number(7) not null,
    style_id    number(7) not null, --��Ÿ�� �Խñ� id
    CONSTRAINT fk_userid_tag FOREIGN KEY ( product_id ) REFERENCES product ( id ),
    CONSTRAINT fk_styletag_tag FOREIGN KEY ( style_id ) REFERENCES style ( id )
);
insert into product_tag (id,product_id,style_id) values(seq_tag_id.nextval,2,1);
insert into product_tag (id,product_id,style_id) values(seq_tag_id.nextval,3,1);

CREATE TABLE hash_tag (
    id   NUMBER(10) NOT NULL primary key, 
    style_id  NUMBER(20) , --��Ÿ�� �Խñ� id
    tag_name  VARCHAR(100) NOT NULL,
    CONSTRAINT fk_hash_tag FOREIGN KEY ( style_id ) REFERENCES style ( id )
);
insert into hash_tag (id,style_id,tag_name) values(seq_hashtag.nextval,1,'������ÿ����');
insert into hash_tag (id,style_id,tag_name) values(seq_hashtag.nextval,1,'#��Ÿ��ç����');

create table search(
    id  NUMBER(7) not null primary key,
    customer_id number(20) not null,
    search_content varchar(500) not null,
    CONSTRAINT fk_search FOREIGN KEY (customer_id) REFERENCES customer (id)
);
insert into search (id, customer_id, search_content) values(seq_search.NEXTVAL, 3, '���̹�');


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

