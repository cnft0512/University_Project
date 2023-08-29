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

/*���� ���*/
create table college(
    college_code varchar2(10) not null primary key,
    college_name varchar2(50) not null
);

insert into college values('H','�ι�����');
insert into college values('C','������');
insert into college values('E','��������');
insert into college values('S','��ȸ���д���');
insert into college values('F','�ܱ������');
insert into college values('GE','�������');

/*�а� ���*/
create table department(
    depart_code number not null primary key,
    college_code varchar2(10) not null,
    depart_name varchar2(50) not null,
    CONSTRAINT college_code foreign key(college_code) references college(college_code)
);

insert into department values(11,'H','ö�а�');
insert into department values(12,'H','���а�');
insert into department values(13,'H','������а�');
insert into department values(14,'H','����â���а�');
insert into department values(15,'H','����а�');

insert into department values(21,'C','��������а�');
insert into department values(22,'C','�����а�');
insert into department values(23,'C','�濵�а�');
insert into department values(24,'C','ȸ���а�');
insert into department values(25,'C','�����а�');

insert into department values(31,'E','�����а�');
insert into department values(32,'E','�ڵ������а�');
insert into department values(33,'E','��ǻ�Ͱ��а�');
insert into department values(34,'E','�ż�����а�');
insert into department values(35,'E','������а�');

insert into department values(41,'S','�ɸ��а�');
insert into department values(42,'S','��ġ�ܱ��а�');
insert into department values(43,'S','�����а�');
insert into department values(44,'S','�����а�');
insert into department values(45,'S','��������а�');

insert into department values(51,'F','�߱����');
insert into department values(52,'F','�����');
insert into department values(53,'F','���þƾ��');
insert into department values(54,'F','�����ξ��');
insert into department values(55,'F','�����������');

insert into department values(10,'GE','����');


/* ����ó�� �л� DB */
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

/* ������ */
/*
create table admin(
    id NUMBER not null primary key,
    email varchar2(100),
    phone varchar2(30)
);
*/

/*�л�*/
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

/*�л� ����*/
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

/*����*/
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

/*������û ��ٱ���*/
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

/*���� ����*/
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
    total number(3,2),         --�б� ��� ��
    CONSTRAINT student_lecture_id foreign key(id) references student(id)
);

/*��������*/
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

/*���縯�� ö�а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(110,11,'H','ö�����帧_1','�Ž�ȯ',1,'ö�а� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(111,11,'H','���ö�л�_1','�ڽ���',1,'ö�а� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(112,11,'H','����ö���Թ�_1','��â��',1,'ö�а� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(113,11,'H','����ö���Թ�_1','�̴���',1,'ö�а� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(114,11,'H','����_1','�����',1,'ö�а� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(115,11,'H','ö�����帧_2','�Ž�ȯ',1,'ö�а� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(116,11,'H','���ö�л�_2','�ڽ���',1,'ö�а� 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(117,11,'H','����ö���Թ�_2','��â��',1,'ö�а� 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(118,11,'H','����ö���Թ�_2','�̴���',1,'ö�а� 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(119,11,'H','����_2','�����',1,'ö�а� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(120,11,'H','����ö��_1','�Ž�ȯ',2,'ö�а� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(121,11,'H','�߼�ö�л�_1','�ڽ���',2,'ö�а� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(122,11,'H','����ö�н�ȭ_1','��â��',2,'ö�а� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(123,11,'H','����ö�н�ȭ_1','�̴���',2,'ö�а� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(124,11,'H','������_1','�����',2,'ö�а� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(125,11,'H','����ö��_2','�Ž�ȯ',2,'ö�а� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(126,11,'H','�߼�ö�л�_2','�ڽ���',2,'ö�а� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(127,11,'H','����ö�н�ȭ_2','��â��',2,'ö�а� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(128,11,'H','����ö�н�ȭ_2','�̴���',2,'ö�а� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(129,11,'H','������_2','�����',2,'ö�а� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(130,11,'H','���̻���_1','�Ž�ȯ',3,'ö�а� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(131,11,'H','�ٴ�ö�л�_1','�ڽ���',3,'ö�а� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(132,11,'H','ö�б���������_1','��â��',3,'ö�а� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(133,11,'H','ö�����ΰ���_1','�̴���',3,'ö�а� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(134,11,'H','�ö���ö��_1','�����',3,'ö�а� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(135,11,'H','���̻���_2','�Ž�ȯ',3,'ö�а� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(136,11,'H','�ٴ�ö�л�_2','�ڽ���',3,'ö�а� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(137,11,'H','ö�б���������_2','��â��',3,'ö�а� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(138,11,'H','ö�����ΰ���_2','�̴���',3,'ö�а� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(139,11,'H','�ö���ö��_2','�����',3,'ö�а� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(140,11,'H','����ö��_1','�Ž�ȯ',4,'ö�а� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(141,11,'H','����ö�л�_1','�ڽ���',4,'ö�а� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(142,11,'H','�����ö��_1','��â��',4,'ö�а� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(143,11,'H','���ν���ö��_1','�̴���',4,'ö�а� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(144,11,'H','�Ƹ������ڷ���ö��_1','�����',4,'ö�а� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(145,11,'H','����ö��_2','�Ž�ȯ',4,'ö�а� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(146,11,'H','����ö�л�_2','�ڽ���',4,'ö�а� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(147,11,'H','�����ö��_2','��â��',4,'ö�а� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(148,11,'H','���ν���ö��_2','�̴���',4,'ö�а� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(149,11,'H','�Ƹ������ڷ���ö��_2','�����',4,'ö�а� 405ȣ','T',2023,'2�б�',3);

/*���縯�� ���а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(210,12,'H','�ѱ������Թ�_1','ä����',1,'���а� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(211,12,'H','����������ǽ���_1','������',1,'���а� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(212,12,'H','���ƽþ��ǿ���͹�ȭ_1','���±�',1,'���а� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(213,12,'H','�����ǿ���͹�ȭ_1','��淮',1,'���а� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(214,12,'H','���ƽþư��߼���_1','�����',1,'���а� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(215,12,'H','�ѱ������Թ�_2','ä����',1,'���а� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(216,12,'H','����������ǽ���_2','������',1,'���а� 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(217,12,'H','���ƽþ��ǿ���͹�ȭ_2','���±�',1,'���а� 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(218,12,'H','�����ǿ���͹�ȭ_2','��淮',1,'���а� 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(219,12,'H','���ƽþư��߼���_2','�����',1,'���а� 105ȣ','E',2023,'2�б�',3);


insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(220,12,'H','��ϰ�����������_1','ä����',2,'���а� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(221,12,'H','����������ǽ���_1','������',2,'���а� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(222,12,'H','���ƽþƿ������_1','���±�',2,'���а� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(223,12,'H','�����ǿ���͹�ȭ_1','��淮',2,'���а� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(224,12,'H','���ƽþƱ������_1','�����',2,'���а� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(225,12,'H','��ϰ�����������_2','ä����',2,'���а� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(226,12,'H','����������ǽ���_2','������',2,'���а� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(227,12,'H','���ƽþƿ������_2','���±�',2,'���а� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(228,12,'H','�����ǿ���͹�ȭ_2','��淮',2,'���а� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(229,12,'H','���ƽþƱ������_2','�����',2,'���а� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(230,12,'H','���米��������_1','ä����',3,'���а� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(231,12,'H','����������ǽ���_1','������',3,'���а� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(232,12,'H','���κ����ѱ���_1','���±�',3,'���а� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(233,12,'H','����������ĸ���������_1','��淮',3,'���а� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(234,12,'H','������߼���_1','�����',3,'���а� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(235,12,'H','���米��������_2','ä����',3,'���а� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(236,12,'H','����������ǽ���_2','������',3,'���а� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(237,12,'H','���κ����ѱ���_2','���±�',3,'���а� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(238,12,'H','����������ĸ���������_2','��淮',3,'���а� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(239,12,'H','������߼���_2','�����',3,'���а� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(240,12,'H','��ϰ�����������_1','ä����',4,'���а� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(241,12,'H','����������ǽ���_1','������',4,'���а� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(242,12,'H','���ٴ��ѱ���ȸ�ǰ����ͻ�Ȱ_1','���±�',4,'���а� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(243,12,'H','�ѱ����ι�Ž��_1','��淮',4,'���а� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(244,12,'H','����������_1','�����',4,'���а� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(245,12,'H','��ϰ�����������_2','ä����',4,'���а� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(246,12,'H','����������ǽ���_2','������',4,'���а� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(247,12,'H','���ٴ��ѱ���ȸ�ǰ����ͻ�Ȱ_2','���±�',4,'���а� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(248,12,'H','�ѱ����ι�Ž��_2','��淮',4,'���а� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(249,12,'H','����������_2','�����',4,'���а� 405ȣ','T',2023,'2�б�',3);

/*���縯�� ������а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(310,13,'H','���а���_1','������',1,'���а� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(311,13,'H','����а���_1','������',1,'���а� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(312,13,'H','�����������ǽ���_1','����ä',1,'���а� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(313,13,'H','�����������_1','���õ�',1,'���а� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(314,13,'H','��������翬����������_1','�ۼ���',1,'���а� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(315,13,'H','���а���_2','������',1,'���а� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(316,13,'H','����а���_2','������',1,'���а� 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(317,13,'H','�����������ǽ���_2','����ä',1,'���а� 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(318,13,'H','�����������_2','���õ�',1,'���а� 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(319,13,'H','��������翬����������_2','�ۼ���',1,'���а� 105ȣ','E',2023,'2�б�',3);


insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(320,13,'H','���߸�ü���ѱ���_1','������',2,'���а� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(321,13,'H','���������������_1','������',2,'���а� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(322,13,'H','�����������ǽ���_1','����ä',2,'���а� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(323,13,'H','��ü����ڷᰭ��_1','���õ�',2,'���а� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(324,13,'H','����ġ��_1','�ۼ���',2,'���а� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(325,13,'H','���߸�ü���ѱ���_2','������',2,'���а� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(326,13,'H','���������������_2','������',2,'���а� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(327,13,'H','�����������ǽ���_2','����ä',2,'���а� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(328,13,'H','��ü����ڷᰭ��_2','���õ�',2,'���а� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(329,13,'H','����ġ��_2','�ۼ���',2,'���а� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(330,13,'H','���蹮ȭ��â�������б�_1','������',3,'���а� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(331,13,'H','�ܱ���μ����ѱ���_1','������',3,'���а� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(332,13,'H','�����������ǽ���_1','����ä',3,'���а� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(333,13,'H','�ǻ�����ȭ���_1','���õ�',3,'���а� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(334,13,'H','�ǻ���뱳����_1','�ۼ���',3,'���а� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(335,13,'H','���米��������_2','������',3,'���а� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(336,13,'H','����������ǽ���_2','������',3,'���а� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(337,13,'H','���κ����ѱ���_2','����ä',3,'���а� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(338,13,'H','�ǻ�����ȭ���_2','���õ�',3,'���а� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(339,13,'H','�ǻ���뱳����_2','�ۼ���',3,'���а� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(340,13,'H','�ѱ������ð���_1','������',4,'���а� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(341,13,'H','�ѱ����б�����_1','������',4,'���а� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(342,13,'H','�����������ǽ���_1','����ä',4,'���а� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(343,13,'H','�ѱ����_1','���õ�',4,'���а� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(344,13,'H','�ѱ��ѹ��з�_1','�ۼ���',4,'���а� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(345,13,'H','�ѱ������ð���_2','������',4,'���а� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(346,13,'H','�ѱ����б�����_2','������',4,'���а� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(347,13,'H','�����������ǽ���_2','����ä',4,'���а� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(348,13,'H','�ѱ����_2','���õ�',4,'���а� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(349,13,'H','�ѱ��ѹ��з�_2','�ۼ���',4,'���а� 405ȣ','T',2023,'2�б�',3);

/*������ ����â�۰�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(410,14,'H','��������_1','�ż���',1,'��â�� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(411,14,'H','�Ҽ�������_1','������',1,'��â�� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(412,14,'H','���������_1','������',1,'��â�� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(413,14,'H','���忬��_1','�ڻ��',1,'��â�� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(414,14,'H','�Ƶ����з�_1','��پ�',1,'��â�� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(415,14,'H','��������_2','�ż���',1,'��â�� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(416,14,'H','�Ҽ�������_2','������',1,'��â�� 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(417,14,'H','���������_2','������',1,'��â�� 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(418,14,'H','���忬��_2','�ڻ��',1,'��â�� 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(419,14,'H','�Ƶ����з�_2','��پ�',1,'��â�� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(420,14,'H','��â�۷�_1','�ż���',2,'��â�� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(421,14,'H','�Ҽ�â�۷�_1','������',2,'��â�� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(422,14,'H','���â�۷�_1','������',2,'��â�� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(423,14,'H','â�۱���_1','�ڻ��',2,'��â�� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(424,14,'H','���п��������_1','��پ�',2,'��â�� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(425,14,'H','��â�۷�_2','�ż���',2,'��â�� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(426,14,'H','�Ҽ�â�۷�_2','������',2,'��â�� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(427,14,'H','���â�۷�_2','������',2,'��â�� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(428,14,'H','â�۱���_2','�ڻ��',2,'��â�� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(429,14,'H','���п��������_2','��پ�',2,'��â�� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(430,14,'H','��â�ۿ���1_1','�ż���',3,'��â�� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(431,14,'H','�Ҽ�â�ۿ���1_1','������',3,'��â�� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(432,14,'H','�Ҽ�������_1','������',3,'��â�� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(433,14,'H','�����Ư��_1','�ڻ��',3,'��â�� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(434,14,'H','��â�۰����л�_1','��پ�',3,'��â�� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(435,14,'H','��â�ۿ���1_2','�ż���',3,'��â�� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(436,14,'H','�Ҽ�â�ۿ���1_2','������',3,'��â�� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(437,14,'H','�Ҽ�������_2','������',3,'��â�� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(438,14,'H','�����Ư��_2','�ڻ��',3,'��â�� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(439,14,'H','��â�۰����л�_2','��پ�',3,'��â�� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(440,14,'H','���������_1','�ż���',4,'��â�� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(441,14,'H','�ѱ����б�����_1','������',4,'��â�� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(442,14,'H','����ġ����_1','������',4,'��â�� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(443,14,'H','�������Ư��_1','�ڻ��',4,'��â�� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(444,14,'H','��â�۰�����_1','��پ�',4,'��â�� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(445,14,'H','���������_2','�ż���',4,'��â�� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(446,14,'H','�ѱ����б�����_2','������',4,'��â�� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(447,14,'H','����ġ����_2','������',4,'��â�� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(448,14,'H','�������Ư��_2','�ڻ��',4,'��â�� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(449,14,'H','��â�۰�����_2','��پ�',4,'��â�� 405ȣ','T',2023,'2�б�',3);

/*����� ����а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(510,15,'H','���;����_1','������',1,'���а� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(511,15,'H','���Ҹ��Ǽ���_1','����ȣ',1,'���а� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(512,15,'H','������ǻ��_1','�ڻ�ö',1,'���а� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(513,15,'H','�����Ǿ��_1','��ȿ��',1,'���а� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(514,15,'H','���־�_1','��ȣ��',1,'���а� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(515,15,'H','���;����_2','������',1,'���а� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(516,15,'H','���Ҹ��Ǽ���_2','����ȣ',1,'���а� 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(517,15,'H','������ǻ��_2','�ڻ�ö',1,'���а� 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(518,15,'H','�����Ǿ��_2','��ȿ��',1,'���а� 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(519,15,'H','���־�_2','��ȣ��',1,'���а� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(520,15,'H','����л�_1','������',2,'���а� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(521,15,'H','���·�_1','����ȣ',2,'���а� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(522,15,'H','�����_1','�ڻ�ö',2,'���а� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(523,15,'H','����񱳾����_1','��ȿ��',2,'���а� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(524,15,'H','����_1','��ȣ��',2,'���а� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(525,15,'H','����л�_2','������',2,'���а� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(526,15,'H','���·�_2','����ȣ',2,'���а� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(527,15,'H','�����_2','�ڻ�ö',2,'���а� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(528,15,'H','����񱳾����_2','��ȿ��',2,'���а� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(529,15,'H','����_2','��ȣ��',2,'���а� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(530,15,'H','�ǹ̷�_1','������',3,'���а� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(531,15,'H','�ɸ������_1','����ȣ',3,'���а� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(532,15,'H','Ư�����Ư��_1','�ڻ�ö',3,'���а� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(533,15,'H','��ǻ�;����_1','��ȿ��',3,'���а� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(534,15,'H','��������������_1','��ȣ��',3,'���а� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(535,15,'H','�ǹ̷�_2','������',3,'���а� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(536,15,'H','�ɸ������_2','����ȣ',3,'���а� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(537,15,'H','Ư�����Ư��_2','�ڻ�ö',3,'���а� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(538,15,'H','��ǻ�;����_2','��ȿ��',3,'���а� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(539,15,'H','��������������_2','��ȣ��',3,'���а� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(540,15,'H','��ȸ�����_1','������',4,'���а� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(541,15,'H','��������_1','����ȣ',4,'���а� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(542,15,'H','ȭ���_1','�ڻ�ö',4,'���а� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(543,15,'H','����������_1','��ȿ��',4,'���а� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(544,15,'H','��ȭ����_1','��ȣ��',4,'���а� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(545,15,'H','��ȸ�����_2','������',4,'���а� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(546,15,'H','��������_2','����ȣ',4,'���а� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(547,15,'H','ȭ���_2','�ڻ�ö',4,'���а� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(548,15,'H','����������_2','��ȿ��',4,'���а� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(549,15,'H','��ȭ����_2','��ȣ��',4,'���а� 405ȣ','T',2023,'2�б�',3); 

/*�ѱ��ܴ� ��������а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(610,21,'C','�����п���_1','���忭',1,'��ȸ���а� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(611,21,'C','�����','������',1,'��ȸ���а� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(612,21,'C','Business Law','����ö',1,'��ȸ���а� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(613,21,'C','������������','�ڻ��',1,'��ȸ���а� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(614,21,'C','Econometrics','������',1,'��ȸ���а� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(615,21,'C','�����п���_2','���忭',1,'��ȸ���а� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(616,21,'C','��������','������',1,'��ȸ���а� 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(617,21,'C','International Law','����ö',1,'��ȸ���а� 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(618,21,'C','��������','�ڻ��',1,'��ȸ���а� 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(619,21,'C','���������̷�','������',1,'��ȸ���а� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(620,21,'C','�Žð����м�','���忭',2,'��ȸ���а� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(621,21,'C','��������','������',2,'��ȸ���а� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(622,21,'C','�̽ð����м�','����ö',2,'��ȸ���а� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(623,21,'C','����������','�ڻ��',2,'��ȸ���а� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(624,21,'C','Empirical Methods in Finance and Int Economics','������',2,'��ȸ���а� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(625,21,'C','International Financial and Fiscal Law','���忭',2,'��ȸ���а� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(626,21,'C','in International Business','������',2,'��ȸ���а� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(627,21,'C','International Conflict and game Theory','����ö',2,'��ȸ���а� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(628,21,'C','Law n International Finance','�ڻ��',2,'��ȸ���а� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(629,21,'C','��������������','������',2,'��ȸ���а� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(630,21,'C','����������å��_1','���忭',3,'��ȸ���а� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(631,21,'C','�����������Ⱥм�','������',3,'��ȸ���а� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(632,21,'C','����������å��','����ö',3,'��ȸ���а� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(633,21,'C','Legal Aspects of International Business','�ڻ��',3,'��ȸ���а� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(634,21,'C','International Investment Law','������',3,'��ȸ���а� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(635,21,'C','Empirical Methods in Finance and Int��l Economics','���忭',3,'��ȸ���а� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(636,21,'C','International Relations_1','������',3,'��ȸ���а� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(637,21,'C','Globalization and World Economy','����ö',3,'��ȸ���а� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(638,21,'C','������������м�','�ڻ��',3,'��ȸ���а� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(639,21,'C','������ġ������','������',3,'��ȸ���а� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(640,21,'C','�Ϲ�����������','���忭',4,'��ȸ���а� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(641,21,'C','�������ȯ���','������',4,'��ȸ���а� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(642,21,'C','Market Structure and International Trade_1','����ö',4,'��ȸ���а� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(643,21,'C','BRICs ������_1','�ڻ��',4,'��ȸ���а� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(644,21,'C','International Organization_1','������',4,'��ȸ���а� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(645,21,'C','����������å��_2','���忭',4,'��ȸ���а� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(646,21,'C','International Relations_2','������',4,'��ȸ���а� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(647,21,'C','Market Structure and International Trade_2','����ö',4,'��ȸ���а� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(648,21,'C','BRICs ������_2','�ڻ��',4,'��ȸ���а� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(649,21,'C','International Organization_2','������',4,'��ȸ���а� 405ȣ','T',2023,'2�б�',3); 

/*���縯�� �����а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(710,22,'C','�����а���_1','���ؼ�',1,'������ 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(711,22,'C','�����̷�','����',1,'������ 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(712,22,'C','�Žð�����','������',1,'������ 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(713,22,'C','������������','����',1,'������ 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(714,22,'C','�Žð�����������','���α�',1,'������ 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(715,22,'C','�����а���_2','���ؼ�',1,'������ 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(716,22,'C','�����̷а�����','����',1,'������ 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(717,22,'C','�̽ð�����','������',1,'������ 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(718,22,'C','������','����',1,'������ 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(719,22,'C','�̽ð�����������','���α�',1,'������ 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(720,22,'C','���������','���ؼ�',2,'������ 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(721,22,'C','��������','����',2,'������ 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(722,22,'C','������å���̳�','������',2,'������ 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(723,22,'C','���������','����',2,'������ 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(724,22,'C','�����м���','���α�',2,'������ 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(725,22,'C','�����м��̳�','���ؼ�',2,'������ 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(726,22,'C','������ĸ���������','����',2,'������ 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(727,22,'C','����������ǽ�','������',2,'������ 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(728,22,'C','�跮��������','����',2,'������ 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(729,22,'C','�跮������','���α�',2,'������ 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(730,22,'C','����������','���ؼ�',3,'������ 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(731,22,'C','����������','����',3,'������ 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(732,22,'C','����������','������',3,'������ 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(733,22,'C','����������','����',3,'������ 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(734,22,'C','�������з�','���α�',3,'������ 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(735,22,'C','���������','���ؼ�',3,'������ 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(736,22,'C','���������','����',3,'������ 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(737,22,'C','�뵿������','������',3,'������ 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(738,22,'C','�ٱ��������','����',3,'������ 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(739,22,'C','���ù�����������','���α�',3,'������ 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(740,22,'C','��������','���ؼ�',4,'������ 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(741,22,'C','���.������������ǽ�','����',4,'������ 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(742,22,'C','���������','������',4,'������ 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(743,22,'C','�û����','����',4,'������ 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(744,22,'C','���������','���α�',4,'������ 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(745,22,'C','������','���ؼ�',4,'������ 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(746,22,'C','�����м��̳�','����',4,'������ 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(747,22,'C','������','������',4,'������ 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(748,22,'C','ȭ�������','����',4,'������ 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(749,22,'C','ȯ�������','���α�',4,'������ 405ȣ','T',2023,'2�б�',3); 

/*���縯�� �濵�а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(810,23,'C','�濵�п���_1','�����',1,'�濵�� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(811,23,'C','������','�̵���',1,'�濵�� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(812,23,'C','����濵','���ö',1,'�濵�� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(813,23,'C','�����ڿ�����','��ȫ��',1,'�濵�� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(814,23,'C','�繫����','�ڿ���',1,'�濵�� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(815,23,'C','�濵�п���_2','�����',1,'�濵�� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(816,23,'C','SCM�������м�','�̵���',1,'�濵�� 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(817,23,'C','�Ž�������','���ö',1,'�濵�� 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(818,23,'C','�濵����','��ȫ��',1,'�濵�� 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(819,23,'C','�濵��ʺм�','�ڿ���',1,'�濵�� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(820,23,'C','�濵����Ʈ��������','�����',2,'�濵�� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(821,23,'C','�濵������','�̵���',2,'�濵�� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(822,23,'C','�濵������','���ö',2,'�濵�� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(823,23,'C','�濵���','��ȫ��',2,'�濵�� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(824,23,'C','�濵�а�����Ž��','�ڿ���',2,'�濵�� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(825,23,'C','�濵��ĸ���������','�����',2,'�濵�� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(826,23,'C','�濵������ǽ�','�̵���',2,'�濵�� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(827,23,'C','�跮�濵','���ö',2,'�濵�� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(828,23,'C','�����濵��','��ȫ��',2,'�濵�� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(829,23,'C','�����濵����','�ڿ���',2,'�濵�� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(830,23,'C','�۷ι��濵ĸ���������','�����',3,'�濵�� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(831,23,'C','�۷ι���ŸƮ����ʿ���','�̵���',3,'�濵�� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(832,23,'C','�۷ι��ô������������','���ö',3,'�濵�� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(833,23,'C','��������Ű��濵','��ȫ��',3,'�濵�� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(834,23,'C','�������ȸ','�ڿ���',3,'�濵�� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(835,23,'C','������°�ͻ���濵','�����',3,'�濵�� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(836,23,'C','����ùΰ���ȸ��ġ�濵','�̵���',3,'�濵�� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(837,23,'C','�������','���ö',3,'�濵�� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(838,23,'C','����繫','��ȫ��',3,'�濵�� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(839,23,'C','�ٹ�ȭ�濵','�ڿ���',3,'�濵�� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(840,23,'C','�����Ͱ��а������а濵','�����',4,'�濵�� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(841,23,'C','�����Ͱ��������ѱ��ʼ���','�̵���',4,'�濵�� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(842,23,'C','�����Ͱ������������α׷���','���ö',4,'�濵�� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(843,23,'C','�����ͺ��̽�Ȱ��','��ȫ��',4,'�濵�� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(844,23,'C','�����к���Ͻ�','�ڿ���',4,'�濵�� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(845,23,'C','�����ʰ��߷�','�����',4,'�濵�� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(846,23,'C','�����õ����ͺм�','�̵���',4,'�濵�� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(847,23,'C','������Ŀ�´����̼�','���ö',4,'�濵�� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(848,23,'C','����Ͻ������ѵ����͸��̴�','��ȫ��',4,'�濵�� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(849,23,'C','����Ͻ������ѵ�����Ȱ��','�ڿ���',4,'�濵�� 405ȣ','T',2023,'2�б�',3); 

/*���縯�� ȸ���а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(910,24,'C','ȸ���п���_1','�̼���',1,'ȸ��� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(911,24,'C','����ȸ��','�����',1,'ȸ��� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(912,24,'C','�߱�ȸ��1','������',1,'ȸ��� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(913,24,'C','AI��ȸ��','�ȼ���',1,'ȸ��� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(914,24,'C','AI��ȸ�赥���ͺм�','�ȼ���',1,'ȸ��� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(915,24,'C','ȸ���п���_2','�̼���',1,'ȸ��� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(916,24,'C','ITȰ�����ȸ��','�����',1,'ȸ��� 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(917,24,'C','ITȰ���繫ȸ��','������',1,'ȸ��� 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(918,24,'C','ITȰ��ȸ���ǻ����','�ȼ���',1,'ȸ��� 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(919,24,'C','���ȸ��','�ȼ���',1,'ȸ��� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(920,24,'C','����ȸ���ʿ���','�̼���',2,'ȸ��� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(921,24,'C','����ȸ��','�����',2,'ȸ��� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(922,24,'C','�۷ι��繫ȸ��','������',2,'ȸ��� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(923,24,'C','������ǰȸ��','�ȼ���',2,'ȸ��� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(924,24,'C','�����ġ��','�ȼ���',2,'ȸ��� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(925,24,'C','������豸����ESG','�̼���',2,'ȸ��� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(926,24,'C','���μ���','�����',2,'ȸ��� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(927,24,'C','���μ��ǹ�','������',2,'ȸ��� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(928,24,'C','�����򰡿ͺ���','�ȼ���',2,'ȸ��� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(929,24,'C','����ȸ�迬��','�ȼ���',2,'ȸ��� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(930,24,'C','�ҵ漼��','�̼���',3,'ȸ��� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(931,24,'C','��������ȸ�迬��','�����',3,'ȸ��� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(932,24,'C','����ȸ��','������',3,'ȸ��� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(933,24,'C','�繫��ǥ�м�','�ȼ���',3,'ȸ��� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(934,24,'C','�繫ȸ��','�ȼ���',3,'ȸ��� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(935,24,'C','�繫ȸ�迬��','�̼���',3,'ȸ��� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(936,24,'C','�������ڿ�����','�����',3,'ȸ��� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(937,24,'C','����ȸ��','������',3,'ȸ��� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(938,24,'C','����������','�ȼ���',3,'ȸ��� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(939,24,'C','�߱�ȸ��2','�ȼ���',3,'ȸ��� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(940,24,'C','��ǻ��Ȱ���ȸ��','�̼���',4,'ȸ��� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(941,24,'C','ȸ�谨��','�����',4,'ȸ��� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(942,24,'C','ȸ������','������',4,'ȸ��� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(943,24,'C','ȸ�������ý���','�ȼ���',4,'ȸ��� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(944,24,'C','ȸ���а�����Ž��','�ȼ���',4,'ȸ��� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(945,24,'C','ȸ���м��̳�','�̼���',4,'ȸ��� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(946,24,'C','ȸ����ĸ���������','�����',4,'ȸ��� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(947,24,'C','ȸ��������ǽ�1','������',4,'ȸ��� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(948,24,'C','ȸ��������ǽ�2','�ȼ���',4,'ȸ��� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(949,24,'C','�ڵ����ν����ϴ�ȸ��','�ȼ���',4,'ȸ��� 405ȣ','T',2023,'2�б�',3); 

/*����� �����а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1010,25,'C','�����п���_1','����ȣ',1,'������ 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1011,25,'C','�����п���','������',1,'������ 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1012,25,'C','�����濵��','���й�',1,'������ 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1013,25,'C','�����󹫷�','���ο�',1,'������ 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1014,25,'C','�ؿ�������������','�̻���',1,'������ 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1015,25,'C','�����п���_2','����ȣ',1,'������ 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1016,25,'C','ȸ�����','������',1,'������ 102ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1017,25,'C','������å��','���й�',1,'������ 103ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1018,25,'C','�۷ι������Ͻ������ý���','���ο�',1,'������ 104ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1019,25,'C','�۷ι�������å��','�̻���',1,'������ 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1020,25,'C','������������','����ȣ',2,'������ 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1021,25,'C','��������','������',2,'������ 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1022,25,'C','FTA�Ͱ���','���й�',2,'������ 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1023,25,'C','���淺ó','���ο�',2,'������ 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1024,25,'C','�Ļ���ǰ��','�̻���',2,'������ 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1025,25,'C','�������ڷ�','����ȣ',2,'������ 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1026,25,'C','����â����','������',2,'������ 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1027,25,'C','����������','���й�',2,'������ 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1028,25,'C','����������','���ο�',2,'������ 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1029,25,'C','�����繫����','�̻���',2,'������ 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1030,25,'C','�۷ι��濵����','����ȣ',3,'������ 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1031,25,'C','������������','������',3,'������ 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1032,25,'C','����������','���й�',3,'������ 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1033,25,'C','���氣���ڻ�ŷ�','���ο�',3,'������ 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1034,25,'C','����������','�̻���',3,'������ 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1035,25,'C','���������Ͻ���ʿ���','����ȣ',3,'������ 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1036,25,'C','�̸�¡���Ͽ���','������',3,'������ 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1037,25,'C','����������','���й�',3,'������ 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1038,25,'C','�����ڿ���','���ο�',3,'������ 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1039,25,'C','��ȯ��','�̻���',3,'������ 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1040,25,'C','��������м���','����ȣ',4,'������ 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1041,25,'C','�������ؿ��̿���','������',4,'������ 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1042,25,'C','���������м�','���й�',4,'������ 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1043,25,'C','���Ͻ�','���ο�',4,'������ 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1044,25,'C','��������̽�','�̻���',4,'������ 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1045,25,'C','�񱳹�ȭ�濵��','����ȣ',4,'������ 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1046,25,'C','����Ưȭ���ڻ�ŷ�����','������',4,'������ 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1047,25,'C','���̿��ｺģȯ�湫��','���й�',4,'������ 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1048,25,'C','���������','���ο�',4,'������ 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1049,25,'C','�������帶���ýǽ�','�̻���',4,'������ 405ȣ','T',2023,'2�б�',3); 

/*������ �����а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1110,31,'E','���м���_1','���ǿ�',1,'���а� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1111,31,'E','���й����й׽���_1','������',1,'���а� 112ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1112,31,'E','����ȭ�й׽���_1','����',1,'���а� 113ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1113,31,'E','������â�Ǽ���','�����',1,'���а� 114ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1114,31,'E','��������ó��','���ö',1,'���а� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1115,31,'E','���м���_2','���ǿ�',1,'���а� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1116,31,'E','���й����й׽���_2','������',1,'���а� 112ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1117,31,'E','����ȭ�й׽���_2','����',1,'���а� 113ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1118,31,'E','���м���_3','�����',1,'���а� 114ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1119,31,'E','���м���_4','���ö',1,'���а� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1120,31,'E','��ü����','���ǿ�',2,'���а� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1121,31,'E','������','������',2,'���а� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1122,31,'E','��ǻ�������輳��','����',2,'���а� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1123,31,'E','��ü����','�����',2,'���а� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1124,31,'E','������','���ö',2,'���а� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1125,31,'E','�����н���_1','���ǿ�',2,'���а� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1126,31,'E','���м�ġ�ؼ�','������',2,'���а� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1127,31,'E','Ȯ�����','����',2,'���а� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1128,31,'E','�����н���_2','�����',2,'���а� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1129,31,'E','�������','���ö',2,'���а� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1130,31,'E','������','���ǿ�',3,'���а� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1131,31,'E','�������','������',3,'���а� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1132,31,'E','��ī���򼳰�','����',3,'���а� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1133,31,'E','���̿��Ƿ���','�����',3,'���а� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1134,31,'E','����ũ�α��ý���','���ö',3,'���а� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1135,31,'E','������ü����','���ǿ�',3,'���а� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1136,31,'E','���ŵ���','������',3,'���а� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1137,31,'E','���ڱ��й�����','����',3,'���а� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1138,31,'E','ȯ�������','�����',3,'���а� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1139,31,'E','����Ҽ���','���ö',3,'���а� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1140,31,'E','�����ü����','���ǿ�',4,'���а� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1141,31,'E','���뿭����','������',4,'���а� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1142,31,'E','��īƮ�δн�','����',4,'���а� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1143,31,'E','���ý�������','�����',4,'���а� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1144,31,'E','��ü����','���ö',4,'���а� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1145,31,'E','�������','���ǿ�',4,'���а� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1146,31,'E','������','������',4,'���а� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1147,31,'E','��������ý���','����',4,'���а� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1148,31,'E','���������°���','�����',4,'���а� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1149,31,'E','���������','���ö',4,'���а� 405ȣ','T',2023,'2�б�',3); 

/*������ �ڵ������а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1210,32,'E','�����Թ�����_1','������',1,'�ڵ����� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1211,32,'E','�̷��ڵ������б���','�Ǽ���',1,'�ڵ����� 122ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1212,32,'E','��Ĺ���Ľ�','�赿��',1,'�ڵ����� 123ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1213,32,'E','����Ʈ������ΰ�����','������',1,'�ڵ����� 124ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1214,32,'E','����������','������',1,'�ڵ����� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1215,32,'E','�����Թ�����_2','������',1,'�ڵ����� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1216,32,'E','�Ӻ����ý���','�Ǽ���',1,'�ڵ����� 122ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1217,32,'E','��ü����','�赿��',1,'�ڵ����� 123ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1218,32,'E','���м���','������',1,'�ڵ����� 124ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1219,32,'E','3D�𵨸�','������',1,'�ڵ����� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1220,32,'E','�Ϲ��ڵ�����ɽ���','������',2,'�ڵ����� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1221,32,'E','�ڵ�����������ȸ��','�Ǽ���',2,'�ڵ����� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1222,32,'E','��������','�赿��',2,'�ڵ����� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1223,32,'E','��ġ�ؼ�','������',2,'�ڵ����� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1224,32,'E','������','������',2,'�ڵ����� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1225,32,'E','��ü����','������',2,'�ڵ����� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1226,32,'E','�����ڵ�������','�Ǽ���',2,'�ڵ����� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1227,32,'E','�����ڵ�����ɽ���','�赿��',2,'�ڵ����� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1228,32,'E','�ڵ������걸���ؼ�','������',2,'�ڵ����� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1229,32,'E','ROS����Ӻ����ý�������','������',2,'�ڵ����� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1230,32,'E','����Ҽ���','������',3,'�ڵ����� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1231,32,'E','�̷��ڵ������ս���','�Ǽ���',3,'�ڵ����� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1232,32,'E','�ڵ������װ���','�赿��',3,'�ڵ����� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1233,32,'E','������','������',3,'�ڵ����� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1234,32,'E','�ڵ�������','������',3,'�ڵ����� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1235,32,'E','�ڵ������꿭��ü�ؼ�','������',3,'�ڵ����� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1236,32,'E','���������ڵ���','�Ǽ���',3,'�ڵ����� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1237,32,'E','�ڵ������а���1(ĸ���������)','�赿��',3,'�ڵ����� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1238,32,'E','3D�𵨸�����','������',3,'�ڵ����� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1239,32,'E','�ڵ����������','������',3,'�ڵ����� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1240,32,'E','�ڵ�������Dynamics�ؼ�','������',4,'�ڵ����� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1241,32,'E','�ڵ�����������','�Ǽ���',4,'�ڵ����� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1242,32,'E','�������༾��','�赿��',4,'�ڵ����� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1243,32,'E','���������ΰ�����','������',4,'�ڵ����� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1244,32,'E','�������','������',4,'�ڵ����� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1245,32,'E','�ڵ�����','������',4,'�ڵ����� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1246,32,'E','�ڵ���NVH','�Ǽ���',4,'�ڵ����� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1247,32,'E','�ڵ��������ý��ۼ���','�赿��',4,'�ڵ����� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1248,32,'E','�ڵ����ΰ�����','������',4,'�ڵ����� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1249,32,'E','e-�Ŀ�Ʈ���μ���','������',4,'�ڵ����� 405ȣ','T',2023,'2�б�',3); 

/*���縯�� ��ǻ�Ͱ��а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1310,33,'E','��ǻ�Ϳ����α׷���_1','Ȳ����',1,'��ǻ�Ͱ� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1311,33,'E','��ü�����з�����','������',1,'��ǻ�Ͱ� 132ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1312,33,'E','��ü�������α׷��ּ���','����',1,'��ǻ�Ͱ� 133ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1313,33,'E','��ȸ�ι׼���','��ȿ��',1,'��ǻ�Ͱ� 134ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1314,33,'E','�ٺ��������ͺм�','�����',1,'��ǻ�Ͱ� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1315,33,'E','��ǻ�Ϳ����α׷���_2','Ȳ����',1,'��ǻ�Ͱ� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1316,33,'E','�����ͺ��̽�����','������',1,'��ǻ�Ͱ� 132ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1317,33,'E','����ũ�����μ���','����',1,'��ǻ�Ͱ� 133ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1318,33,'E','�����ذ���','��ȿ��',1,'��ǻ�Ͱ� 134ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1319,33,'E','���������','�����',1,'��ǻ�Ͱ� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1320,33,'E','����Ʈ�������','Ȳ����',2,'��ǻ�Ͱ� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1321,33,'E','�ý��ۼ��ɺм�','������',2,'��ǻ�Ͱ� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1322,33,'E','�ý��ۼ���Ʈ����ǽ�','����',2,'��ǻ�Ͱ� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1323,33,'E','�˰��򼳰�','��ȿ��',2,'��ǻ�Ͱ� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1324,33,'E','���丶Ÿ','�����',2,'��ǻ�Ͱ� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1325,33,'E','�ü��','Ȳ����',2,'��ǻ�Ͱ� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1326,33,'E','���н����α׷��ּ���','������',2,'��ǻ�Ͱ� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1327,33,'E','�̻����','����',2,'��ǻ�Ͱ� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1328,33,'E','�ΰ�����','��ȿ��',2,'��ǻ�Ͱ� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1329,33,'E','�ΰ��������α׷��ּ���','�����',2,'��ǻ�Ͱ� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1330,33,'E','�Ӻ����׸���ϱ��������Ͻ���','Ȳ����',3,'��ǻ�Ͱ� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1331,33,'E','�ڷᱸ��','������',3,'��ǻ�Ͱ� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1332,33,'E','�ڷᱸ������','����',3,'��ǻ�Ͱ� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1333,33,'E','���ռ���������Ʈ1','��ȿ��',3,'��ǻ�Ͱ� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1334,33,'E','â�Ǽ���Ʈ�����','�����',3,'��ǻ�Ͱ� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1335,33,'E','�����Ϸ�����','Ȳ����',3,'��ǻ�Ͱ� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1336,33,'E','��ǻ�ͱ׷��Ƚ�','������',3,'��ǻ�Ͱ� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1337,33,'E','��ǻ�ͳ�Ʈ��ũ','����',3,'��ǻ�Ͱ� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1338,33,'E','��ǻ����������Ư��','��ȿ��',3,'��ǻ�Ͱ� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1339,33,'E','��ǻ��������������ǽ�1','�����',3,'��ǻ�Ͱ� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1340,33,'E','����ó��','Ȳ����',4,'��ǻ�Ͱ� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1341,33,'E','���α׷��־���','������',4,'��ǻ�Ͱ� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1342,33,'E','���ռ���������Ʈ2','����',4,'��ǻ�Ͱ� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1343,33,'E','��ǻ��������������ǽ�2','��ȿ��',4,'��ǻ�Ͱ� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1344,33,'E','��ǻ�Ϳ����ͳ�','�����',4,'��ǻ�Ͱ� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1345,33,'E','���̹������̽�����������','Ȳ����',4,'��ǻ�Ͱ� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1346,33,'E','�ڵ����˰���','������',4,'��ǻ�Ͱ� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1347,33,'E','��ǻ��������������ǽ�3','����',4,'��ǻ�Ͱ� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1348,33,'E','��ǻ��������������ǽ�4','��ȿ��',4,'��ǻ�Ͱ� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1349,33,'E','���ռ���������Ʈ3','�����',4,'��ǻ�Ͱ� 405ȣ','T',2023,'2�б�',3); 

/*������ �ż�����а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1410,34,'E','������','���޿�',1,'��4���а� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1411,34,'E','��üȭ��','���ȫ',1,'��4���а� 142ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1412,34,'E','��ü����','����',1,'��4���а� 143ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1413,34,'E','������','������',1,'��4���а� 144ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1414,34,'E','��῭����','�����',1,'��4���а� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1415,34,'E','������','���޿�',1,'��4���а� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1416,34,'E','������ �� ���̷�','���ȫ',1,'��4���а� 142ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1417,34,'E','�ż�������Թ�','����',1,'��4���а� 143ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1418,34,'E','�����б��ʽ���','������',1,'��4���а� 144ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1419,34,'E','��ἳ�����','�����',1,'��4���а� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1420,34,'E','Ž������','���޿�',2,'��4���а� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1421,34,'E','��������ڱ�������','���ȫ',2,'��4���а� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1422,34,'E','����Ǳ��������','����',2,'��4���а� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1423,34,'E','����Ǳ���������','������',2,'��4���а� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1424,34,'E','�����ȭ��������','�����',2,'��4���а� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1425,34,'E','�̵������','���޿�',2,'��4���а� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1426,34,'E','����ǥ��Ư��','���ȫ',2,'��4���а� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1427,34,'E','��Ὺ��','����',2,'��4���а� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1428,34,'E','�����Է�','������',2,'��4���а� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1429,34,'E','�������ӵ���','�����',2,'��4���а� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1430,34,'E','����ڱ�������','���޿�',3,'��4���а� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1431,34,'E','���������','���ȫ',3,'��4���а� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1432,34,'E','�ݵ�ü����','����',3,'��4���а� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1433,34,'E','����͹�����','������',3,'��4���а� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1434,34,'E','�Ұ����','�����',3,'��4���а� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1435,34,'E','X��ȸ���м���','���޿�',3,'��4���а� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1436,34,'E','��������������','���ȫ',3,'��4���а� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1437,34,'E','������հ���','����',3,'��4���а� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1438,34,'E','���м���','������',3,'��4���а� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1439,34,'E','��Ṱ��ȭ��','�����',3,'��4���а� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1440,34,'E','���������','���޿�',4,'��4���а� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1441,34,'E','�ݵ�ü����','���ȫ',4,'��4���а� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1442,34,'E','�������ȭ��','����',4,'��4���а� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1443,34,'E','�ڸ����','������',4,'��4���а� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1444,34,'E','ȯ�����','�����',4,'��4���а� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1445,34,'E','�������','���޿�',4,'��4���а� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1446,34,'E','�������','���ȫ',4,'��4���а� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1447,34,'E','��ᰡ������','����',4,'��4���а� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1448,34,'E','�ձݼ�����','������',4,'��4���а� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1449,34,'E','�ݷ��̵����','�����',4,'��4���а� 405ȣ','T',2023,'2�б�',3); 

/*�Ѿ�� ������а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1510,35,'E','�⺻����1','������',1,'����� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1511,35,'E','�Ϲ�ȭ�й׽���1','������',1,'����� 152ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1512,35,'E','�Ϲݹ����й׽���1','������',1,'����� 153ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1513,35,'E','�̺�������1','�����',1,'����� 154ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1514,35,'E','���б����ö��������','��â��',1,'����� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1515,35,'E','�⺻����2','������',1,'����� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1516,35,'E','�Ϲ�ȭ�й׽���2','������',1,'����� 152ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1517,35,'E','�Ϲݹ����й׽���2','������',1,'����� 153ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1518,35,'E','�̺�������2','�����',1,'����� 154ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1519,35,'E','����Ʈ����������','��â��',1,'����� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1520,35,'E','����ȯ�����','������',2,'����� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1521,35,'E','���п���','������',2,'����� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1522,35,'E','�������','������',2,'����� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1523,35,'E','Adventure_Design(��������1)','�����',2,'����� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1524,35,'E','���౸���ý���','��â��',2,'����� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1525,35,'E','��������1','������',2,'����� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1526,35,'E','���౸��1','������',2,'����� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1527,35,'E','Adventure_Design(��������2)','������',2,'����� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1528,35,'E','��Ὺ��','�����',2,'����� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1529,35,'E','Ȯ������','��â��',2,'����� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1530,35,'E','���౸������1','������',3,'����� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1531,35,'E','�������ռ���1','������',3,'����� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1532,35,'E','����ð���ȹ','������',3,'����� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1533,35,'E','HVAC �ý��۵�����','�����',3,'����� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1534,35,'E','ö����ũ��Ʈ����1','��â��',3,'����� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1535,35,'E','���౸������2','������',3,'����� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1536,35,'E','�Ǽ��������1','������',3,'����� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1537,35,'E','�������ռ���2','������',3,'����� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1538,35,'E','����Ʈ�������','�����',3,'����� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1539,35,'E','��������','��â��',3,'����� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1540,35,'E','ö����ũ��Ʈ����2','������',4,'����� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1541,35,'E','��ġ�ؼ�','������',4,'����� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1542,35,'E','�������ĸ����PBL','������',4,'����� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1543,35,'E','�ǹ�������','�����',4,'����� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1544,35,'E','������','��â��',4,'����� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1545,35,'E','����������','������',4,'����� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1546,35,'E','���౸����ȹ','������',4,'����� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1547,35,'E','ȯ������°���','������',4,'����� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1548,35,'E','����ȸ�ι�����ý���	','�����',4,'����� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1549,35,'E','�Ǽ�������Ʈ��ȹ�װ���','��â��',4,'����� 405ȣ','T',2023,'2�б�',3); 

/*���縯�� �ɸ��а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1610,41,'S','�ɸ��а���_1','�ڿ���',1,'�������� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1611,41,'S','�������','����ȣ',1,'�������� 162ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1612,41,'S','����������','�����',1,'�������� 163ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1613,41,'S','��°�����Ī�׽ǽ�','������',1,'�������� 164ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1614,41,'S','�����ɸ���','������',1,'�������� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1615,41,'S','�ɸ��а���_2','�ڿ���',1,'�������� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1616,41,'S','����ġ��ǽ��׽��ۺ���','����ȣ',1,'�������� 162ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1617,41,'S','���������','�����',1,'�������� 163ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1618,41,'S','�ߴ޽ɸ���','������',1,'�������� 164ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1619,41,'S','�ߴ����ź�����','������',1,'�������� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1620,41,'S','�ߴ����ܹ׽ɸ���','�ڿ���',2,'�������� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1621,41,'S','���˽ɸ��׽ǽ�','����ȣ',2,'�������� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1622,41,'S','�θ����׻��','�����',2,'�������� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1623,41,'S','��ȸ�ɸ���','������',2,'�������� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1624,41,'S','��ȸ�����ߴ�','������',2,'�������� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1625,41,'S','����ɸ���','�ڿ���',2,'�������� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1626,41,'S','�������׽ǽ�','����ȣ',2,'�������� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1627,41,'S','����ʿ���','�����',2,'�������� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1628,41,'S','���ɸ��׽ǽ�','������',2,'�������� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1629,41,'S','�����ɸ���','������',2,'�������� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1630,41,'S','���ݰ��ΰ�����','�ڿ���',3,'�������� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1631,41,'S','���ݽɸ���','����ȣ',3,'�������� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1632,41,'S','����ɸ���','�����',3,'�������� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1633,41,'S','�Һ��ڽɸ���','������',3,'�������� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1634,41,'S','�ɸ��˻�׽ǽ�','������',3,'�������� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1635,41,'S','�ɸ����','�ڿ���',3,'�������� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1636,41,'S','�ɸ��а�����Ž��','����ȣ',3,'�������� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1637,41,'S','�ɸ��н���','�����',3,'�������� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1638,41,'S','�ɸ��п�����','������',3,'�������� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1639,41,'S','�ɸ���Ư��','������',3,'�������� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1640,41,'S','�ɸ�������ǽ�','�ڿ���',4,'�������� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1641,41,'S','�Ƶ��ɸ�ġ��','����ȣ',4,'�������� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1642,41,'S','�����ɸ���Ī�׽ǽ�','�����',4,'�������� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1643,41,'S','�̻�ɸ���','������',4,'�������� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1644,41,'S','�ΰ������Ʒýǽ�','������',4,'�������� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1645,41,'S','�����ڿ����߹׽ǽ�','�ڿ���',4,'�������� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1646,41,'S','��������','����ȣ',4,'�������� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1647,41,'S','�����ɸ���','�����',4,'�������� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1648,41,'S','�����ൿġ��׽ǽ�	','������',4,'�������� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1649,41,'S','�ӻ�ɸ���','������',4,'�������� 405ȣ','T',2023,'2�б�',3); 

/*�ѱ��ܴ� ��ġ�ܱ��а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1710,42,'S','�����ġ��󿬱�','���ȸ',1,'��2��ȸ���а� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1711,42,'S','�ٴ���ġ��󿬱�','���ÿ�',1,'��2��ȸ���а� 172ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1712,42,'S','������ġ��󿬱�','���汳',1,'��2��ȸ���а� 173ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1713,42,'S','������ġ��󼼹̳�','�̻�ȯ',1,'��2��ȸ���а� 174ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1714,42,'S','��ġ��ȸ�м��̳�','���繬',1,'��2��ȸ���а� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1715,42,'S','��ġ�ɸ��п���','���ȸ',1,'��2��ȸ���а� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1716,42,'S','��̴��򿬱�','���ÿ�',1,'��2��ȸ���а� 172ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1717,42,'S','�ѱ���ġ��󼼹̳�','���汳',1,'��2��ȸ���а� 173ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1718,42,'S','������ġ��󿬱�','�̻�ȯ',1,'��2��ȸ���а� 174ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1719,42,'S','������ġ�̷п���','���繬',1,'��2��ȸ���а� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1720,42,'S','ȯ����ġ�̷п���','���ȸ',2,'��2��ȸ���а� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1721,42,'S','�ٺ��κм����̳�','���ÿ�',2,'��2��ȸ���а� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1722,42,'S','�м���������','���汳',2,'��2��ȸ���а� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1723,42,'S','��ȸ���б������','�̻�ȯ',2,'��2��ȸ���а� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1724,42,'S','��ȸ����ö�м��̳�','���繬',2,'��2��ȸ���а� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1725,42,'S','��ȸ��迬��','���ȸ',2,'��2��ȸ���а� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1726,42,'S','�νķм��̳�','���ÿ�',2,'��2��ȸ���а� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1727,42,'S','��ġ�й���п���','���汳',2,'��2��ȸ���а� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1728,42,'S','���������������̳�','�̻�ȯ',2,'��2��ȸ���а� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1729,42,'S','������ġ�翬��','���繬',2,'��2��ȸ���а� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1730,42,'S','��������ġ����','���ȸ',3,'��2��ȸ���а� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1731,42,'S','���þ���ġ����','���ÿ�',3,'��2��ȸ���а� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1732,42,'S','�̱���ġ����','���汳',3,'��2��ȸ���а� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1733,42,'S','�񱳹������ǿ���','�̻�ȯ',3,'��2��ȸ���а� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1734,42,'S','����ȸ��ġ����','���繬',3,'��2��ȸ���а� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1735,42,'S','����ġ��������','���ȸ',3,'��2��ȸ���а� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1736,42,'S','����ġ���̳�','���ÿ�',3,'��2��ȸ���а� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1737,42,'S','����ġ����','���汳',3,'��2��ȸ���а� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1738,42,'S','������ġ����','�̻�ȯ',3,'��2��ȸ���а� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1739,42,'S','�Ϻ���ġ����','���繬',3,'��2��ȸ���а� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1740,42,'S','������ġ���̳�','���ȸ',4,'��2��ȸ���а� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1741,42,'S','�ѱ������������','���ÿ�',4,'��2��ȸ���а� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1742,42,'S','�ѱ����Ű�������','���汳',4,'��2��ȸ���а� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1743,42,'S','�ѱ���ġ�������̳�','�̻�ȯ',4,'��2��ȸ���а� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1744,42,'S','������ġ�������̳�','���繬',4,'��2��ȸ���а� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1745,42,'S','�������￬��','���ȸ',4,'��2��ȸ���а� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1746,42,'S','�����ⱸ����','���ÿ�',4,'��2��ȸ���а� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1747,42,'S','���þƿܱ���å����','���汳',4,'��2��ȸ���а� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1748,42,'S','�ܱ���å���̳�','�̻�ȯ',4,'��2��ȸ���а� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1749,42,'S','�ѱ��ܱ���å����','���繬',4,'��2��ȸ���а� 405ȣ','T',2023,'2�б�',3); 

/*���縯�� �����к�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1810,43,'S','�����������Թ�','����ö',1,'K�� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1811,43,'S','����������Թ�','�ֿ���',1,'K�� 182ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1812,43,'S','���������Թ�','������',1,'K�� 183ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1813,43,'S','EU����','���̰�',1,'K�� 184ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1814,43,'S','���뱹������ġ�ͼ�������','���ؼ�',1,'K�� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1815,43,'S','����������','����ö',1,'K�� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1816,43,'S','�������շ�','�ֿ���',1,'K�� 182ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1817,43,'S','���������ǽ���ĸ���������','������',1,'K�� 183ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1818,43,'S','��������ͼ�����ġ���','���̰�',1,'K�� 184ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1819,43,'S','���������̷�','���ؼ�',1,'K�� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1820,43,'S','���������а�������','����ö',2,'K�� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1821,43,'S','�������������','�ֿ���',2,'K�� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1822,43,'S','�����ⱸ��','������',2,'K�� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1823,43,'S','��������','���̰�',2,'K�� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1824,43,'S','������ġ����','���ؼ�',2,'K�� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1825,43,'S','��������','����ö',2,'K�� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1826,43,'S','������󿵾�','�ֿ���',2,'K�� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1827,43,'S','��������̷�1','������',2,'K�� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1828,43,'S','��������̷�2','���̰�',2,'K�� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1829,43,'S','�����а�����','���ؼ�',2,'K�� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1830,43,'S','�����й����','����ö',3,'K�� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1831,43,'S','�����п����1:�۷ι�����Ͻ�����','�ֿ���',3,'K�� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1832,43,'S','�����п����2','������',3,'K�� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1833,43,'S','�������߱����','���̰�',3,'K�� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1834,43,'S','����������ǽ�','���ؼ�',3,'K�� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1835,43,'S','�������°�����','����ö',3,'K�� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1836,43,'S','���������','�ֿ���',3,'K�� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1837,43,'S','��������������','������',3,'K�� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1838,43,'S','���������������','���̰�',3,'K�� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1839,43,'S','��-�߰���͵��ƽþ�����','���ؼ�',3,'K�� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1840,43,'S','�̱�����������','����ö',4,'K�� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1841,43,'S','�̱�����������','�ֿ���',4,'K�� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1842,43,'S','�̱��ǿܱ���å','������',4,'K�� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1843,43,'S','�̱�����ġ����','���̰�',4,'K�� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1844,43,'S','�̱��нû翬��','���ؼ�',4,'K�� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1845,43,'S','���ѿ���','����ö',4,'K�� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1846,43,'S','����ġ��','�ֿ���',4,'K�� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1847,43,'S','���������м�','������',4,'K�� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1848,43,'S','����ȭ�͹�������','���̰�',4,'K�� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1849,43,'S','�ܱ���','���ؼ�',4,'K�� 405ȣ','T',2023,'2�б�',3); 

/*���縯�� �����а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1910,44,'S','�����а���','�ڱ���',1,'�����ư� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1911,44,'S','ODA��å','������',1,'�����ư� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1912,44,'S','PSAT�Թ�','ä��ȣ',1,'�����ư� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1913,44,'S','�������������','�ڼ���',1,'�����ư� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1914,44,'S','����������','������',1,'�����ư� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1915,44,'S','�跮������','�ڱ���',1,'�����ư� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1916,44,'S','����������','������',1,'�����ư� 192ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1917,44,'S','����������','ä��ȣ',1,'�����ư� 193ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1918,44,'S','�������','�ڼ���',1,'�����ư� 194ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1919,44,'S','���б��������å','������',1,'�����ư� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1920,44,'S','����������','�ڱ���',2,'�����ư� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1921,44,'S','��ȭ��å','������',2,'�����ư� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1922,44,'S','�̵����å','ä��ȣ',2,'�����ư� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1923,44,'S','�����Ƿ���å','�ڼ���',2,'�����ư� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1924,44,'S','�����ο���å','������',2,'�����ư� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1925,44,'S','��ȸ��å��','�ڱ���',2,'�����ư� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1926,44,'S','�λ�������','������',2,'�����ư� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1927,44,'S','�糭��������','ä��ȣ',2,'�����ư� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1928,44,'S','�繫������','�ڼ���',2,'�����ư� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1929,44,'S','��������ȹ��','������',2,'�����ư� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1930,44,'S','���α����м�','�ڱ���',3,'�����ư� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1931,44,'S','���οͺ����αⱸ:�۷ι�����Ͻ�����','������',3,'�����ư� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1932,44,'S','����ȸ���','ä��ȣ',3,'�����ư� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1933,44,'S','��å�м��򰡷�','�ڼ���',3,'�����ư� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1934,44,'S','��å��ʺм�','������',3,'�����ư� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1935,44,'S','��å�а���','�ڱ���',3,'�����ư� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1936,44,'S','��������','������',3,'�����ư� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1937,44,'S','�������ܰ���ʺм�','ä��ȣ',3,'�����ư� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1938,44,'S','������ġ��������ȸ','�ڼ���',3,'�����ư� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1939,44,'S','����������','������',3,'�����ư� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1940,44,'S','�������߷�','�ڱ���',4,'�����ư� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1941,44,'S','�ѱ����η�','������',4,'�����ư� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1942,44,'S','�������Žð���','ä��ȣ',4,'�����ư� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1943,44,'S','�������̽ð���','�ڼ���',4,'�����ư� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1944,44,'S','������������','������',4,'�����ư� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1945,44,'S','�����п���','�ڱ���',4,'�����ư� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1946,44,'S','����������ǽ�','������',4,'�����ư� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1947,44,'S','�������·�','ä��ȣ',4,'�����ư� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1948,44,'S','���','�ڼ���',4,'�����ư� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(1949,44,'S','ȯ��������','������',4,'�����ư� 405ȣ','T',2023,'2�б�',3); 

/*�泲�� ��������а�*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2110,45,'S','�̷�������','�պ���',1,'��ȸ���д��� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2111,45,'S','��������а���','������',1,'��ȸ���д��� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2112,45,'S','����Ŀ�´����̼� ����','���翵',1,'��ȸ���д��� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2113,45,'S','����� ����','�����',1,'��ȸ���д��� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2114,45,'S','����ġ�����','�̽¼�',1,'��ȸ���д��� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2115,45,'S','���θ����� ����','�պ���',1,'��ȸ���д��� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2116,45,'S','1�ι̵��������','������',1,'��ȸ���д��� 212ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2117,45,'S','������ ����','���翵',1,'��ȸ���д��� 213ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2118,45,'S','�̵��۾���','�����',1,'��ȸ���д��� 214ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2119,45,'S','�̵���̷��Թ�','�̽¼�',1,'��ȸ���д��� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2120,45,'S','����� Ŀ�´����̼�','�պ���',2,'��ȸ���д��� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2121,45,'S','�������������۽ǽ�','������',2,'��ȸ���д��� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2122,45,'S','�ѱ���л�','���翵',2,'��ȸ���д��� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2123,45,'S','��а� ���� ����','�����',2,'��ȸ���д��� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2124,45,'S','��ĳ��Ʈ���۽ǽ�','�̽¼�',2,'��ȸ���д��� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2125,45,'S','PR�� ����','�պ���',2,'��ȸ���д��� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2126,45,'S','���߹�ȭ��','������',2,'��ȸ���д��� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2127,45,'S','���������θ������۽ǽ�','���翵',2,'��ȸ���д��� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2128,45,'S','�̵��������','�����',2,'��ȸ���д��� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2129,45,'S','��������ȹ��','�̽¼�',2,'��ȸ���д��� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2130,45,'S','������ �̵�� ��ȭ','�պ���',3,'��ȸ���д��� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2131,45,'S','����PR������Ʈ','������',3,'��ȸ���д��� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2132,45,'S','�̵���÷���','���翵',3,'��ȸ���д��� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2133,45,'S','�����긮Ƽ���Ҵ�','�����',3,'��ȸ���д��� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2134,45,'S','Ŀ�´����̼ǹ���','�̽¼�',3,'��ȸ���д��� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2135,45,'S','���빮ȭ�̷�','�պ���',3,'��ȸ���д��� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2136,45,'S','HCI Ŀ�´����̼�','������',3,'��ȸ���д��� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2137,45,'S','�̵����ͺм���Ȱ��','���翵',3,'��ȸ���д��� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2138,45,'S','�̵���̷�','�����',3,'��ȸ���д��� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2139,45,'S','��ȸ���� �����������','�̽¼�',3,'��ȸ���д��� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2140,45,'S','��ǻ��Ŀ�´����̼�','�պ���',4,'��ȸ���д��� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2141,45,'S','20����͹̵���Ǳ��','������',4,'��ȸ���д��� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2142,45,'S','�¶��� ���θ���','���翵',4,'��ȸ���д��� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2143,45,'S','������ �̵�� ��ȭ','�����',4,'��ȸ���д��� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2144,45,'S','�Һ����ൿ��','�̽¼�',4,'��ȸ���д��� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2145,45,'S','�̽��� ����','�պ���',4,'��ȸ���д��� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2146,45,'S','��ġĿ�´����̼�','������',4,'��ȸ���д��� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2147,45,'S','���翬�����','���翵',4,'��ȸ���д��� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2148,45,'S','Ŀ�´����̼�����','�����',4,'��ȸ���д��� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2149,45,'S','�۷ι���ȭ��','�̽¼�',4,'��ȸ���д��� 405ȣ','T',2023,'2�б�',3); 

/*���縯�� �߱����*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2210,51,'F','�߾�1','������',1,'C�� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2211,51,'F','�ѹ�1','������',1,'C�� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2212,51,'F','�߱���ȭ������','�ռ�',1,'C�� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2213,51,'F','�����ι����ѹ�1','������',1,'C�� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2214,51,'F','��ȭ���д��߱���','�ڴ���',1,'C�� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2215,51,'F','�߾�2','������',1,'C�� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2216,51,'F','�ѹ�2','������',1,'C�� 222ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2217,51,'F','�û��߱���','�ռ�',1,'C�� 223ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2218,51,'F','�����ι����ѹ�2','������',1,'C�� 224ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2219,51,'F','��ũ���߱���ʹ��߹�ȭ','�ڴ���',1,'C�� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2220,51,'F','�ǿ��߱���','������',2,'C�� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2221,51,'F','�߱�������������','������',2,'C�� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2222,51,'F','�߱�����������','�ռ�',2,'C�� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2223,51,'F','�߱����а�����������','������',2,'C�� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2224,51,'F','�߱���ȭ��â���귣������','�ڴ���',2,'C�� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2225,51,'F','�߱�����Ͻ���ȭ��â������','������',2,'C�� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2226,51,'F','�߱����������������','������',2,'C�� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2227,51,'F','�߱��Ҽ��Ǽ���','�ռ�',2,'C�� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2228,51,'F','�߱��ð����߱���ȭ','������',2,'C�� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2229,51,'F','�߱��ó���','�ڴ���',2,'C�� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2230,51,'F','�߱����������','������',3,'C�� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2231,51,'F','�߱�������翬����������','������',3,'C�� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2232,51,'F','�߱����������','�ռ�',3,'C�� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2233,51,'F','�߱�����߱���ȭ','������',3,'C�� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2234,51,'F','�߱����б�͹�ȭ','�ڴ���',3,'C�� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2235,51,'F','�߱����۹�','������',3,'C�� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2236,51,'F','�߱������������̼�','������',3,'C�� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2237,51,'F','�߱���ȭĸ���������','�ռ�',3,'C�� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2238,51,'F','�߱���ȭ�а�����Ž��','������',3,'C�� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2239,51,'F','�߱���ȭ������ǽ�','�ڴ���',3,'C�� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2240,51,'F','�߱����빮��������','������',4,'C�� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2241,51,'F','�߱�������ȭƯ��','������',4,'C�� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2242,51,'F','�߱����������','�ռ�',4,'C�� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2243,51,'F','�߱����빮�а���','������',4,'C�� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2244,51,'F','�߱����빮�а����߹�ȭ','�ڴ���',4,'C�� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2245,51,'F','�߱����빮��������','������',4,'C�� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2246,51,'F','�������������','������',4,'C�� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2247,51,'F','�����߱���','�ռ�',4,'C�� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2248,51,'F','����߱���','������',4,'C�� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2249,51,'F','�����߱����','�ڴ���',4,'C�� 405ȣ','T',2023,'2�б�',3); 

/*���縯�� �����*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2310,52,'F','������������','������',1,'���ȯ�� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2311,52,'F','���̹�ȭ������','��â��',1,'���ȯ�� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2312,52,'F','AI�Ϳ���','������',1,'���ȯ�� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2313,52,'F','����ȸ���뿪����','�ɿ���',1,'���ȯ�� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2314,52,'F','�׷��ȳ������־��丮�ڸ�','����Ž��',1,'���ȯ�� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2315,52,'F','�ٹ�ȭ��ȸ�͹���','������',1,'���ȯ�� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2316,52,'F','���а�ȯ��','��â��',1,'���ȯ�� 222ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2317,52,'F','��ȭ����������迵��','������',1,'���ȯ�� 223ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2318,52,'F','��ȭ���ǹ�����','�ɿ���',1,'���ȯ�� 224ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2319,52,'F','��ȭ��Ŀ�´����̼�','����Ž��',1,'���ȯ�� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2320,52,'F','��ȭ�������ι������з���������ȯ','������',2,'���ȯ�� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2321,52,'F','�̱����а���','��â��',2,'���ȯ�� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2322,52,'F','�̱�����������','������',2,'���ȯ�� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2323,52,'F','�̱���ȭ������','�ɿ���',2,'���ȯ�� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2324,52,'F','�̵���','����Ž��',2,'���ȯ�� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2325,52,'F','�̵��������û�ؿ���','������',2,'���ȯ�� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2326,52,'F','�����ǿ���������','��â��',2,'���ȯ�� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2327,52,'F','���迵��ͻ��ο���','������',2,'���ȯ�� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2328,52,'F','�Ҽ������°��ô�����','�ɿ���',2,'���ȯ�� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2329,52,'F','��ŸƮ�������ǥ','����Ž��',2,'���ȯ�� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2330,52,'F','���丮�ڸ�������','������',3,'���ȯ�� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2331,52,'F','�������°��ô�����','��â��',3,'���ȯ�� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2332,52,'F','�ǿ뿵����','������',3,'���ȯ�� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2333,52,'F','�ɸ�������Ǽ���','�ɿ���',3,'���ȯ�� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2334,52,'F','�Ƶ������','����Ž��',3,'���ȯ�� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2335,52,'F','��ȭ�Ǻ������پ缺','������',3,'���ȯ�� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2336,52,'F','������������','��â��',3,'���ȯ�� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2337,52,'F','���������°��ô�����','������',3,'���ȯ�� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2338,52,'F','�����а���','�ɿ���',3,'���ȯ�� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2339,52,'F','���̴��߹�ȭ������','����Ž��',3,'���ȯ�� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2340,52,'F','���̹��а�����','������',4,'���ȯ�� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2341,52,'F','���̹��а������ü','��â��',4,'���ȯ�� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2342,52,'F','���̹��а��ھ�Ž��','������',4,'���ȯ�� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2343,52,'F','���̹��а������ȸ','�ɿ���',4,'���ȯ�� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2344,52,'F','���̹�ȭ�ǹ��:��ȭ�ͼ���','����Ž��',4,'���ȯ�� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2345,52,'F','���̻깮','������',4,'���ȯ�� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2346,52,'F','���̼Ҽ�������','��â��',4,'���ȯ�� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2347,52,'F','��������̷а��Ʒ�','������',4,'���ȯ�� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2348,52,'F','������̾���','�ɿ���',4,'���ȯ�� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2349,52,'F','�����������ǽ�','����Ž��',4,'���ȯ�� 405ȣ','T',2023,'2�б�',3); 

/*�ѱ��ܴ� ���þƾ��*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2410,53,'F','���þƾ�ϱ�_1','ȫ�ϼ�',1,'�������� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2411,53,'F','���þƾ��_1','�߼���',1,'�������� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2412,53,'F','���þƾ������_1','ǥ���',1,'�������� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2413,53,'F','���þƾ���ǽ�_1','�汳��',1,'�������� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2414,53,'F','���þƾ��б�_1','������',1,'�������� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2415,53,'F','���þƾ�ϱ�_2','ȫ�ϼ�',1,'�������� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2416,53,'F','���þƾ��_2','�߼���',1,'�������� 222ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2417,53,'F','���þƾ������_2','ǥ���',1,'�������� 223ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2418,53,'F','���þƾ���ǽ�_2','�汳��',1,'�������� 224ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2419,53,'F','���þƾ��б�_2','������',1,'�������� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2420,53,'F','���þƾ�ϱ��ȭ_1','ȫ�ϼ�',2,'�������� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2421,53,'F','���þƾ����ȭ_1','�߼���',2,'�������� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2422,53,'F','���þƾ��������ȭ_1','ǥ���',2,'�������� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2423,53,'F','���þƾ���ǽ���ȭ_1','�汳��',2,'�������� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2424,53,'F','���þƾ��б��ȭ_1','������',2,'�������� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2425,53,'F','���þƾ�ϱ��ȭ_2','ȫ�ϼ�',2,'�������� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2426,53,'F','���þƾ����ȭ_2','�߼���',2,'�������� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2427,53,'F','���þƾ��������ȭ_2','ǥ���',2,'�������� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2428,53,'F','���þƾ���ǽ���ȭ_2','�汳��',2,'�������� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2429,53,'F','���þƾ��б��ȭ_2','������',2,'�������� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2430,53,'F','���þƹ����ؽ�Ʈ����','ȫ�ϼ�',3,'�������� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2431,53,'F','���þƹ����ؽ�Ʈ�м�','�߼���',3,'�������� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2432,53,'F','���þơ�����ũ�������� �ι������� ��ȸ','ǥ���',3,'�������� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2433,53,'F','���þƽǿ빮��ȭ','�汳��',3,'�������� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2434,53,'F','�ؽ�Ʈ���д·��þ�','������',3,'�������� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2435,53,'F','���þơ�����ũ�������� ������ ����','ȫ�ϼ�',3,'�������� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2436,53,'F','���þơ�����ũ�������� ���� ��ȭ','�߼���',3,'�������� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2437,53,'F','���þƾ���','ǥ���',3,'�������� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2438,53,'F','���þƾ�������','�汳��',3,'�������� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2439,53,'F','19���ⷯ�þƹ���������','������',3,'�������� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2440,53,'F','���þ��۰�����','ȫ�ϼ�',4,'�������� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2441,53,'F','���þƿ���','�߼���',4,'�������� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2442,53,'F','���þơ�CIS��������','ǥ���',4,'�������� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2443,53,'F','�ص����ú����ư��߰� ��������','�汳��',4,'�������� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2444,53,'F','20���ⷯ�þƹ���������','������',4,'�������� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2445,53,'F','���þƹ��л������','ȫ�ϼ�',4,'�������� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2446,53,'F','���þ���ġ���ܱ�','�߼���',4,'�������� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2447,53,'F','���þư���','ǥ���',4,'�������� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2448,53,'F','���þƹ�ȭ�������̳�','�汳��',4,'�������� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2449,53,'F','���뷯�þƻ�ȸ�͹�ȭ','������',4,'�������� 405ȣ','T',2023,'2�б�',3); 

/*�ѱ��ܴ� �����ξ��*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2510,54,'F','�����ξ� ȸȭI_1','������',1,'��2�������� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2511,54,'F','�ʱ޽����ξ� �б�_1','�����',1,'��2�������� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2512,54,'F','�ʱ޽����ξ� ����_1','������',1,'��2�������� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2513,54,'F','�ʱ޽����ξ��_1','�ۿ���',1,'��2�������� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2514,54,'F','������ ��ȭ��_1','������',1,'��2�������� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2515,54,'F','�����ξ� ȸȭI_2','������',1,'��2�������� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2516,54,'F','�ʱ޽����ξ� �б�_2','�����',1,'��2�������� 222ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2517,54,'F','�ʱ޽����ξ� ����_2','������',1,'��2�������� 223ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2518,54,'F','�ʱ޽����ξ��_2','�ۿ���',1,'��2�������� 224ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2519,54,'F','������ ��ȭ��_2','������',1,'��2�������� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2520,54,'F','�����ξ� ȸȭII_1','������',2,'��2�������� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2521,54,'F','�߱޽����ξ� �б�_1','�����',2,'��2�������� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2522,54,'F','�߱޽����ξ� ����_1','������',2,'��2�������� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2523,54,'F','�߱޽����ξ��_1','�ۿ���',2,'��2�������� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2524,54,'F','�߽���-�߹�-ī���� ������ ����','������',2,'��2�������� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2525,54,'F','�����ξ� ȸȭII_2','������',2,'��2�������� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2526,54,'F','�߱޽����ξ� �б�_2','�����',2,'��2�������� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2527,54,'F','�߱޽����ξ� ����_2','������',2,'��2�������� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2528,54,'F','�߱޽����ξ��_2','�ۿ���',2,'��2�������� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2529,54,'F','���������� ����','������',2,'��2�������� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2530,54,'F','�߳��� ����','������',3,'��2�������� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2531,54,'F','�߳��� ��ȭ��','�����',3,'��2�������� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2532,54,'F','�û�������','������',3,'��2�������� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2533,54,'F','�����ι��л�','�ۿ���',3,'��2�������� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2534,54,'F','�߳��̹��л�','������',3,'��2�������� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2535,54,'F','�߳��� ��ġ','������',3,'��2�������� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2536,54,'F','�����ξ� ����Х�','�����',3,'��2�������� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2537,54,'F','�����ξ� ����Х�','������',3,'��2�������� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2538,54,'F','�߳��� �����������¥�','�ۿ���',3,'��2�������� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2539,54,'F','�߳��� �����������¥�','������',3,'��2�������� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2540,54,'F','�߳��� ������ ��ȸ','������',4,'��2�������� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2541,54,'F','�����ξ� ������ ����','�����',4,'��2�������� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2542,54,'F','�����ξ�ߴ޻�','������',4,'��2�������� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2543,54,'F','������ Ȳ�ݼ��� ����','�ۿ���',4,'��2�������� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2544,54,'F','������ ���빮��','������',4,'��2�������� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2545,54,'F','������ ����������','������',4,'��2�������� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2546,54,'F','������ ����������','�����',4,'��2�������� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2547,54,'F','�߳��� �Ҽ�','������',4,'��2�������� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2548,54,'F','������ �Ҽ�','�ۿ���',4,'��2�������� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2549,54,'F','�߳��� ����� ��','������',4,'��2�������� 405ȣ','T',2023,'2�б�',3); 

/*�ѱ��ܴ� �����������*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2610,55,'F','���ʽ�û������������I_1','�̽¿�',1,'��3�������� 101ȣ','A',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2611,55,'F','���������������I_1','�ӼҶ�',1,'��3�������� 102ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2612,55,'F','�ʱ������������_1','�Ǳ��',1,'��3�������� 103ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2613,55,'F','�ʱ�����������ȸȭ_1','Maira Jo?o',1,'��3�������� 104ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2614,55,'F','��.����������Թ�','Maria Luiza',1,'��3�������� 105ȣ','E',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2615,55,'F','���ʽ�û������������I_2','�̽¿�',1,'��3�������� 101ȣ','A',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2616,55,'F','���������������I_2','�ӼҶ�',1,'��3�������� 222ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2617,55,'F','�ʱ������������_2','�Ǳ��',1,'��3�������� 223ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2618,55,'F','�ʱ�����������ȸȭ_2','Maira Jo?o',1,'��3�������� 224ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2619,55,'F','�����������ī�����Թ�','Maria Luiza',1,'��3�������� 105ȣ','E',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2620,55,'F','�����������I','�̽¿�',2,'��3�������� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2621,55,'F','�߱�����������ȸȭ','�ӼҶ�',2,'��3�������� 202ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2622,55,'F','��ũ���̵������������I','�Ǳ��',2,'��3�������� 203ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2623,55,'F','�߱������������','Maira Jo?o',2,'��3�������� 204ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2624,55,'F','�߱������������','Maria Luiza',2,'��3�������� 205ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2625,55,'F','�����������а���ȸI','�̽¿�',2,'��3�������� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2626,55,'F','����������Թ�','�ӼҶ�',2,'��3�������� 202ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2627,55,'F','�����������II','�Ǳ��',2,'��3�������� 203ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2628,55,'F','�߱�����������ȸȭ','Maira Jo?o',2,'��3�������� 204ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2629,55,'F','��ũ���̵������������II','Maria Luiza',2,'��3�������� 205ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2630,55,'F','�߱������������','�̽¿�',3,'��3�������� 301ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2631,55,'F','�߱������������','�ӼҶ�',3,'��3�������� 302ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2632,55,'F','�����������а���ȸII','�Ǳ��',3,'��3�������� 303ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2633,55,'F','������������','Maira Jo?o',3,'��3�������� 304ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2634,55,'F','FLEX����������','Maria Luiza',3,'��3�������� 305ȣ','J',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2635,55,'F','�������������ȸȭ�۹�','�̽¿�',3,'��3�������� 301ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2636,55,'F','������������а���I','�ӼҶ�',3,'��3�������� 302ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2637,55,'F','���������뿪����I','�Ǳ��',3,'��3�������� 303ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2638,55,'F','�����������ѱ����I','Maira Jo?o',3,'��3�������� 304ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2639,55,'F','�����������������I','Maria Luiza',3,'��3�������� 305ȣ','J',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2640,55,'F','��������.�������ġ������','�̽¿�',4,'��3�������� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2641,55,'F','�������������ȸȭ�۹�','�ӼҶ�',4,'��3�������� 402ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2642,55,'F','������������а���II','�Ǳ��',4,'��3�������� 403ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2643,55,'F','���������뿪����II','Maira Jo?o',4,'��3�������� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2644,55,'F','�����������ѱ����II','Maria Luiza',4,'��3�������� 405ȣ','T',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2645,55,'F','�����������������II','�̽¿�',4,'��3�������� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2646,55,'F','��������.�������ġ���̳�','�ӼҶ�',4,'��3�������� 402ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2647,55,'F','����Ͻ������������뿪','�Ǳ��',4,'��3�������� 403ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2648,55,'F','�����������������','Maira Jo?o',4,'��3�������� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2649,55,'F','������ܱ������ڹ�','Maria Luiza',4,'��3�������� 405ȣ','T',2023,'2�б�',3); 

/*����*/
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2710,10,'GE','���ʱ����ʼ�','���İ���',0,'����� 101ȣ','K',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2711,10,'GE','�������ñ���','���İ���',0,'����� 102ȣ','J',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2712,10,'GE','ä��','���İ���',0,'����� 103ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2713,10,'GE','�����Ϲ�','���İ���',0,'����� 104ȣ','T',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2714,10,'GE','��ȭ����� ����','���İ���',0,'����� 105ȣ','D',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2715,10,'GE','����ǥ��','���İ���',0,'����� 101ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2716,10,'GE','���нþ���','���İ���',0,'����� 222ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2717,10,'GE','�ѱ�����������ǿ���','���İ���',0,'����� 223ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2718,10,'GE','���п���','���İ���',0,'����� 224ȣ','H',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2719,10,'GE','â���������ڵ�','���İ���',0,'����� 105ȣ','P',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2720,10,'GE','���μ��踦�����ڱ���','���İ���',0,'����� 201ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2721,10,'GE','��ȸ����','���İ���',0,'����� 202ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2722,10,'GE','��2�ܱ���-�߱����ʱ�','���İ���',0,'����� 203ȣ','R',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2723,10,'GE','��2�ܱ���-�Ϻ����ʱ�','���İ���',0,'����� 204ȣ','Q',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2724,10,'GE','��2�ܱ���-�����ξ��ʱ�','���İ���',0,'����� 205ȣ','K',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2725,10,'GE','��2�ܱ���-���Ͼ��ʱ�','���İ���',0,'����� 201ȣ','T',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2726,10,'GE','��2�ܱ���-���þƾ��ʱ�','���İ���',0,'����� 202ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2727,10,'GE','��2�ܱ���-���������ʱ�','���İ���',0,'����� 203ȣ','L',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2728,10,'GE','��2�ܱ���-������ʱ�','���İ���',0,'����� 204ȣ','O',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2729,10,'GE','��2�ܱ���-�ƶ����ʱ�','���İ���',0,'����� 205ȣ','Q',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2730,10,'GE','��2�ܱ���-�����������ʱ�','���İ���',0,'����� 301ȣ','B',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2731,10,'GE','�͹��̿����μ�����ڱ���','���İ���',0,'����� 302ȣ','F',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2732,10,'GE','Korean History','���İ���',0,'����� 303ȣ','T',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2733,10,'GE','����������̻�','���İ���',0,'����� 304ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2734,10,'GE','��ݹ���������','���İ���',0,'����� 305ȣ','H',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2735,10,'GE','��ȭ�Ͱ������ι���','���İ���',0,'����� 301ȣ','E',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2736,10,'GE','�����������','���İ���',0,'����� 302ȣ','I',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2737,10,'GE','����縦�ٲ������','���İ���',0,'����� 303ȣ','K',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2738,10,'GE','�����ΰ�','���İ���',0,'����� 304ȣ','L',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2739,10,'GE','���ֽ��б��â��','���İ���',0,'����� 305ȣ','G',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2740,10,'GE','�����Ѹ�������׵��Ǽ���','���İ���',0,'����� 401ȣ','N',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2741,10,'GE','�ѽ�������','���İ���',0,'����� 402ȣ','M',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2742,10,'GE','�ù��Ǳ���','���İ���',0,'����� 403ȣ','O',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2743,10,'GE','����������ͽù��ǱǸ�','���İ���',0,'����� 404ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2744,10,'GE','�������������','���İ���',0,'����� 405ȣ','P',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2745,10,'GE','�����ϱ⽬����ʼ���','���İ���',0,'����� 401ȣ','M',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2746,10,'GE','�ʵ��������','���İ���',0,'����� 402ȣ','C',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2747,10,'GE','�ǰ������Ǿ�','���İ���',0,'����� 403ȣ','D',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2748,10,'GE','��ȭ������','���İ���',0,'����� 404ȣ','E',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2749,10,'GE','���ǰ�','���İ���',0,'����� 405ȣ','A',2023,'1�б�',3); 

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2750,10,'GE','�����±ǵ�','���İ���',0,'����� 401ȣ','P',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2751,10,'GE','�����״Ͻ�','���İ���',0,'����� 402ȣ','E',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2752,10,'GE','����ȣ�ż�','���İ���',0,'����� 403ȣ','S',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2753,10,'GE','�����̷а�����','���İ���',0,'����� 404ȣ','G',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2754,10,'GE','�������̹���������','���İ���',0,'����� 405ȣ','I',2023,'1�б�',3); 

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2755,10,'GE','�ι��а�����','���İ���',0,'����� 401ȣ','M',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2756,10,'GE','��â���Թ�','���İ���',0,'����� 402ȣ','N',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2757,10,'GE','�����������','���İ���',0,'����� 403ȣ','O',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2758,10,'GE','Political Science','���İ���',0,'����� 404ȣ','K',2023,'1�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2759,10,'GE','PEET�������Ϲ�ȭ��','���İ���',0,'����� 405ȣ','L',2023,'1�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2760,10,'GE','��ȭ�κ��³�����','���İ���',0,'����� 101ȣ','K',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2761,10,'GE','��������-�������','���İ���',0,'����� 102ȣ','J',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2762,10,'GE','��Ȱ�����ι��̿�ƽ�̿�','���İ���',0,'����� 103ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2763,10,'GE','��Ȱȯ���ȭ��','���İ���',0,'����� 104ȣ','T',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2764,10,'GE','�˱⽬�����п�� ����','���İ���',0,'����� 105ȣ','D',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2765,10,'GE','�η��Ͱ���','���İ���',0,'����� 101ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2766,10,'GE','�η��Ǳ������ȭ','���İ���',0,'����� 222ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2767,10,'GE','ī�޶�ͺ��ǿ���','���İ���',0,'����� 223ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2768,10,'GE','�����Ǳ��','���İ���',0,'����� 224ȣ','H',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2769,10,'GE','�غ��а���ȭ','���İ���',0,'����� 105ȣ','P',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2770,10,'GE','�������ǰ���ȯ�����ġ��','���İ���',0,'����� 201ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2771,10,'GE','���������ǻ�ȭ��������','���İ���',0,'����� 202ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2772,10,'GE','�γ�������','���İ���',0,'����� 203ȣ','R',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2773,10,'GE','�������ڵ������ѻ�����','���İ���',0,'����� 204ȣ','Q',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2774,10,'GE','�������ڵ������ѽŰ���','���İ���',0,'����� 205ȣ','K',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2775,10,'GE','��ü���ڼ����׸������','���İ���',0,'����� 201ȣ','T',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2776,10,'GE','����濵����','���İ���',0,'����� 202ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2777,10,'GE','�������ȭ��','���İ���',0,'����� 203ȣ','L',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2778,10,'GE','��/���������ռ��׺м�����','���İ���',0,'����� 204ȣ','O',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2779,10,'GE','���ʼ��������','���İ���',0,'����� 205ȣ','Q',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2780,10,'GE','Scientific Research','���İ���',0,'����� 301ȣ','B',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2781,10,'GE','�߳��̻�ȸ','���İ���',0,'����� 302ȣ','F',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2782,10,'GE','���б۾���','���İ���',0,'����� 303ȣ','T',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2783,10,'GE','�����б�(�ι�?��ȸ?�ڿ�)','���İ���',0,'����� 304ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2784,10,'GE','�ѱ�������������帧','���İ���',0,'����� 305ȣ','H',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2785,10,'GE','â���������ڵ�','���İ���',0,'����� 301ȣ','E',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2786,10,'GE','���б���SW�Թ�','���İ���',0,'����� 302ȣ','I',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2787,10,'GE','������SWȰ��','���İ���',0,'����� 303ȣ','K',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2788,10,'GE','���μ�����ڱ���','���İ���',0,'����� 304ȣ','L',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2789,10,'GE','ȯ���ȭ','���İ���',0,'����� 305ȣ','G',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2790,10,'GE','����','���İ���',0,'����� 401ȣ','N',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2791,10,'GE','��������','���İ���',0,'����� 402ȣ','M',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2792,10,'GE','20���⿪��ʹ�ť���͸�','���İ���',0,'����� 403ȣ','O',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2793,10,'GE','��ť���������ִ¼��������','���İ���',0,'����� 404ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2794,10,'GE','�̻����λ�','���İ���',0,'����� 405ȣ','P',2023,'2�б�',3);

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2795,10,'GE','��������������','���İ���',0,'����� 401ȣ','M',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2796,10,'GE','���ƽþƿ���������','���İ���',0,'����� 402ȣ','C',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2797,10,'GE','���ƽþƿ�ȭ�͹�ȭ�׸�����ǽ�','���İ���',0,'����� 403ȣ','D',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2798,10,'GE','���ƽþ��ؾ��','���İ���',0,'����� 404ȣ','E',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2799,10,'GE','��ɺ���������','���İ���',0,'����� 405ȣ','A',2023,'2�б�',3); 

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2800,10,'GE','���а��ɸ���','���İ���',0,'����� 401ȣ','P',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2801,10,'GE','���а�ö���Ƕ�����','���İ���',0,'����� 402ȣ','E',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2802,10,'GE','������','���İ���',0,'����� 403ȣ','S',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2803,10,'GE','�ڿ�,���������ϳ��Ǳ�','���İ���',0,'����� 404ȣ','G',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2804,10,'GE','�Ϻ����������ؿͰ���','���İ���',0,'����� 405ȣ','I',2023,'2�б�',3); 

insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2805,10,'GE','���ϰ���,�����̹����ΰ�?','���İ���',0,'����� 401ȣ','M',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2806,10,'GE','�ѱ��Ǹ�,���׽��ڼ�������','���İ���',0,'����� 402ȣ','N',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2807,10,'GE','�����������ξ�ŷ','���İ���',0,'����� 403ȣ','O',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2808,10,'GE','�÷�����ſ��ǹ߰�','���İ���',0,'����� 404ȣ','K',2023,'2�б�',3);
insert into lecture(lecture_code, depart_code, college_code, lecture_name, professor_name, grade, classroom,lecture_time,lecture_year,semester,credit)  values(2809,10,'GE','����ȭ�͵����������','���İ���',0,'����� 405ȣ','L',2023,'2�б�',3);

commit;

--------------------------------------------------------------------------------

/*�ο� �߰�*/
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('1��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('2��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('3��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('4��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('5��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('6��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('7��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('8��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('9��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('10��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('11��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('12��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('13��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('14��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('15��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('16��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('17��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('18��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('19��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('20��',34,'�ż�����а�',0,sysdate,sysdate);
insert into student(name,depart_code,depart_name,academic_status,birth,create_date) values('21��',34,'�ż�����а�',0,sysdate,sysdate);

/*CRUD*/
create sequence id_seq start with 001 increment by 1 MINVALUE 1 MAXVALUE 500;
select lpad(id_seq.nextval,3,'0') from student;
drop sequence id_seq;

select * from lecture where classroom like '%'||'��4���а�'||'%';
select * from lecture order by lecture_code asc;
select * from student order by id asc;
select * from student_img;
select * from lecture order by lecture_code asc;
select * from basket order by lecture_code asc;
select * from student_lecture order by id, lecture_code asc;

delete from student_lecture where id = 202334021;
delete from student where name = '����';
delete from basket;

update student set id=202300001 where name='admin';
update student set id=202300001, password='admin' where name='admin' and depart_code = 10;
update lecture set lecture_year = 2023 where college_code = 'H';
update lecture set student_full = 0 where lecture_code = 1414;
update student set id = 201811001 where name = '����';
update lecture set student_full = 0;

insert into student_lecture values(201811001, 113, 'x','x',1,'x','x', 2018, 'x',(SELECT ROUND(DBMS_RANDOM.VALUE() * 4) FROM DUAL),(SELECT ROUND(DBMS_RANDOM.VALUE() * 4) FROM DUAL),null);

alter table student add column depart_name varchar(50);

commit;

rollback;

/*���� �ֱ�*/
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
