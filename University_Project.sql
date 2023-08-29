/*
drop table notice;
drop table student_lecture;
drop table basket;
drop table lecture;
drop table student_img;
drop table student;
drop table admin;
drop table department;
drop table college;
*/

/*대학 목록*/
create table college(
    college_code varchar2(10) not null primary key,
    college_name varchar2(50) not null
);

insert into college values('H','인문대학');
insert into college values('C','상경대학');
insert into college values('E','공과대학');
insert into college values('S','사회과학대학');
insert into college values('F','외국어대학');
insert into college values('GE','교양대학');

/*학과 목록*/
create table department(
    depart_code number not null primary key,
    college_code varchar2(10) not null,
    depart_name varchar2(50) not null,
    CONSTRAINT college_code foreign key(college_code) references college(college_code)
);

insert into department values(11,'H','철학과');
insert into department values(12,'H','사학과');
insert into department values(13,'H','국어국문학과');
insert into department values(14,'H','문예창작학과');
insert into department values(15,'H','언어학과');

insert into department values(21,'C','국제통상학과');
insert into department values(22,'C','경제학과');
insert into department values(23,'C','경영학과');
insert into department values(24,'C','회계학과');
insert into department values(25,'C','무역학과');

insert into department values(31,'E','기계공학과');
insert into department values(32,'E','자동차공학과');
insert into department values(33,'E','컴퓨터공학과');
insert into department values(34,'E','신소재공학과');
insert into department values(35,'E','건축공학과');

insert into department values(41,'S','심리학과');
insert into department values(42,'S','정치외교학과');
insert into department values(43,'S','국제학과');
insert into department values(44,'S','행정학과');
insert into department values(45,'S','언론정보학과');

insert into department values(51,'F','중국어과');
insert into department values(52,'F','영어과');
insert into department values(53,'F','러시아어과');
insert into department values(54,'F','스페인어과');
insert into department values(55,'F','포르투갈어과');

insert into department values(10,'GE','교양');


/* 입학처용 학생 DB */
/*
create table student_admissions(
    depart_code number not null,
    name varchar2(30) not null,
    birth date not null,
    create_date date not null,
    post varchar2(10),
    address_1 varchar2(500),
    address_2 varchar2(1000),
    email varchar2(100),
    phone varchar2(30),
    CONSTRAINT depart_code_student_admissions foreign key(depart_code) references department(depart_code)
);
*/

/* 관리자 */
/*
create table admin(
    id NUMBER not null primary key,
    email varchar2(100),
    phone varchar2(30)
);
*/

/*학생*/
create table student(
    id NUMBER unique,
    password varchar2(100),
    name varchar2(30) not null,
    depart_code number not null,
    depart_name varchar2(50) not null,
    academic_status number default 0 not null ,
    score_avg number(15,2) default 0.00,
    credit_full number default 0,
    birth date not null,
    post varchar2(10),
    address_1 varchar2(500),
    address_2 varchar2(1000),
    email varchar2(100),
    phone varchar2(30),
    create_date date not null,
    CONSTRAINT depart_code_student foreign key(depart_code) references department(depart_code)
);

/*학생 사진*/
create table student_img(
    id NUMBER not null primary key,
    regDate date not null,
    updateDate date,
    created_by varchar2(100),
    modified_by varchar2(100),
    img_name varchar2(300),
    img_url varchar2(300),
    ori_img_name varchar2(300),
    CONSTRAINT img_id foreign key(id) references student(id)
);

/*강의*/
create table lecture(
    lecture_code number not null primary key,
    depart_code number not null,
    college_code varchar2(10) not null,
    lecture_name varchar2(100) not null,
    professor_name varchar2(30) not null,
    grade number not null,
    classroom varchar2(50) not null,
    lecture_time varchar2(50) not null,
    lecture_year number not null,
    semester varchar2(30) not null,
    student_full number,
    credit number not null,
    CONSTRAINT depart_code_lecture foreign key(depart_code) references department(depart_code),
    CONSTRAINT college_code_lecture foreign key(college_code) references college(college_code)
);

/*수강신청 장바구니*/
create table basket(
    id NUMBER not null,
    lecture_code number not null,
    lecture_name varchar2(100) not null,
    professor_name varchar2(30) not null,
    grade number not null,
    classroom varchar2(50) not null,
    lecture_time varchar2(50) not null,
    lecture_year number not null,
    semester varchar2(30) not null,
    credit number not null,
    CONSTRAINT basket_id foreign key(id) references student(id)
);

/*나의 강의*/
create table student_lecture(
    id number not null,
    lecture_code number,
    lecture_name varchar2(100),  
    professor_name varchar2(30), 
    grade number not null,
    classroom varchar2(50),   
    lecture_time varchar2(50), 
    lecture_year number, 
    semester varchar2(30),
    midterm_exam number,
    final_exam number,
    total number(3,2),         --학기 평균 값
    CONSTRAINT student_lecture_id foreign key(id) references student(id)
);

/*공지사항*/
create table notice(
    notice_num number not null primary key,
    id number not null,
    title varchar2(100) not null,
    sort varchar2(30) not null,
    content varchar2(1000) not null,
    create_date date not null,
    modify_date date,
    views number not null,
    CONSTRAINT admin_id foreign key(id) references admin(id)
);

commit;

--------------------------------------------------------------------------------

delete from lecture;

/*가톨릭대 철학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(110,11,'H','철학의흐름_1','신승환',1,'철학관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(111,11,'H','고대철학사_1','박승찬',1,'철학관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(112,11,'H','동양철학입문_1','이창우',1,'철학관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(113,11,'H','서양철학입문_1','이다은',1,'철학관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(114,11,'H','논리학_1','백민정',1,'철학관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(115,11,'H','철학의흐름_2','신승환',1,'철학관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(116,11,'H','고대철학사_2','박승찬',1,'철학관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(117,11,'H','동양철학입문_2','이창우',1,'철학관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(118,11,'H','서양철학입문_2','이다은',1,'철학관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(119,11,'H','논리학_2','백민정',1,'철학관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(120,11,'H','노장철학_1','신승환',2,'철학관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(121,11,'H','중세철학사_1','박승찬',2,'철학관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(122,11,'H','동양철학심화_1','이창우',2,'철학관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(123,11,'H','서양철학심화_1','이다은',2,'철학관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(124,11,'H','윤리학_1','백민정',2,'철학관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(125,11,'H','노장철학_2','신승환',2,'철학관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(126,11,'H','중세철학사_2','박승찬',2,'철학관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(127,11,'H','동양철학심화_2','이창우',2,'철학관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(128,11,'H','서양철학심화_2','이다은',2,'철학관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(129,11,'H','윤리학_2','백민정',2,'철학관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(130,11,'H','형이상학_1','신승환',3,'철학관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(131,11,'H','근대철학사_1','박승찬',3,'철학관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(132,11,'H','철학교과교육론_1','이창우',3,'철학관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(133,11,'H','철학적인간학_1','이다은',3,'철학관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(134,11,'H','플라톤철학_1','백민정',3,'철학관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(135,11,'H','형이상학_2','신승환',3,'철학관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(136,11,'H','근대철학사_2','박승찬',3,'철학관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(137,11,'H','철학교과교육론_2','이창우',3,'철학관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(138,11,'H','철학적인간학_2','이다은',3,'철학관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(139,11,'H','플라톤철학_2','백민정',3,'철학관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(140,11,'H','역사철학_1','신승환',4,'철학관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(141,11,'H','현대철학사_1','박승찬',4,'철학관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(142,11,'H','토미즘철학_1','이창우',4,'철학관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(143,11,'H','에로스와철학_1','이다은',4,'철학관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(144,11,'H','아리스토텔레스철학_1','백민정',4,'철학관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(145,11,'H','역사철학_2','신승환',4,'철학관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(146,11,'H','현대철학사_2','박승찬',4,'철학관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(147,11,'H','토미즘철학_2','이창우',4,'철학관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(148,11,'H','에로스와철학_2','이다은',4,'철학관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(149,11,'H','아리스토텔레스철학_2','백민정',4,'철학관 405호','T',2023,'2학기',3);

/*가톨릭대 사학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(210,12,'H','한국사학입문_1','채웅석',1,'사학관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(211,12,'H','국사학현장실습Ⅰ_1','정연태',1,'사학관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(212,12,'H','동아시아의역사와문화_1','허태구',1,'사학관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(213,12,'H','서양의역사와문화_1','기경량',1,'사학관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(214,12,'H','동아시아고중세사_1','김재원',1,'사학관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(215,12,'H','한국사학입문_2','채웅석',1,'사학관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(216,12,'H','국사학현장실습Ⅰ_2','정연태',1,'사학관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(217,12,'H','동아시아의역사와문화_2','허태구',1,'사학관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(218,12,'H','서양의역사와문화_2','기경량',1,'사학관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(219,12,'H','동아시아고중세사_2','김재원',1,'사학관 105호','E',2023,'2학기',3);


insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(220,12,'H','기록관리학의이해_1','채웅석',2,'사학관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(221,12,'H','국사학현장실습Ⅱ_1','정연태',2,'사학관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(222,12,'H','동아시아역사분쟁_1','허태구',2,'사학관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(223,12,'H','북한의역사와문화_1','기경량',2,'사학관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(224,12,'H','동아시아근현대사_1','김재원',2,'사학관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(225,12,'H','기록관리학의이해_2','채웅석',2,'사학관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(226,12,'H','국사학현장실습Ⅱ_2','정연태',2,'사학관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(227,12,'H','동아시아역사분쟁_2','허태구',2,'사학관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(228,12,'H','북한의역사와문화_2','기경량',2,'사학관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(229,12,'H','동아시아근현대사_2','김재원',2,'사학관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(230,12,'H','역사교과교육론_1','채웅석',3,'사학관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(231,12,'H','국사학현장실습Ⅲ_1','정연태',3,'사학관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(232,12,'H','사료로보는한국사_1','허태구',3,'사학관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(233,12,'H','역사콘텐츠캡스톤디자인_1','기경량',3,'사학관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(234,12,'H','서양고중세사_1','김재원',3,'사학관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(235,12,'H','역사교과교육론_2','채웅석',3,'사학관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(236,12,'H','국사학현장실습Ⅲ_2','정연태',3,'사학관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(237,12,'H','사료로보는한국사_2','허태구',3,'사학관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(238,12,'H','역사콘텐츠캡스톤디자인_2','기경량',3,'사학관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(239,12,'H','서양고중세사_2','김재원',3,'사학관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(240,12,'H','기록관리학의이해_1','채웅석',4,'사학관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(241,12,'H','국사학현장실습Ⅳ_1','정연태',4,'사학관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(242,12,'H','전근대한국사회의경제와생활_1','허태구',4,'사학관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(243,12,'H','한국사인물탐구_1','기경량',4,'사학관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(244,12,'H','서양근현대사_1','김재원',4,'사학관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(245,12,'H','기록관리학의이해_2','채웅석',4,'사학관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(246,12,'H','국사학현장실습Ⅳ_2','정연태',4,'사학관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(247,12,'H','전근대한국사회의경제와생활_2','허태구',4,'사학관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(248,12,'H','한국사인물탐구_2','기경량',4,'사학관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(249,12,'H','서양근현대사_2','김재원',4,'사학관 405호','T',2023,'2학기',3);

/*가톨릭대 국어국문학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(310,13,'H','문학개론_1','이지양',1,'사학관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(311,13,'H','언어학개론_1','김지연',1,'사학관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(312,13,'H','국어국문학현장실습Ⅰ_1','배주채',1,'사학관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(313,13,'H','국어교과교육론_1','이택동',1,'사학관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(314,13,'H','국어교과교재연구및지도법_1','송성욱',1,'사학관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(315,13,'H','문학개론_2','이지양',1,'사학관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(316,13,'H','언어학개론_2','김지연',1,'사학관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(317,13,'H','국어국문학현장실습Ⅰ_2','배주채',1,'사학관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(318,13,'H','국어교과교육론_2','이택동',1,'사학관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(319,13,'H','국어교과교재연구및지도법_2','송성욱',1,'사학관 105호','E',2023,'2학기',3);


insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(320,13,'H','대중매체와한국어_1','이지양',2,'사학관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(321,13,'H','드라마콘텐츠의이해_1','김지연',2,'사학관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(322,13,'H','국어국문학현장실습Ⅱ_1','배주채',2,'사학관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(323,13,'H','매체언어자료강독_1','이택동',2,'사학관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(324,13,'H','문학치료_1','송성욱',2,'사학관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(325,13,'H','대중매체와한국어_2','이지양',2,'사학관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(326,13,'H','드라마콘텐츠의이해_2','김지연',2,'사학관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(327,13,'H','국어국문학현장실습Ⅱ_2','배주채',2,'사학관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(328,13,'H','매체언어자료강독_2','이택동',2,'사학관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(329,13,'H','문학치료_2','송성욱',2,'사학관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(330,13,'H','세계문화와창의적시읽기_1','이지양',3,'사학관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(331,13,'H','외국어로서의한국어_1','김지연',3,'사학관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(332,13,'H','국어국문학현장실습Ⅲ_1','배주채',3,'사학관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(333,13,'H','의사소통과화용론_1','이택동',3,'사학관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(334,13,'H','의사소통교육론_1','송성욱',3,'사학관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(335,13,'H','역사교과교육론_2','이지양',3,'사학관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(336,13,'H','국사학현장실습Ⅲ_2','김지연',3,'사학관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(337,13,'H','사료로보는한국사_2','배주채',3,'사학관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(338,13,'H','의사소통과화용론_2','이택동',3,'사학관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(339,13,'H','의사소통교육론_2','송성욱',3,'사학관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(340,13,'H','한국고전시가론_1','이지양',4,'사학관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(341,13,'H','한국문학교육론_1','김지연',4,'사학관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(342,13,'H','국어국문학현장실습Ⅳ_1','배주채',4,'사학관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(343,13,'H','한국어문법_1','이택동',4,'사학관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(344,13,'H','한국한문학론_1','송성욱',4,'사학관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(345,13,'H','한국고전시가론_2','이지양',4,'사학관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(346,13,'H','한국문학교육론_2','김지연',4,'사학관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(347,13,'H','국어국문학현장실습Ⅳ_2','배주채',4,'사학관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(348,13,'H','한국어문법_2','이택동',4,'사학관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(349,13,'H','한국한문학론_2','송성욱',4,'사학관 405호','T',2023,'2학기',3);

/*명지대 문예창작과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(410,14,'H','시의이해_1','신수정',1,'문창관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(411,14,'H','소설의이해_1','남진우',1,'문창관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(412,14,'H','희곡의이해_1','편혜영',1,'문창관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(413,14,'H','문장연습_1','박상수',1,'문창관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(414,14,'H','아동문학론_1','양근애',1,'문창관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(415,14,'H','시의이해_2','신수정',1,'문창관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(416,14,'H','소설의이해_2','남진우',1,'문창관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(417,14,'H','희곡의이해_2','편혜영',1,'문창관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(418,14,'H','문장연습_2','박상수',1,'문창관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(419,14,'H','아동문학론_2','양근애',1,'문창관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(420,14,'H','시창작론_1','신수정',2,'문창관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(421,14,'H','소설창작론_1','남진우',2,'문창관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(422,14,'H','희곡창작론_1','편혜영',2,'문창관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(423,14,'H','창작기초_1','박상수',2,'문창관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(424,14,'H','문학연구방법론_1','양근애',2,'문창관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(425,14,'H','시창작론_2','신수정',2,'문창관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(426,14,'H','소설창작론_2','남진우',2,'문창관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(427,14,'H','희곡창작론_2','편혜영',2,'문창관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(428,14,'H','창작기초_2','박상수',2,'문창관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(429,14,'H','문학연구방법론_2','양근애',2,'문창관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(430,14,'H','시창작연구1_1','신수정',3,'문창관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(431,14,'H','소설창작연구1_1','남진우',3,'문창관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(432,14,'H','소설구성론_1','편혜영',3,'문창관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(433,14,'H','현대시특강_1','박상수',3,'문창관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(434,14,'H','시창작과문학사_1','양근애',3,'문창관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(435,14,'H','시창작연구1_2','신수정',3,'문창관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(436,14,'H','소설창작연구1_2','남진우',3,'문창관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(437,14,'H','소설구성론_2','편혜영',3,'문창관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(438,14,'H','현대시특강_2','박상수',3,'문창관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(439,14,'H','시창작과문학사_2','양근애',3,'문창관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(440,14,'H','편집기술론_1','신수정',4,'문창관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(441,14,'H','한국문학교육론_1','남진우',4,'문창관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(442,14,'H','문학치유론_1','편혜영',4,'문창관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(443,14,'H','현대희곡특강_1','박상수',4,'문창관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(444,14,'H','시창작과비평_1','양근애',4,'문창관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(445,14,'H','편집기술론_2','신수정',4,'문창관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(446,14,'H','한국문학교육론_2','남진우',4,'문창관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(447,14,'H','문학치유론_2','편혜영',4,'문창관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(448,14,'H','현대희곡특강_2','박상수',4,'문창관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(449,14,'H','시창작과비평_2','양근애',4,'문창관 405호','T',2023,'2학기',3);

/*서울대 언어학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(510,15,'H','언어와언어학_1','고희정',1,'문학관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(511,15,'H','말소리의세계_1','남승호',1,'문학관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(512,15,'H','언어와컴퓨터_1','박상철',1,'문학관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(513,15,'H','세계의언어_1','신효필',1,'문학관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(514,15,'H','만주어_1','이호영',1,'문학관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(515,15,'H','언어와언어학_2','고희정',1,'문학관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(516,15,'H','말소리의세계_2','남승호',1,'문학관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(517,15,'H','언어와컴퓨터_2','박상철',1,'문학관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(518,15,'H','세계의언어_2','신효필',1,'문학관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(519,15,'H','만주어_2','이호영',1,'문학관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(520,15,'H','언어학사_1','고희정',2,'문학관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(521,15,'H','형태론_1','남승호',2,'문학관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(522,15,'H','음운론_1','박상철',2,'문학관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(523,15,'H','역사비교언어학_1','신효필',2,'문학관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(524,15,'H','통사론_1','이호영',2,'문학관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(525,15,'H','언어학사_2','고희정',2,'문학관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(526,15,'H','형태론_2','남승호',2,'문학관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(527,15,'H','음운론_2','박상철',2,'문학관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(528,15,'H','역사비교언어학_2','신효필',2,'문학관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(529,15,'H','통사론_2','이호영',2,'문학관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(530,15,'H','의미론_1','고희정',3,'문학관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(531,15,'H','심리언어학_1','남승호',3,'문학관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(532,15,'H','특수언어특강_1','박상철',3,'문학관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(533,15,'H','컴퓨터언어학_1','신효필',3,'문학관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(534,15,'H','언어학을위한통계_1','이호영',3,'문학관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(535,15,'H','의미론_2','고희정',3,'문학관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(536,15,'H','심리언어학_2','남승호',3,'문학관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(537,15,'H','특수언어특강_2','박상철',3,'문학관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(538,15,'H','컴퓨터언어학_2','신효필',3,'문학관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(539,15,'H','언어학을위한통계_2','이호영',3,'문학관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(540,15,'H','사회언어학_1','고희정',4,'문학관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(541,15,'H','실험언어학_1','남승호',4,'문학관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(542,15,'H','화용론_1','박상철',4,'문학관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(543,15,'H','응용음성학_1','신효필',4,'문학관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(544,15,'H','심화통사론_1','이호영',4,'문학관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(545,15,'H','사회언어학_2','고희정',4,'문학관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(546,15,'H','실험언어학_2','남승호',4,'문학관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(547,15,'H','화용론_2','박상철',4,'문학관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(548,15,'H','응용음성학_2','신효필',4,'문학관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(549,15,'H','심화통사론_2','이호영',4,'문학관 405호','T',2023,'2학기',3); 

/*한국외대 국제통상학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(610,21,'C','경제학원론_1','김장열',1,'사회과학관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(611,21,'C','통계학','남수진',1,'사회과학관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(612,21,'C','Business Law','민희철',1,'사회과학관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(613,21,'C','경제발전연구','박상원',1,'사회과학관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(614,21,'C','Econometrics','박주현',1,'사회과학관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(615,21,'C','경제학원론_2','김장열',1,'사회과학관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(616,21,'C','경제수학','남수진',1,'사회과학관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(617,21,'C','International Law','민희철',1,'사회과학관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(618,21,'C','국제계약법','박상원',1,'사회과학관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(619,21,'C','국제무역이론','박주현',1,'사회과학관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(620,21,'C','거시경제분석','김장열',2,'사회과학관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(621,21,'C','국제통상법','남수진',2,'사회과학관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(622,21,'C','미시경제분석','민희철',2,'사회과학관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(623,21,'C','국제수지론','박상원',2,'사회과학관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(624,21,'C','Empirical Methods in Finance and Int Economics','박주현',2,'사회과학관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(625,21,'C','International Financial and Fiscal Law','김장열',2,'사회과학관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(626,21,'C','in International Business','남수진',2,'사회과학관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(627,21,'C','International Conflict and game Theory','민희철',2,'사회과학관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(628,21,'C','Law n International Finance','박상원',2,'사회과학관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(629,21,'C','국제경제발전사','박주현',2,'사회과학관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(630,21,'C','국제경제정책론_1','김장열',3,'사회과학관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(631,21,'C','국제경제현안분석','남수진',3,'사회과학관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(632,21,'C','국제투자정책론','민희철',3,'사회과학관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(633,21,'C','Legal Aspects of International Business','박상원',3,'사회과학관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(634,21,'C','International Investment Law','박주현',3,'사회과학관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(635,21,'C','Empirical Methods in Finance and Int‘l Economics','김장열',3,'사회과학관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(636,21,'C','International Relations_1','남수진',3,'사회과학관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(637,21,'C','Globalization and World Economy','민희철',3,'사회과학관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(638,21,'C','국제금융시장분석','박상원',3,'사회과학관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(639,21,'C','국제정치경제론','박주현',3,'사회과학관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(640,21,'C','북미지역경제론','김장열',4,'사회과학관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(641,21,'C','국제통상환경론','남수진',4,'사회과학관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(642,21,'C','Market Structure and International Trade_1','민희철',4,'사회과학관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(643,21,'C','BRICs 경제론_1','박상원',4,'사회과학관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(644,21,'C','International Organization_1','박주현',4,'사회과학관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(645,21,'C','국제경제정책론_2','김장열',4,'사회과학관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(646,21,'C','International Relations_2','남수진',4,'사회과학관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(647,21,'C','Market Structure and International Trade_2','민희철',4,'사회과학관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(648,21,'C','BRICs 경제론_2','박상원',4,'사회과학관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(649,21,'C','International Organization_2','박주현',4,'사회과학관 405호','T',2023,'2학기',3); 

/*가톨릭대 경제학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(710,22,'C','경제학개론_1','양준석',1,'경제관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(711,22,'C','게임이론','김명수',1,'경제관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(712,22,'C','거시경제학','김지영',1,'경제관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(713,22,'C','각국경제연구','허인',1,'경제관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(714,22,'C','거시경제학의이해','장인기',1,'경제관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(715,22,'C','경제학개론_2','양준석',1,'경제관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(716,22,'C','게임이론과응용','김명수',1,'경제관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(717,22,'C','미시경제학','김지영',1,'경제관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(718,22,'C','경제사','허인',1,'경제관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(719,22,'C','미시경제학의이해','장인기',1,'경제관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(720,22,'C','경제성장론','양준석',2,'경제관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(721,22,'C','경제수학','김명수',2,'경제관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(722,22,'C','경제정책세미나','김지영',2,'경제관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(723,22,'C','경제통계학','허인',2,'경제관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(724,22,'C','경제학설사','장인기',2,'경제관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(725,22,'C','경제학세미나','양준석',2,'경제관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(726,22,'C','경제학캡스톤디자인','김명수',2,'경제관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(727,22,'C','경제학현장실습','김지영',2,'경제관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(728,22,'C','계량경제연습','허인',2,'경제관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(729,22,'C','계량경제학','장인기',2,'경제관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(730,22,'C','공공경제학','양준석',3,'경제관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(731,22,'C','국제금융론','김명수',3,'경제관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(732,22,'C','국제무역론','김지영',3,'경제관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(733,22,'C','금융경제학','허인',3,'경제관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(734,22,'C','금융공학론','장인기',3,'경제관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(735,22,'C','금융시장론','양준석',3,'경제관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(736,22,'C','기업경제학','김명수',3,'경제관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(737,22,'C','노동경제학','김지영',3,'경제관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(738,22,'C','다국적기업론','허인',3,'경제관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(739,22,'C','도시및지역경제학','장인기',3,'경제관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(740,22,'C','법경제학','양준석',4,'경제관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(741,22,'C','산업.지역경제조사실습','김명수',4,'경제관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(742,22,'C','산업조직론','김지영',4,'경제관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(743,22,'C','시사경제','허인',4,'경제관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(744,22,'C','실험경제학','장인기',4,'경제관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(745,22,'C','재정학','양준석',4,'경제관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(746,22,'C','재정학세미나','김명수',4,'경제관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(747,22,'C','조세론','김지영',4,'경제관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(748,22,'C','화폐금융론','허인',4,'경제관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(749,22,'C','환경경제학','장인기',4,'경제관 405호','T',2023,'2학기',3); 

/*가톨릭대 경영학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(810,23,'C','경영학원론_1','김기찬',1,'경영관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(811,23,'C','마케팅','이동현',1,'경영관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(812,23,'C','생산경영','김용철',1,'경영관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(813,23,'C','인적자원관리','이홍주',1,'경영관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(814,23,'C','재무관리','박오원',1,'경영관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(815,23,'C','경영학원론_2','김기찬',1,'경영관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(816,23,'C','SCM모형과분석','이동현',1,'경영관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(817,23,'C','거시조직론','김용철',1,'경영관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(818,23,'C','경영과학','이홍주',1,'경영관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(819,23,'C','경영사례분석','박오원',1,'경영관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(820,23,'C','경영소프트웨어응용','김기찬',2,'경영관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(821,23,'C','경영전략론','이동현',2,'경영관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(822,23,'C','경영정보론','김용철',2,'경영관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(823,23,'C','경영통계','이홍주',2,'경영관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(824,23,'C','경영학과진로탐색','박오원',2,'경영관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(825,23,'C','경영학캡스톤디자인','김기찬',2,'경영관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(826,23,'C','경영학현장실습','이동현',2,'경영관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(827,23,'C','계량경영','김용철',2,'경영관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(828,23,'C','국제경영론','이홍주',2,'경영관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(829,23,'C','국제경영전략','박오원',2,'경영관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(830,23,'C','글로벌경영캡스톤디자인','김기찬',3,'경영관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(831,23,'C','글로벌스타트업사례연구','이동현',3,'경영관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(832,23,'C','글로벌시대의전략적사고','김용철',3,'경영관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(833,23,'C','기업가정신과경영','이홍주',3,'경영관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(834,23,'C','기업과사회','박오원',3,'경영관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(835,23,'C','기업생태계와상생경영','김기찬',3,'경영관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(836,23,'C','기업시민과사회가치경영','이동현',3,'경영관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(837,23,'C','기업윤리','김용철',3,'경영관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(838,23,'C','기업재무','이홍주',3,'경영관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(839,23,'C','다문화경영','박오원',3,'경영관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(840,23,'C','데이터과학과디지털경영','김기찬',4,'경영관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(841,23,'C','데이터과학을위한기초수학','이동현',4,'경영관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(842,23,'C','데이터과학을위한프로그래밍','김용철',4,'경영관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(843,23,'C','데이터베이스활용','이홍주',4,'경영관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(844,23,'C','디지털비즈니스','박오원',4,'경영관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(845,23,'C','리더십개발론','김기찬',4,'경영관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(846,23,'C','마케팅데이터분석','이동현',4,'경영관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(847,23,'C','마케팅커뮤니케이션','김용철',4,'경영관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(848,23,'C','비즈니스를위한데이터마이닝','이홍주',4,'경영관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(849,23,'C','비즈니스를위한딥러닝활용','박오원',4,'경영관 405호','T',2023,'2학기',3); 

/*가톨릭대 회계학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(910,24,'C','회계학원론_1','이세용',1,'회계관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(911,24,'C','관리회계','박희우',1,'회계관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(912,24,'C','중급회계1','김종일',1,'회계관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(913,24,'C','AI와회계','안성희',1,'회계관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(914,24,'C','AI와회계데이터분석','안성윤',1,'회계관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(915,24,'C','회계학원론_2','이세용',1,'회계관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(916,24,'C','IT활용관리회계','박희우',1,'회계관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(917,24,'C','IT활용재무회계','김종일',1,'회계관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(918,24,'C','IT활용회계의사결정','안성희',1,'회계관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(919,24,'C','고급회계','안성윤',1,'회계관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(920,24,'C','관리회계사례연구','이세용',2,'회계관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(921,24,'C','국제회계','박희우',2,'회계관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(922,24,'C','글로벌재무회계','김종일',2,'회계관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(923,24,'C','금융상품회계','안성희',2,'회계관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(924,24,'C','기업가치평가','안성윤',2,'회계관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(925,24,'C','기업지배구조와ESG','이세용',2,'회계관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(926,24,'C','법인세법','박희우',2,'회계관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(927,24,'C','법인세실무','김종일',2,'회계관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(928,24,'C','성과평가와보상','안성희',2,'회계관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(929,24,'C','세무회계연습','안성윤',2,'회계관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(930,24,'C','소득세법','이세용',3,'회계관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(931,24,'C','원가관리회계연습','박희우',3,'회계관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(932,24,'C','원가회계','김종일',3,'회계관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(933,24,'C','재무제표분석','안성희',3,'회계관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(934,24,'C','재무회계','안성윤',3,'회계관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(935,24,'C','재무회계연습','이세용',3,'회계관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(936,24,'C','전사적자원관리','박희우',3,'회계관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(937,24,'C','정부회계','김종일',3,'회계관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(938,24,'C','조세법개론','안성희',3,'회계관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(939,24,'C','중급회계2','안성윤',3,'회계관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(940,24,'C','컴퓨터활용과회계','이세용',4,'회계관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(941,24,'C','회계감사','박희우',4,'회계관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(942,24,'C','회계윤리','김종일',4,'회계관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(943,24,'C','회계정보시스템','안성희',4,'회계관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(944,24,'C','회계학과진로탐색','안성윤',4,'회계관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(945,24,'C','회계학세미나','이세용',4,'회계관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(946,24,'C','회계학캡스톤디자인','박희우',4,'회계관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(947,24,'C','회계학현장실습1','김종일',4,'회계관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(948,24,'C','회계학현장실습2','안성희',4,'회계관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(949,24,'C','코딩으로시작하는회계','안성윤',4,'회계관 405호','T',2023,'2학기',3); 

/*경희대 무역학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1010,25,'C','경제학원론_1','이재호',1,'무역관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1011,25,'C','무역학원론','정헌주',1,'무역관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1012,25,'C','국제경영론','김학민',1,'무역관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1013,25,'C','무역상무론','강인원',1,'무역관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1014,25,'C','해외지역연구개론','이상휘',1,'무역관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1015,25,'C','경제학원론_2','이재호',1,'무역관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1016,25,'C','회계원리','정헌주',1,'무역관 102호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1017,25,'C','무역정책론','김학민',1,'무역관 103호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1018,25,'C','글로벌비지니스정보시스템','강인원',1,'무역관 104호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1019,25,'C','글로벌금융정책론','이상휘',1,'무역관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1020,25,'C','무역통상협상론','이재호',2,'무역관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1021,25,'C','무역영어','정헌주',2,'무역관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1022,25,'C','FTA와관세','김학민',2,'무역관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1023,25,'C','정경렉처','강인원',2,'무역관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1024,25,'C','파생상품론','이상휘',2,'무역관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1025,25,'C','국제투자론','이재호',2,'무역관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1026,25,'C','무역창업론','정헌주',2,'무역관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1027,25,'C','국제마케팅','김학민',2,'무역관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1028,25,'C','국제무역론','강인원',2,'무역관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1029,25,'C','국제재무관리','이상휘',2,'무역관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1030,25,'C','글로벌경영전략','이재호',3,'무역관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1031,25,'C','국제물류관리','정헌주',3,'무역관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1032,25,'C','국제금융론','김학민',3,'무역관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1033,25,'C','국경간전자상거래','강인원',3,'무역관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1034,25,'C','무역통상법규','이상휘',3,'무역관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1035,25,'C','국제비지니스사례연구','이재호',3,'무역관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1036,25,'C','이머징마켓연구','정헌주',3,'무역관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1037,25,'C','무역빅데이터','김학민',3,'무역관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1038,25,'C','국제자원론','강인원',3,'무역관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1039,25,'C','외환론','이상휘',3,'무역관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1040,25,'C','국제산업분석론','이재호',4,'무역관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1041,25,'C','국제엠앤에이연구','정헌주',4,'무역관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1042,25,'C','무역실증분석','김학민',4,'무역관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1043,25,'C','인턴십','강인원',4,'무역관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1044,25,'C','무역통상이슈','이상휘',4,'무역관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1045,25,'C','비교문화경영론','이재호',4,'무역관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1046,25,'C','지역특화전자상거래무역','정헌주',4,'무역관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1047,25,'C','바이오헬스친환경무역','김학민',4,'무역관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1048,25,'C','상업교육론','강인원',4,'무역관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1049,25,'C','무역현장마케팅실습','이상휘',4,'무역관 405호','T',2023,'2학기',3); 

/*연세대 기계공학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1110,31,'E','공학수학_1','강건욱',1,'공학관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1111,31,'E','공학물리학및실험_1','강신일',1,'공학관 112호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1112,31,'E','공학화학및실험_1','김경식',1,'공학관 113호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1113,31,'E','기계공학창의설계','김대은',1,'공학관 114호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1114,31,'E','공학정보처리','김우철',1,'공학관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1115,31,'E','공학수학_2','강건욱',1,'공학관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1116,31,'E','공학물리학및실험_2','강신일',1,'공학관 112호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1117,31,'E','공학화학및실험_2','김경식',1,'공학관 113호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1118,31,'E','공학수학_3','김대은',1,'공학관 114호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1119,31,'E','공학수학_4','김우철',1,'공학관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1120,31,'E','고체역학','강건욱',2,'공학관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1121,31,'E','열역학','강신일',2,'공학관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1122,31,'E','컴퓨터응용기계설계','김경식',2,'공학관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1123,31,'E','유체역학','김대은',2,'공학관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1124,31,'E','동역학','김우철',2,'공학관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1125,31,'E','기계공학실험_1','강건욱',2,'공학관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1126,31,'E','공학수치해석','강신일',2,'공학관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1127,31,'E','확률통계','김경식',2,'공학관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1128,31,'E','기계공학실험_2','김대은',2,'공학관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1129,31,'E','기계진동','김우철',2,'공학관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1130,31,'E','열전달','강건욱',3,'공학관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1131,31,'E','생산공학','강신일',3,'공학관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1132,31,'E','메카니즘설계','김경식',3,'공학관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1133,31,'E','바이오의료기계','김대은',3,'공학관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1134,31,'E','마이크로기계시스템','김우철',3,'공학관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1135,31,'E','응용유체역학','강건욱',3,'공학관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1136,31,'E','재료거동학','강신일',3,'공학관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1137,31,'E','전자기학및응용','김경식',3,'공학관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1138,31,'E','환경기계공학','김대은',3,'공학관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1139,31,'E','기계요소설계','김우철',3,'공학관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1140,31,'E','응용고체역학','강건욱',4,'공학관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1141,31,'E','응용열역학','강신일',4,'공학관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1142,31,'E','메카트로닉스','김경식',4,'공학관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1143,31,'E','기계시스템제어','김대은',4,'공학관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1144,31,'E','생체역학','김우철',4,'공학관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1145,31,'E','공학재료','강건욱',4,'공학관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1146,31,'E','광공학','강신일',4,'공학관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1147,31,'E','정형생산시스템','김경식',4,'공학관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1148,31,'E','에너지동력공학','김대은',4,'공학관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1149,31,'E','나노기계공학','김우철',4,'공학관 405호','T',2023,'2학기',3); 

/*영남대 자동차공학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1210,32,'E','공학입문설계_1','강석원',1,'자동차관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1211,32,'E','미래자동차공학기초','권성진',1,'자동차관 122호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1212,32,'E','행렬및행렬식','김동욱',1,'자동차관 123호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1213,32,'E','소프트웨어와인공지능','박지혁',1,'자동차관 124호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1214,32,'E','전산기계제도','백종대',1,'자동차관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1215,32,'E','공학입문설계_2','강석원',1,'자동차관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1216,32,'E','임베디드시스템','권성진',1,'자동차관 122호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1217,32,'E','고체역학','김동욱',1,'자동차관 123호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1218,32,'E','공학설계','박지혁',1,'자동차관 124호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1219,32,'E','3D모델링','백종대',1,'자동차관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1220,32,'E','일반자동차기능실험','강석원',2,'자동차관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1221,32,'E','자동차전기전자회로','권성진',2,'자동차관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1222,32,'E','공업수학','김동욱',2,'자동차관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1223,32,'E','수치해석','박지혁',2,'자동차관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1224,32,'E','동역학','백종대',2,'자동차관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1225,32,'E','유체역학','강석원',2,'자동차관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1226,32,'E','전기자동차공학','권성진',2,'자동차관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1227,32,'E','전기자동차기능실험','김동욱',2,'자동차관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1228,32,'E','자동차전산구조해석','박지혁',2,'자동차관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1229,32,'E','ROS기반임베디드시스템응용','백종대',2,'자동차관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1230,32,'E','기계요소설계','강석원',3,'자동차관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1231,32,'E','미래자동차융합실험','권성진',3,'자동차관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1232,32,'E','자동차재료및가공','김동욱',3,'자동차관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1233,32,'E','열전달','박지혁',3,'자동차관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1234,32,'E','자동차공학','백종대',3,'자동차관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1235,32,'E','자동차전산열유체해석','강석원',3,'자동차관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1236,32,'E','자율주행자동차','권성진',3,'자동차관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1237,32,'E','자동차공학과제1(캡스톤디자인)','김동욱',3,'자동차관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1238,32,'E','3D모델링응용','박지혁',3,'자동차관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1239,32,'E','자동차생산공학','백종대',3,'자동차관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1240,32,'E','자동차전산Dynamics해석','강석원',4,'자동차관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1241,32,'E','자동차진동공학','권성진',4,'자동차관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1242,32,'E','자율주행센서','김동욱',4,'자동차관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1243,32,'E','자율주행인공지능','박지혁',4,'자동차관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1244,32,'E','전기모터','백종대',4,'자동차관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1245,32,'E','자동제어','강석원',4,'자동차관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1246,32,'E','자동차NVH','권성진',4,'자동차관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1247,32,'E','자동차공조시스템설계','김동욱',4,'자동차관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1248,32,'E','자동차인간공학','박지혁',4,'자동차관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1249,32,'E','e-파워트레인설계','백종대',4,'자동차관 405호','T',2023,'2학기',3); 

/*가톨릭대 컴퓨터공학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1310,33,'E','컴퓨터와프로그래밍_1','황병연',1,'컴퓨터관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1311,33,'E','객체지향패러다임','박정흠',1,'컴퓨터관 132호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1312,33,'E','객체지향프로그래밍설계','노상욱',1,'컴퓨터관 133호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1313,33,'E','논리회로및설계','서효중',1,'컴퓨터관 134호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1314,33,'E','다변량데이터분석','오재원',1,'컴퓨터관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1315,33,'E','컴퓨터와프로그래밍_2','황병연',1,'컴퓨터관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1316,33,'E','데이터베이스설계','박정흠',1,'컴퓨터관 132호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1317,33,'E','마이크로프로세서','노상욱',1,'컴퓨터관 133호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1318,33,'E','문제해결기법','서효중',1,'컴퓨터관 134호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1319,33,'E','선형대수학','오재원',1,'컴퓨터관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1320,33,'E','소프트웨어공학','황병연',2,'컴퓨터관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1321,33,'E','시스템성능분석','박정흠',2,'컴퓨터관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1322,33,'E','시스템소프트웨어실습','노상욱',2,'컴퓨터관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1323,33,'E','알고리즘설계','서효중',2,'컴퓨터관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1324,33,'E','오토마타','오재원',2,'컴퓨터관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1325,33,'E','운영체제','황병연',2,'컴퓨터관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1326,33,'E','유닉스프로그래밍설계','박정흠',2,'컴퓨터관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1327,33,'E','이산수학','노상욱',2,'컴퓨터관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1328,33,'E','인공지능','서효중',2,'컴퓨터관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1329,33,'E','인공지능프로그래밍설계','오재원',2,'컴퓨터관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1330,33,'E','임베디드및모바일기술과비즈니스모델','황병연',3,'컴퓨터관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1331,33,'E','자료구조','박정흠',3,'컴퓨터관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1332,33,'E','자료구조기초','노상욱',3,'컴퓨터관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1333,33,'E','종합설계프로젝트1','서효중',3,'컴퓨터관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1334,33,'E','창의소프트웨어설계','오재원',3,'컴퓨터관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1335,33,'E','컴파일러설계','황병연',3,'컴퓨터관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1336,33,'E','컴퓨터그래픽스','박정흠',3,'컴퓨터관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1337,33,'E','컴퓨터네트워크','노상욱',3,'컴퓨터관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1338,33,'E','컴퓨터정보공학특강','서효중',3,'컴퓨터관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1339,33,'E','컴퓨터정보공학현장실습1','오재원',3,'컴퓨터관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1340,33,'E','파일처리','황병연',4,'컴퓨터관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1341,33,'E','프로그래밍언어론','박정흠',4,'컴퓨터관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1342,33,'E','종합설계프로젝트2','노상욱',4,'컴퓨터관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1343,33,'E','컴퓨터정보공학현장실습2','서효중',4,'컴퓨터관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1344,33,'E','컴퓨터와인터넷','오재원',4,'컴퓨터관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1345,33,'E','사이버스페이스의정보윤리','황병연',4,'컴퓨터관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1346,33,'E','코딩과알고리즘','박정흠',4,'컴퓨터관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1347,33,'E','컴퓨터정보공학현장실습3','노상욱',4,'컴퓨터관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1348,33,'E','컴퓨터정보공학현장실습4','서효중',4,'컴퓨터관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1349,33,'E','종합설계프로젝트3','오재원',4,'컴퓨터관 405호','T',2023,'2학기',3); 

/*연세대 신소재공학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1410,34,'E','재료수학','강달영',1,'제4공학관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1411,34,'E','고체화학','고대홍',1,'제4공학관 142호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1412,34,'E','고체물리','김상우',1,'제4공학관 143호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1413,34,'E','재료과학','김형진',1,'제4공학관 144호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1414,34,'E','재료열역학','명재민',1,'제4공학관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1415,34,'E','결정학','강달영',1,'제4공학관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1416,34,'E','상평형 및 전이론','고대홍',1,'제4공학관 142호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1417,34,'E','신소재공학입문','김상우',1,'제4공학관 143호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1418,34,'E','재료공학기초실험','김형진',1,'제4공학관 144호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1419,34,'E','재료설계및평가','명재민',1,'제4공학관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1420,34,'E','탐구설계','강달영',2,'제4공학관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1421,34,'E','재료의전자기적성질','고대홍',2,'제4공학관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1422,34,'E','재료의기계적성질','김상우',2,'제4공학관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1423,34,'E','재료의광학적성질','김형진',2,'제4공학관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1424,34,'E','재료의화학적성질','명재민',2,'제4공학관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1425,34,'E','이동현상론','강달영',2,'제4공학관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1426,34,'E','계면및표면특성','고대홍',2,'제4공학관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1427,34,'E','재료역학','김상우',2,'제4공학관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1428,34,'E','재료결함론','김형진',2,'제4공학관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1429,34,'E','재료반응속도론','명재민',2,'제4공학관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1430,34,'E','고분자구조설계','강달영',3,'제4공학관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1431,34,'E','전산재료학','고대홍',3,'제4공학관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1432,34,'E','반도체공학','김상우',3,'제4공학관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1433,34,'E','세라믹물성론','김형진',3,'제4공학관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1434,34,'E','소결공학','명재민',3,'제4공학관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1435,34,'E','X선회절분석론','강달영',3,'제4공학관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1436,34,'E','생물유기재료공학','고대홍',3,'제4공학관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1437,34,'E','재료접합공학','김상우',3,'제4공학관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1438,34,'E','재료분석론','김형진',3,'제4공학관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1439,34,'E','재료물리화학','명재민',3,'제4공학관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1440,34,'E','재료응고학','강달영',4,'제4공학관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1441,34,'E','반도체공정','고대홍',4,'제4공학관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1442,34,'E','재료전기화학','김상우',4,'제4공학관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1443,34,'E','박막재료','김형진',4,'제4공학관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1444,34,'E','환경재료','명재민',4,'제4공학관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1445,34,'E','연성재료','강달영',4,'제4공학관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1446,34,'E','복합재료','고대홍',4,'제4공학관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1447,34,'E','재료가공공정','김상우',4,'제4공학관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1448,34,'E','합금설계학','김형진',4,'제4공학관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1449,34,'E','콜로이드공정','명재민',4,'제4공학관 405호','T',2023,'2학기',3); 

/*한양대 건축공학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1510,35,'E','기본설계1','김재준',1,'건축관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1511,35,'E','일반화학및실험1','김주형',1,'건축관 152호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1512,35,'E','일반물리학및실험1','전진용',1,'건축관 153호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1513,35,'E','미분적분학1','정재원',1,'건축관 154호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1514,35,'E','과학기술의철학적이해','최창식',1,'건축관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1515,35,'E','기본설계2','김재준',1,'건축관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1516,35,'E','일반화학및실험2','김주형',1,'건축관 152호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1517,35,'E','일반물리학및실험2','전진용',1,'건축관 153호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1518,35,'E','미분적분학2','정재원',1,'건축관 154호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1519,35,'E','스마트건축의이해','최창식',1,'건축관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1520,35,'E','건축환경공학','김재준',2,'건축관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1521,35,'E','공학역학','김주형',2,'건축관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1522,35,'E','건축재료','전진용',2,'건축관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1523,35,'E','Adventure_Design(건축융합1)','정재원',2,'건축관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1524,35,'E','건축구조시스템','최창식',2,'건축관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1525,35,'E','공업수학1','김재준',2,'건축관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1526,35,'E','건축구법1','김주형',2,'건축관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1527,35,'E','Adventure_Design(건축융합2)','전진용',2,'건축관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1528,35,'E','재료역학','정재원',2,'건축관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1529,35,'E','확률통계론','최창식',2,'건축관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1530,35,'E','건축구조역학1','김재준',3,'건축관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1531,35,'E','건축융합설계1','김주형',3,'건축관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1532,35,'E','건축시공계획','전진용',3,'건축관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1533,35,'E','HVAC 시스템디자인','정재원',3,'건축관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1534,35,'E','철근콘크리트구조1','최창식',3,'건축관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1535,35,'E','건축구조역학2','김재준',3,'건축관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1536,35,'E','건설사업관리1','김주형',3,'건축관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1537,35,'E','건축융합설계2','전진용',3,'건축관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1538,35,'E','스마트건축생산','정재원',3,'건축관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1539,35,'E','건축음향','최창식',3,'건축관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1540,35,'E','철근콘크리트구조2','김재준',4,'건축관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1541,35,'E','수치해석','김주형',4,'건축관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1542,35,'E','건축공학캡스톤PBL','전진용',4,'건축관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1543,35,'E','건물에너지','정재원',4,'건축관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1544,35,'E','강구조','최창식',4,'건축관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1545,35,'E','공업경제학','김재준',4,'건축관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1546,35,'E','건축구조계획','김주형',4,'건축관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1547,35,'E','환경과생태건축','전진용',4,'건축관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1548,35,'E','전기회로및조명시스템	','정재원',4,'건축관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1549,35,'E','건설프로젝트기획및개발','최창식',4,'건축관 405호','T',2023,'2학기',3); 

/*가톨릭대 심리학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1610,41,'S','심리학개론_1','박영석',1,'비르투스관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1611,41,'S','가족상담','남종호',1,'비르투스관 162호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1612,41,'S','감각및지각','이희경',1,'비르투스관 163호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1613,41,'S','경력개발코칭및실습','정남운',1,'비르투스관 164호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1614,41,'S','긍정심리학','정윤경',1,'비르투스관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1615,41,'S','심리학개론_2','박영석',1,'비르투스관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1616,41,'S','놀이치료실습및슈퍼비전','남종호',1,'비르투스관 162호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1617,41,'S','동기와정서','이희경',1,'비르투스관 163호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1618,41,'S','발달심리학','정남운',1,'비르투스관 164호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1619,41,'S','발달정신병리학','정윤경',1,'비르투스관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1620,41,'S','발달진단및심리평가','박영석',2,'비르투스관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1621,41,'S','범죄심리및실습','남종호',2,'비르투스관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1622,41,'S','부모교육및상담','이희경',2,'비르투스관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1623,41,'S','사회심리학','정남운',2,'비르투스관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1624,41,'S','사회정서발달','정윤경',2,'비르투스관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1625,41,'S','산업심리학','박영석',2,'비르투스관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1626,41,'S','상담면접및실습','남종호',2,'비르투스관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1627,41,'S','상담사례연구','이희경',2,'비르투스관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1628,41,'S','상담심리및실습','정남운',2,'비르투스관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1629,41,'S','생물심리학','정윤경',2,'비르투스관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1630,41,'S','성격과인간관계','박영석',3,'비르투스관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1631,41,'S','성격심리학','남종호',3,'비르투스관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1632,41,'S','성장심리학','이희경',3,'비르투스관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1633,41,'S','소비자심리학','정남운',3,'비르투스관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1634,41,'S','심리검사및실습','정윤경',3,'비르투스관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1635,41,'S','심리통계','박영석',3,'비르투스관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1636,41,'S','심리학과진로탐색','남종호',3,'비르투스관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1637,41,'S','심리학실험','이희경',3,'비르투스관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1638,41,'S','심리학연구법','정남운',3,'비르투스관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1639,41,'S','심리학특강','정윤경',3,'비르투스관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1640,41,'S','심리학현장실습','박영석',4,'비르투스관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1641,41,'S','아동심리치료','남종호',4,'비르투스관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1642,41,'S','안전심리코칭및실습','이희경',4,'비르투스관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1643,41,'S','이상심리학','정남운',4,'비르투스관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1644,41,'S','인간관계훈련실습','정윤경',4,'비르투스관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1645,41,'S','인적자원개발및실습','박영석',4,'비르투스관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1646,41,'S','인지과학','남종호',4,'비르투스관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1647,41,'S','인지심리학','이희경',4,'비르투스관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1648,41,'S','인지행동치료및실습	','정남운',4,'비르투스관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1649,41,'S','임상심리학','정윤경',4,'비르투스관 405호','T',2023,'2학기',3); 

/*한국외대 정치외교학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1710,42,'S','고대정치사상연구','김면회',1,'제2사회과학관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1711,42,'S','근대정치사상연구','남궁영',1,'제2사회과학관 172호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1712,42,'S','동양정치사상연구','서경교',1,'제2사회과학관 173호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1713,42,'S','서구정치사상세미나','이상환',1,'제2사회과학관 174호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1714,42,'S','정치사회학세미나','이재묵',1,'제2사회과학관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1715,42,'S','정치심리학연구','김면회',1,'제2사회과학관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1716,42,'S','페미니즘연구','남궁영',1,'제2사회과학관 172호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1717,42,'S','한국정치사상세미나','서경교',1,'제2사회과학관 173호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1718,42,'S','현대정치사상연구','이상환',1,'제2사회과학관 174호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1719,42,'S','현대정치이론연구','이재묵',1,'제2사회과학관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1720,42,'S','환경정치이론연구','김면회',2,'제2사회과학관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1721,42,'S','다변인분석세미나','남궁영',2,'제2사회과학관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1722,42,'S','분석모형연구','서경교',2,'제2사회과학관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1723,42,'S','사회과학기초통계','이상환',2,'제2사회과학관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1724,42,'S','사회과학철학세미나','이재묵',2,'제2사회과학관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1725,42,'S','사회통계연구','김면회',2,'제2사회과학관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1726,42,'S','인식론세미나','남궁영',2,'제2사회과학관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1727,42,'S','정치학방법론연구','서경교',2,'제2사회과학관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1728,42,'S','지역연구전략세미나','이상환',2,'제2사회과학관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1729,42,'S','구미정치사연구','이재묵',2,'제2사회과학관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1730,42,'S','동남아정치연구','김면회',3,'제2사회과학관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1731,42,'S','러시아정치연구','남궁영',3,'제2사회과학관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1732,42,'S','미국정치연구','서경교',3,'제2사회과학관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1733,42,'S','비교민주주의연구','이상환',3,'제2사회과학관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1734,42,'S','비교의회정치연구','이재묵',3,'제2사회과학관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1735,42,'S','비교정치경제연구','김면회',3,'제2사회과학관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1736,42,'S','비교정치세미나','남궁영',3,'제2사회과학관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1737,42,'S','비교정치연구','서경교',3,'제2사회과학관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1738,42,'S','여성정치연구','이상환',3,'제2사회과학관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1739,42,'S','일본정치연구','이재묵',3,'제2사회과학관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1740,42,'S','북한정치세미나','김면회',4,'제2사회과학관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1741,42,'S','한국대통령제연구','남궁영',4,'제2사회과학관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1742,42,'S','한국선거과정연구','서경교',4,'제2사회과학관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1743,42,'S','한국정치발전세미나','이상환',4,'제2사회과학관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1744,42,'S','국제정치경제세미나','이재묵',4,'제2사회과학관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1745,42,'S','국제분쟁연구','김면회',4,'제2사회과학관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1746,42,'S','국제기구연구','남궁영',4,'제2사회과학관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1747,42,'S','러시아외교정책연구','서경교',4,'제2사회과학관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1748,42,'S','외교정책세미나','이상환',4,'제2사회과학관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1749,42,'S','한국외교정책연구','이재묵',4,'제2사회과학관 405호','T',2023,'2학기',3); 

/*가톨릭대 국제학부*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1810,43,'S','국제관계학입문','김재철',1,'K관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1811,43,'S','국제통상학입문','최영종',1,'K관 182호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1812,43,'S','지역연구입문','마상윤',1,'K관 183호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1813,43,'S','EU연구','윤미경',1,'K관 184호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1814,43,'S','강대국국제정치와세계질서','김준석',1,'K관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1815,43,'S','경제발전론','김재철',1,'K관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1816,43,'S','경제통합론','최영종',1,'K관 182호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1817,43,'S','국제개발의실제캡스톤디자인','마상윤',1,'K관 183호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1818,43,'S','국제관계와서양정치사상','윤미경',1,'K관 184호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1819,43,'S','국제관계이론','김준석',1,'K관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1820,43,'S','국제관계학고전강독','김재철',2,'K관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1821,43,'S','국제금융시장론','최영종',2,'K관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1822,43,'S','국제기구론','마상윤',2,'K관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1823,43,'S','국제윤리','윤미경',2,'K관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1824,43,'S','국제정치경제','김준석',2,'K관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1825,43,'S','국제통상법','김재철',2,'K관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1826,43,'S','국제통상영어','최영종',2,'K관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1827,43,'S','국제통상이론1','마상윤',2,'K관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1828,43,'S','국제통상이론2','윤미경',2,'K관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1829,43,'S','국제학과경제','김준석',2,'K관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1830,43,'S','국제학방법론','김재철',3,'K관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1831,43,'S','국제학영어연습1:글로벌비즈니스영어','최영종',3,'K관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1832,43,'S','국제학영어연습2','마상윤',3,'K관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1833,43,'S','국제학중국어연습','윤미경',3,'K관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1834,43,'S','국제학현장실습','김준석',3,'K관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1835,43,'S','국제협력과개발','김재철',3,'K관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1836,43,'S','국제협상론','최영종',3,'K관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1837,43,'S','동남아지역개론','마상윤',3,'K관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1838,43,'S','디지털통상의이해','윤미경',3,'K관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1839,43,'S','미-중관계와동아시아질서','김준석',3,'K관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1840,43,'S','미국과세계질서','김재철',4,'K관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1841,43,'S','미국역사의이해','최영종',4,'K관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1842,43,'S','미국의외교정책','마상윤',4,'K관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1843,43,'S','미국의정치제도','윤미경',4,'K관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1844,43,'S','미국학시사연구','김준석',4,'K관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1845,43,'S','북한연구','김재철',4,'K관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1846,43,'S','비교정치론','최영종',4,'K관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1847,43,'S','세계정세분석','마상윤',4,'K관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1848,43,'S','세계화와민족주의','윤미경',4,'K관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1849,43,'S','외교론','김준석',4,'K관 405호','T',2023,'2학기',3); 

/*가톨릭대 행정학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1910,44,'S','행정학개론','박광국',1,'마리아관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1911,44,'S','ODA정책','이종원',1,'마리아관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1912,44,'S','PSAT입문','채원호',1,'마리아관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1913,44,'S','갈등관리와협상','박석희',1,'마리아관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1914,44,'S','경찰행정론','정종원',1,'마리아관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1915,44,'S','계량행정론','박광국',1,'마리아관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1916,44,'S','공공재정론','이종원',1,'마리아관 192호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1917,44,'S','공공조직론','채원호',1,'마리아관 193호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1918,44,'S','공기업론','박석희',1,'마리아관 194호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1919,44,'S','과학기술정보정책','정종원',1,'마리아관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1920,44,'S','도시행정론','박광국',2,'마리아관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1921,44,'S','문화정책','이종원',2,'마리아관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1922,44,'S','미디어정책','채원호',2,'마리아관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1923,44,'S','보건의료정책','박석희',2,'마리아관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1924,44,'S','비교정부와정책','정종원',2,'마리아관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1925,44,'S','사회정책론','박광국',2,'마리아관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1926,44,'S','인사행정론','이종원',2,'마리아관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1927,44,'S','재난관리행정','채원호',2,'마리아관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1928,44,'S','재무행정론','박석희',2,'마리아관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1929,44,'S','전략적기획론','정종원',2,'마리아관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1930,44,'S','정부규제분석','박광국',3,'마리아관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1931,44,'S','정부와비정부기구:글로벌비즈니스영어','이종원',3,'마리아관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1932,44,'S','정부회계론','채원호',3,'마리아관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1933,44,'S','정책분석평가론','박석희',3,'마리아관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1934,44,'S','정책사례분석','정종원',3,'마리아관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1935,44,'S','정책학개론','박광국',3,'마리아관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1936,44,'S','조사방법론','이종원',3,'마리아관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1937,44,'S','조직진단과사례분석','채원호',3,'마리아관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1938,44,'S','지방정치와지방의회','박석희',3,'마리아관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1939,44,'S','지방행정론','정종원',3,'마리아관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1940,44,'S','지역개발론','박광국',4,'마리아관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1941,44,'S','한국정부론','이종원',4,'마리아관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1942,44,'S','행정과거시경제','채원호',4,'마리아관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1943,44,'S','행정과미시경제','박석희',4,'마리아관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1944,44,'S','행정과빅데이터','정종원',4,'마리아관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1945,44,'S','행정학연습','박광국',4,'마리아관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1946,44,'S','행정학현장실습','이종원',4,'마리아관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1947,44,'S','행정행태론','채원호',4,'마리아관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1948,44,'S','헌법','박석희',4,'마리아관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1949,44,'S','환경행정론','정종원',4,'마리아관 405호','T',2023,'2학기',3); 

/*충남대 언론정보학과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2110,45,'S','미래설계상담','손병우',1,'사회과학대학 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2111,45,'S','언론정보학개론','양은경',1,'사회과학대학 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2112,45,'S','영어커뮤니케이션 연습','김재영',1,'사회과학대학 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2113,45,'S','방송의 이해','김수정',1,'사회과학대학 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2114,45,'S','스피치와토론','이승선',1,'사회과학대학 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2115,45,'S','저널리즘의 이해','손병우',1,'사회과학대학 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2116,45,'S','1인미디어콘텐츠','양은경',1,'사회과학대학 212호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2117,45,'S','광고의 이해','김재영',1,'사회과학대학 213호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2118,45,'S','미디어글쓰기','김수정',1,'사회과학대학 214호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2119,45,'S','미디어이론입문','이승선',1,'사회과학대학 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2120,45,'S','설득과 커뮤니케이션','손병우',2,'사회과학대학 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2121,45,'S','영상콘텐츠제작실습','양은경',2,'사회과학대학 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2122,45,'S','한국언론사','김재영',2,'사회과학대학 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2123,45,'S','언론과 법의 기초','김수정',2,'사회과학대학 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2124,45,'S','팟캐스트제작실습','이승선',2,'사회과학대학 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2125,45,'S','PR의 이해','손병우',2,'사회과학대학 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2126,45,'S','대중문화론','양은경',2,'사회과학대학 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2127,45,'S','디지털저널리즘제작실습','김재영',2,'사회과학대학 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2128,45,'S','미디어콘텐츠','김수정',2,'사회과학대학 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2129,45,'S','전략적기획론','이승선',2,'사회과학대학 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2130,45,'S','감정과 미디어 문화','손병우',3,'사회과학대학 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2131,45,'S','광고PR프로젝트','양은경',3,'사회과학대학 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2132,45,'S','미디어플래닝','김재영',3,'사회과학대학 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2133,45,'S','셀레브리티와팬덤','김수정',3,'사회과학대학 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2134,45,'S','커뮤니케이션법제','이승선',3,'사회과학대학 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2135,45,'S','현대문화이론','손병우',3,'사회과학대학 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2136,45,'S','HCI 커뮤니케이션','양은경',3,'사회과학대학 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2137,45,'S','미디어데이터분석과활용','김재영',3,'사회과학대학 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2138,45,'S','미디어이론','김수정',3,'사회과학대학 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2139,45,'S','사회과학 질적연구방법','이승선',3,'사회과학대학 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2140,45,'S','컴퓨터커뮤니케이션','손병우',4,'사회과학대학 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2141,45,'S','20세기와미디어의기억','양은경',4,'사회과학대학 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2142,45,'S','온라인 저널리즘','김재영',4,'사회과학대학 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2143,45,'S','젠더와 미디어 문화','김수정',4,'사회과학대학 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2144,45,'S','소비자행동론','이승선',4,'사회과학대학 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2145,45,'S','이슈와 논쟁','손병우',4,'사회과학대학 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2146,45,'S','정치커뮤니케이션','양은경',4,'사회과학대학 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2147,45,'S','조사연구방법','김재영',4,'사회과학대학 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2148,45,'S','커뮤니케이션윤리','김수정',4,'사회과학대학 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2149,45,'S','글로벌문화론','이승선',4,'사회과학대학 405호','T',2023,'2학기',3); 

/*가톨릭대 중국어과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2210,51,'F','중어1','김의진',1,'C관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2211,51,'F','한문1','한혜경',1,'C관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2212,51,'F','중국문화의이해','왕수',1,'C관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2213,51,'F','명언명구로배우는한문1','이현주',1,'C관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2214,51,'F','문화로읽는중국사','박덕준',1,'C관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2215,51,'F','중어2','김의진',1,'C관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2216,51,'F','한문2','한혜경',1,'C관 222호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2217,51,'F','시사중국어','왕수',1,'C관 223호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2218,51,'F','명언명구로배우는한문2','이현주',1,'C관 224호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2219,51,'F','스크린중국어와대중문화','박덕준',1,'C관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2220,51,'F','실용중국어','김의진',2,'C관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2221,51,'F','중국고전과리더십','한혜경',2,'C관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2222,51,'F','중국고전명문선독','왕수',2,'C관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2223,51,'F','중국문학과예술의이해','이현주',2,'C관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2224,51,'F','중국문화와창업브랜드전략','박덕준',2,'C관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2225,51,'F','중국비즈니스문화와창업전략','김의진',2,'C관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2226,51,'F','중국사상의현대적이해','한혜경',2,'C관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2227,51,'F','중국소설의세계','왕수',2,'C관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2228,51,'F','중국시가와중국문화','이현주',2,'C관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2229,51,'F','중국시낭송','박덕준',2,'C관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2230,51,'F','중국어교과교육론','김의진',3,'C관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2231,51,'F','중국어교과교재연구및지도법','한혜경',3,'C관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2232,51,'F','중국어문법의이해','왕수',3,'C관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2233,51,'F','중국어와중국문화','이현주',3,'C관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2234,51,'F','중국어읽기와문화','박덕준',3,'C관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2235,51,'F','중국어작문','김의진',3,'C관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2236,51,'F','중국어프레젠테이션','한혜경',3,'C관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2237,51,'F','중국언어문화캡스톤디자인','왕수',3,'C관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2238,51,'F','중국언어문화학과진로탐색','이현주',3,'C관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2239,51,'F','중국언어문화학현장실습','박덕준',3,'C관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2240,51,'F','중국전통문학의이해','김의진',4,'C관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2241,51,'F','중국지역문화특강','한혜경',4,'C관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2242,51,'F','중국현대명문선독','왕수',4,'C관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2243,51,'F','중국현대문학감상','이현주',4,'C관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2244,51,'F','중국현대문학과대중문화','박덕준',4,'C관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2245,51,'F','중국현대문학의이해','김의진',4,'C관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2246,51,'F','중한통번역연습','한혜경',4,'C관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2247,51,'F','집중중국어','왕수',4,'C관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2248,51,'F','통상중국어','이현주',4,'C관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2249,51,'F','현대중국어개론','박덕준',4,'C관 405호','T',2023,'2학기',3); 

/*가톨릭대 영어과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2310,52,'F','영문학의이해','서성기',1,'김수환관 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2311,52,'F','영미문화의이해','이창봉',1,'김수환관 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2312,52,'F','AI와영어','김혜영',1,'김수환관 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2313,52,'F','국제회의통역연습','심영숙',1,'김수환관 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2314,52,'F','그래픽노블과비주얼스토리텔링','에릭탐슨',1,'김수환관 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2315,52,'F','다문화사회와문학','서성기',1,'김수환관 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2316,52,'F','문학과환경','이창봉',1,'김수환관 222호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2317,52,'F','문화간소통과세계영어','김혜영',1,'김수환관 223호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2318,52,'F','문화간실무영어','심영숙',1,'김수환관 224호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2319,52,'F','문화간커뮤니케이션','에릭탐슨',1,'김수환관 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2320,52,'F','문화연구와인문학적패러다임의전환','서성기',2,'김수환관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2321,52,'F','미국문학개관','이창봉',2,'김수환관 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2322,52,'F','미국문학의이해','김혜영',2,'김수환관 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2323,52,'F','미국문화의이해','심영숙',2,'김수환관 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2324,52,'F','미디어영어','에릭탐슨',2,'김수환관 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2325,52,'F','미디어컨텐츠청해연습','서성기',2,'김수환관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2326,52,'F','번역의원리와응용','이창봉',2,'김수환관 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2327,52,'F','세계영어와새로운영어들','김혜영',2,'김수환관 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2328,52,'F','소설적상상력과시대정신','심영숙',2,'김수환관 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2329,52,'F','스타트업영어발표','에릭탐슨',2,'김수환관 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2330,52,'F','스토리텔링의이해','서성기',3,'김수환관 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2331,52,'F','시적상상력과시대정신','이창봉',3,'김수환관 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2332,52,'F','실용영문법','김혜영',3,'김수환관 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2333,52,'F','심리언어학의세계','심영숙',3,'김수환관 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2334,52,'F','아동영어교육','에릭탐슨',3,'김수환관 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2335,52,'F','언어문화의보편성과다양성','서성기',3,'김수환관 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2336,52,'F','언어와인지과학','이창봉',3,'김수환관 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2337,52,'F','연극적상상력과시대정신','김혜영',3,'김수환관 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2338,52,'F','영문학개관','심영숙',3,'김수환관 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2339,52,'F','영미대중문화의이해','에릭탐슨',3,'김수환관 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2340,52,'F','영미문학과여성','서성기',4,'김수환관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2341,52,'F','영미문학과영상매체','이창봉',4,'김수환관 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2342,52,'F','영미문학과자아탐구','김혜영',4,'김수환관 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2343,52,'F','영미문학과현대사회','심영숙',4,'김수환관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2344,52,'F','영미문화의배경:신화와성경','에릭탐슨',4,'김수환관 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2345,52,'F','영미산문','서성기',4,'김수환관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2346,52,'F','영미소설의이해','이창봉',4,'김수환관 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2347,52,'F','영어발음이론과훈련','김혜영',4,'김수환관 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2348,52,'F','영어에세이쓰기','심영숙',4,'김수환관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2349,52,'F','영어영문학현장실습','에릭탐슨',4,'김수환관 405호','T',2023,'2학기',3); 

/*한국외대 러시아어과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2410,53,'F','러시아어말하기_1','홍완석',1,'서양어대학 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2411,53,'F','러시아어문법_1','추석훈',1,'서양어대학 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2412,53,'F','러시아어문법연습_1','표상용',1,'서양어대학 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2413,53,'F','러시아어언어실습_1','방교영',1,'서양어대학 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2414,53,'F','러시아어읽기_1','제성훈',1,'서양어대학 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2415,53,'F','러시아어말하기_2','홍완석',1,'서양어대학 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2416,53,'F','러시아어문법_2','추석훈',1,'서양어대학 222호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2417,53,'F','러시아어문법연습_2','표상용',1,'서양어대학 223호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2418,53,'F','러시아어언어실습_2','방교영',1,'서양어대학 224호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2419,53,'F','러시아어읽기_2','제성훈',1,'서양어대학 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2420,53,'F','러시아어말하기심화_1','홍완석',2,'서양어대학 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2421,53,'F','러시아어문법심화_1','추석훈',2,'서양어대학 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2422,53,'F','러시아어문법연습심화_1','표상용',2,'서양어대학 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2423,53,'F','러시아어언어실습심화_1','방교영',2,'서양어대학 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2424,53,'F','러시아어읽기심화_1','제성훈',2,'서양어대학 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2425,53,'F','러시아어말하기심화_2','홍완석',2,'서양어대학 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2426,53,'F','러시아어문법심화_2','추석훈',2,'서양어대학 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2427,53,'F','러시아어문법연습심화_2','표상용',2,'서양어대학 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2428,53,'F','러시아어언어실습심화_2','방교영',2,'서양어대학 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2429,53,'F','러시아어읽기심화_2','제성훈',2,'서양어대학 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2430,53,'F','러시아문학텍스트강독','홍완석',3,'서양어대학 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2431,53,'F','러시아문학텍스트분석','추석훈',3,'서양어대학 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2432,53,'F','러시아·투르크·몽골의 인문지리와 사회','표상용',3,'서양어대학 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2433,53,'F','러시아실용문심화','방교영',3,'서양어대학 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2434,53,'F','텍스트로읽는러시아','제성훈',3,'서양어대학 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2435,53,'F','러시아·투르크·몽골의 민족과 종교','홍완석',3,'서양어대학 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2436,53,'F','러시아·투르크·몽골의 사상과 문화','추석훈',3,'서양어대학 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2437,53,'F','러시아어문장론','표상용',3,'서양어대학 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2438,53,'F','러시아어음성학','방교영',3,'서양어대학 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2439,53,'F','19세기러시아문학의이해','제성훈',3,'서양어대학 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2440,53,'F','러시아작가연구','홍완석',4,'서양어대학 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2441,53,'F','러시아역사','추석훈',4,'서양어대학 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2442,53,'F','러시아·CIS지역연구','표상용',4,'서양어대학 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2443,53,'F','극동·시베리아개발과 국제협력','방교영',4,'서양어대학 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2444,53,'F','20세기러시아문학의이해','제성훈',4,'서양어대학 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2445,53,'F','러시아문학사상과평론','홍완석',4,'서양어대학 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2446,53,'F','러시아정치·외교','추석훈',4,'서양어대학 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2447,53,'F','러시아경제','표상용',4,'서양어대학 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2448,53,'F','러시아문화연구세미나','방교영',4,'서양어대학 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2449,53,'F','현대러시아사회와문화','제성훈',4,'서양어대학 405호','T',2023,'2학기',3); 

/*한국외대 스페인어과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2510,54,'F','스페인어 회화I_1','나송주',1,'제2서양어대학 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2511,54,'F','초급스페인어 읽기_1','김경희',1,'제2서양어대학 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2512,54,'F','초급스페인어 문법_1','문남권',1,'제2서양어대학 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2513,54,'F','초급스페인어쓰기_1','송예림',1,'제2서양어대학 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2514,54,'F','스페인 문화사_1','김유경',1,'제2서양어대학 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2515,54,'F','스페인어 회화I_2','나송주',1,'제2서양어대학 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2516,54,'F','초급스페인어 읽기_2','김경희',1,'제2서양어대학 222호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2517,54,'F','초급스페인어 문법_2','문남권',1,'제2서양어대학 223호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2518,54,'F','초급스페인어쓰기_2','송예림',1,'제2서양어대학 224호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2519,54,'F','스페인 문화사_2','김유경',1,'제2서양어대학 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2520,54,'F','스페인어 회화II_1','나송주',2,'제2서양어대학 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2521,54,'F','중급스페인어 읽기_1','김경희',2,'제2서양어대학 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2522,54,'F','중급스페인어 문법_1','문남권',2,'제2서양어대학 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2523,54,'F','중급스페인어쓰기_1','송예림',2,'제2서양어대학 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2524,54,'F','멕시코-중미-카리브 지역의 이해','김유경',2,'제2서양어대학 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2525,54,'F','스페인어 회화II_2','나송주',2,'제2서양어대학 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2526,54,'F','중급스페인어 읽기_2','김경희',2,'제2서양어대학 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2527,54,'F','중급스페인어 문법_2','문남권',2,'제2서양어대학 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2528,54,'F','중급스페인어쓰기_2','송예림',2,'제2서양어대학 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2529,54,'F','남미지역의 이해','김유경',2,'제2서양어대학 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2530,54,'F','중남미 경제','나송주',3,'제2서양어대학 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2531,54,'F','중남미 문화사','김경희',3,'제2서양어대학 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2532,54,'F','시사원어토론','문남권',3,'제2서양어대학 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2533,54,'F','스페인문학사','송예림',3,'제2서양어대학 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2534,54,'F','중남미문학사','김유경',3,'제2서양어대학 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2535,54,'F','중남미 정치','나송주',3,'제2서양어대학 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2536,54,'F','스페인어 언어학Ⅰ','김경희',3,'제2서양어대학 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2537,54,'F','스페인어 언어학Ⅱ','문남권',3,'제2서양어대학 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2538,54,'F','중남미 지역개발협력Ⅰ','송예림',3,'제2서양어대학 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2539,54,'F','중남미 지역개발협력Ⅱ','김유경',3,'제2서양어대학 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2540,54,'F','중남미 인종과 사회','나송주',4,'제2서양어대학 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2541,54,'F','스페인어 에세이 쓰기','김경희',4,'제2서양어대학 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2542,54,'F','스페인어발달사','문남권',4,'제2서양어대학 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2543,54,'F','스페인 황금세기 문학','송예림',4,'제2서양어대학 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2544,54,'F','스페인 현대문학','김유경',4,'제2서양어대학 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2545,54,'F','스페인 지역연구Ⅰ','나송주',4,'제2서양어대학 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2546,54,'F','스페인 지역연구Ⅱ','김경희',4,'제2서양어대학 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2547,54,'F','중남미 소설','문남권',4,'제2서양어대학 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2548,54,'F','스페인 소설','송예림',4,'제2서양어대학 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2549,54,'F','중남미 기업과 법','김유경',4,'제2서양어대학 405호','T',2023,'2학기',3); 

/*한국외대 포르투갈어과*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2610,55,'F','기초시청각포르투갈어I_1','이승용',1,'제3서양어대학 101호','A',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2611,55,'F','기초포르투갈어쓰기I_1','임소라',1,'제3서양어대학 102호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2612,55,'F','초급포르투갈어강독_1','권기수',1,'제3서양어대학 103호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2613,55,'F','초급포르투갈어회화_1','Maira Jo?o',1,'제3서양어대학 104호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2614,55,'F','포.브라질지역입문','Maria Luiza',1,'제3서양어대학 105호','E',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2615,55,'F','기초시청각포르투갈어I_2','이승용',1,'제3서양어대학 101호','A',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2616,55,'F','기초포르투갈어쓰기I_2','임소라',1,'제3서양어대학 222호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2617,55,'F','초급포르투갈어강독_2','권기수',1,'제3서양어대학 223호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2618,55,'F','초급포르투갈어회화_2','Maira Jo?o',1,'제3서양어대학 224호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2619,55,'F','루소폰아프리카지역입문','Maria Luiza',1,'제3서양어대학 105호','E',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2620,55,'F','포르투갈어문법I','이승용',2,'제3서양어대학 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2621,55,'F','중급포르투갈어회화','임소라',2,'제3서양어대학 202호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2622,55,'F','스크린미디어포르투갈어I','권기수',2,'제3서양어대학 203호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2623,55,'F','중급포르투갈어강독','Maira Jo?o',2,'제3서양어대학 204호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2624,55,'F','중급포르투갈어쓰기','Maria Luiza',2,'제3서양어대학 205호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2625,55,'F','현대루소폰문학과사회I','이승용',2,'제3서양어대학 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2626,55,'F','브라질경제입문','임소라',2,'제3서양어대학 202호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2627,55,'F','포르투갈어문법II','권기수',2,'제3서양어대학 203호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2628,55,'F','중급포르투갈어회화','Maira Jo?o',2,'제3서양어대학 204호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2629,55,'F','스크린미디어포르투갈어II','Maria Luiza',2,'제3서양어대학 205호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2630,55,'F','중급포르투갈어강독','이승용',3,'제3서양어대학 301호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2631,55,'F','중급포르투갈어쓰기','임소라',3,'제3서양어대학 302호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2632,55,'F','현대루소폰문학과사회II','권기수',3,'제3서양어대학 303호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2633,55,'F','브라질경제통상','Maira Jo?o',3,'제3서양어대학 304호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2634,55,'F','FLEX포르투갈어','Maria Luiza',3,'제3서양어대학 305호','J',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2635,55,'F','고급포르투갈어회화작문','이승용',3,'제3서양어대학 301호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2636,55,'F','포르투갈언어학개론I','임소라',3,'제3서양어대학 302호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2637,55,'F','포르투갈통역연습I','권기수',3,'제3서양어대학 303호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2638,55,'F','루소폰시장과한국기업I','Maira Jo?o',3,'제3서양어대학 304호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2639,55,'F','루소폰지역개발협력I','Maria Luiza',3,'제3서양어대학 305호','J',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2640,55,'F','포르투갈.브라질정치의이해','이승용',4,'제3서양어대학 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2641,55,'F','고급포르투갈어회화작문','임소라',4,'제3서양어대학 402호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2642,55,'F','포르투갈언어학개론II','권기수',4,'제3서양어대학 403호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2643,55,'F','포르투갈통역연습II','Maira Jo?o',4,'제3서양어대학 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2644,55,'F','루소폰시장과한국기업II','Maria Luiza',4,'제3서양어대학 405호','T',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2645,55,'F','루소폰지역개발협력II','이승용',4,'제3서양어대학 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2646,55,'F','포르투갈.브라질정치세미나','임소라',4,'제3서양어대학 402호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2647,55,'F','비즈니스포르투갈어통역','권기수',4,'제3서양어대학 403호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2648,55,'F','루소폰지역국제관계','Maira Jo?o',4,'제3서양어대학 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2649,55,'F','브라질외국어투자법','Maria Luiza',4,'제3서양어대학 405호','T',2023,'2학기',3); 

/*교양*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2710,10,'GE','기초교양필수','추후공지',0,'교양관 101호','K',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2711,10,'GE','자유선택교양','추후공지',0,'교양관 102호','J',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2712,10,'GE','채플','추후공지',0,'교양관 103호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2713,10,'GE','공학일반','추후공지',0,'교양관 104호','T',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2714,10,'GE','영화감상과 비평','추후공지',0,'교양관 105호','D',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2715,10,'GE','사고와표현','추후공지',0,'교양관 101호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2716,10,'GE','대학시쓰기','추후공지',0,'교양관 222호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2717,10,'GE','한국과세계소통의역사','추후공지',0,'교양관 223호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2718,10,'GE','대학영어','추후공지',0,'교양관 224호','H',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2719,10,'GE','창업을위한코딩','추후공지',0,'교양관 105호','P',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2720,10,'GE','진로설계를위한자기계발','추후공지',0,'교양관 201호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2721,10,'GE','사회봉사','추후공지',0,'교양관 202호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2722,10,'GE','제2외국어-중국어초급','추후공지',0,'교양관 203호','R',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2723,10,'GE','제2외국어-일본어초급','추후공지',0,'교양관 204호','Q',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2724,10,'GE','제2외국어-스페인어초급','추후공지',0,'교양관 205호','K',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2725,10,'GE','제2외국어-독일어초급','추후공지',0,'교양관 201호','T',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2726,10,'GE','제2외국어-러시아어초급','추후공지',0,'교양관 202호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2727,10,'GE','제2외국어-프랑스어초급','추후공지',0,'교양관 203호','L',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2728,10,'GE','제2외국어-몽골어초급','추후공지',0,'교양관 204호','O',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2729,10,'GE','제2외국어-아랍어초급','추후공지',0,'교양관 205호','Q',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2730,10,'GE','제2외국어-포르투갈어초급','추후공지',0,'교양관 301호','B',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2731,10,'GE','켐바이오진로설계와자기계발','추후공지',0,'교양관 302호','F',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2732,10,'GE','Korean History','추후공지',0,'교양관 303호','T',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2733,10,'GE','도덕적삶과이상','추후공지',0,'교양관 304호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2734,10,'GE','고금문학의이해','추후공지',0,'교양관 305호','H',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2735,10,'GE','변화와공존의인문학','추후공지',0,'교양관 301호','E',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2736,10,'GE','동양사의이해','추후공지',0,'교양관 302호','I',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2737,10,'GE','세계사를바꾼전쟁사','추후공지',0,'교양관 303호','K',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2738,10,'GE','언어와인간','추후공지',0,'교양관 304호','L',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2739,10,'GE','연애시읽기와창작','추후공지',0,'교양관 305호','G',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2740,10,'GE','위대한리더들과그들의선택','추후공지',0,'교양관 401호','N',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2741,10,'GE','한시의이해','추후공지',0,'교양관 402호','M',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2742,10,'GE','시민의교양','추후공지',0,'교양관 403호','O',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2743,10,'GE','언론의자유와시민의권리','추후공지',0,'교양관 404호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2744,10,'GE','생명공학의이해','추후공지',0,'교양관 405호','P',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2745,10,'GE','이해하기쉬운기초수학','추후공지',0,'교양관 401호','M',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2746,10,'GE','초등미적분학','추후공지',0,'교양관 402호','C',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2747,10,'GE','건강유토피아','추후공지',0,'교양관 403호','D',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2748,10,'GE','노화의이해','추후공지',0,'교양관 404호','E',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2749,10,'GE','뇌건강','추후공지',0,'교양관 405호','A',2023,'1학기',3); 

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2750,10,'GE','교양태권도','추후공지',0,'교양관 401호','P',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2751,10,'GE','교양테니스','추후공지',0,'교양관 402호','E',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2752,10,'GE','교양호신술','추후공지',0,'교양관 403호','S',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2753,10,'GE','댄스의이론과실제','추후공지',0,'교양관 404호','G',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2754,10,'GE','디지털이미지의이해','추후공지',0,'교양관 405호','I',2023,'1학기',3); 

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2755,10,'GE','인문학과음악','추후공지',0,'교양관 401호','M',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2756,10,'GE','합창의입문','추후공지',0,'교양관 402호','N',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2757,10,'GE','서양사의이해','추후공지',0,'교양관 403호','O',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2758,10,'GE','Political Science','추후공지',0,'교양관 404호','K',2023,'1학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2759,10,'GE','PEET를위한일반화학','추후공지',0,'교양관 405호','L',2023,'1학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2760,10,'GE','문화로보는뇌과학','추후공지',0,'교양관 101호','K',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2761,10,'GE','삶의혁명-생명공학','추후공지',0,'교양관 102호','J',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2762,10,'GE','생활속프로바이오틱이용','추후공지',0,'교양관 103호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2763,10,'GE','생활환경과화학','추후공지',0,'교양관 104호','T',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2764,10,'GE','알기쉬운의학용어 비평','추후공지',0,'교양관 105호','D',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2765,10,'GE','인류와과학','추후공지',0,'교양관 101호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2766,10,'GE','인류의기원과진화','추후공지',0,'교양관 222호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2767,10,'GE','카메라와빛의영상','추후공지',0,'교양관 223호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2768,10,'GE','혁신의기술','추후공지',0,'교양관 224호','H',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2769,10,'GE','해부학과문화','추후공지',0,'교양관 105호','P',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2770,10,'GE','현대인의간질환예방과치료','추후공지',0,'교양관 201호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2771,10,'GE','구강영역의생화학적이해','추후공지',0,'교양관 202호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2772,10,'GE','두뇌여행자','추후공지',0,'교양관 203호','R',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2773,10,'GE','비전공자들을위한생리학','추후공지',0,'교양관 204호','Q',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2774,10,'GE','비전공자들을위한신경학','추후공지',0,'교양관 205호','K',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2775,10,'GE','생체분자세포그리고생명','추후공지',0,'교양관 201호','T',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2776,10,'GE','쉬운경영수학','추후공지',0,'교양관 202호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2777,10,'GE','유기소재화학','추후공지',0,'교양관 203호','L',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2778,10,'GE','점/접착소재합성및분석실험','추후공지',0,'교양관 204호','O',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2779,10,'GE','기초선형대수학','추후공지',0,'교양관 205호','Q',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2780,10,'GE','Scientific Research','추후공지',0,'교양관 301호','B',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2781,10,'GE','중남미사회','추후공지',0,'교양관 302호','F',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2782,10,'GE','대학글쓰기','추후공지',0,'교양관 303호','T',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2783,10,'GE','명저읽기(인문?사회?자연)','추후공지',0,'교양관 304호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2784,10,'GE','한국과세계소통의흐름','추후공지',0,'교양관 305호','H',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2785,10,'GE','창의적사고와코딩','추후공지',0,'교양관 301호','E',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2786,10,'GE','대학기초SW입문','추후공지',0,'교양관 302호','I',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2787,10,'GE','전공별SW활용','추후공지',0,'교양관 303호','K',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2788,10,'GE','진로설계와자기계발','추후공지',0,'교양관 304호','L',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2789,10,'GE','환경미화','추후공지',0,'교양관 305호','G',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2790,10,'GE','미학','추후공지',0,'교양관 401호','N',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2791,10,'GE','심적논쟁','추후공지',0,'교양관 402호','M',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2792,10,'GE','20세기역사와다큐멘터리','추후공지',0,'교양관 403호','O',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2793,10,'GE','다큐와주제가있는서양사이해','추후공지',0,'교양관 404호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2794,10,'GE','이상적인삶','추후공지',0,'교양관 405호','P',2023,'2학기',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2795,10,'GE','동서문학의이해','추후공지',0,'교양관 401호','M',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2796,10,'GE','동아시아역사의이해','추후공지',0,'교양관 402호','C',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2797,10,'GE','동아시아영화와문화그리고미의식','추후공지',0,'교양관 403호','D',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2798,10,'GE','동아시아해양사','추후공지',0,'교양관 404호','E',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2799,10,'GE','명심보감의지혜','추후공지',0,'교양관 405호','A',2023,'2학기',3); 

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2800,10,'GE','문학과심리학','추후공지',0,'교양관 401호','P',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2801,10,'GE','문학과철학의랑데부','추후공지',0,'교양관 402호','E',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2802,10,'GE','자유론','추후공지',0,'교양관 403호','S',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2803,10,'GE','자연,깨달음과하나되기','추후공지',0,'교양관 404호','G',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2804,10,'GE','일본문학의이해와감상','추후공지',0,'교양관 405호','I',2023,'2학기',3); 

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2805,10,'GE','한일관계,무엇이문제인가?','추후공지',0,'교양관 401호','M',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2806,10,'GE','한국의멋,유네스코세계유산','추후공지',0,'교양관 402호','N',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2807,10,'GE','라이프디자인씽킹','추후공지',0,'교양관 403호','O',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2808,10,'GE','플레이즐거움의발견','추후공지',0,'교양관 404호','K',2023,'2학기',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2809,10,'GE','유목문화와디지털유목민','추후공지',0,'교양관 405호','L',2023,'2학기',3);

commit;

--------------------------------------------------------------------------------

/*인원 추가*/
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('1번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('2번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('3번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('4번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('5번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('6번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('7번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('8번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('9번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('10번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('11번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('12번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('13번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('14번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('15번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('16번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('17번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('18번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('19번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('20번',34,'신소재공학과',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('21번',34,'신소재공학과',0,sysdate,sysdate);

/*CRUD*/
create sequence id_seq start with 001 increment by 1 MINVALUE 1 MAXVALUE 500;
select lpad(id_seq.nextval,3,'0') from student;
drop sequence id_seq;

select * from lecture where classroom like '%'||'제4공학관'||'%';
select * from lecture order by lecture_code asc;
select * from student order by id asc;
select * from student_img;
select * from lecture order by lecture_code asc;
select * from basket order by lecture_code asc;
select * from student_lecture order by id, lecture_code asc;

delete from student_lecture where id = 202334021;
delete from student where name = '양희동';
delete from basket;

update student set id=202300001 where name='admin';
update student set id=202300001, password='admin' where name='admin' and depart_code = 10;
update lecture set lecture_year = 2023 where college_code = 'H';
update lecture set student_full = 0 where lecture_code = 1414;
update student set id = 201811001 where name = '양희동';
update lecture set student_full = 0;

insert into student_lecture values(201811001, 113, 'x','x',1,'x','x', 2018, 'x',(SELECT ROUND(DBMS_RANDOM.VALUE() * 4) FROM DUAL),(SELECT ROUND(DBMS_RANDOM.VALUE() * 4) FROM DUAL),null);

alter table student add column depart_name varchar(50);

commit;

rollback;

/*과목 넣기*/
update student_lecture s set 
    lecture_name = (select lecture_name from lecture l where s.lecture_code = l.lecture_code),
    professor_name = (select professor_name from lecture l where s.lecture_code = l.lecture_code),
    grade = (select grade from lecture l where s.lecture_code = l.lecture_code),
    classroom =(select classroom from lecture l where s.lecture_code = l.lecture_code),
    lecture_time =(select lecture_time from lecture l where s.lecture_code = l.lecture_code),
    semester =(select semester from lecture l where s.lecture_code = l.lecture_code)
where s.lecture_code in(select lecture_code from lecture);

update student_lecture s set total = printf("%5.2f", (select (midterm_exam + final_exam)/2.0 from student_lecture where lecture_code = s.lecture_code));

DECLARE
 vn_data1 VARCHAR2(100) := '141';
BEGIN
    FOR i IN 0..9
    LOOP
    insert into student_lecture values(202334021, vn_data1||i, 'x','x',0,'x','x', 2023, 'x',(SELECT ROUND(DBMS_RANDOM.VALUE() * 4) FROM DUAL),(SELECT ROUND(DBMS_RANDOM.VALUE() * 4) FROM DUAL),null);
    END LOOP;
    COMMIT;
END;
