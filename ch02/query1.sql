show databases; 

-- CREATE TABLE member (
-- 	id varchar(10) NOT NULL,
--     pass varchar(10) NOT NULL,
--     name varchar(30) NOT NULL,
--     ragidate timestamp NOT NULL DEFAULT current_timestamp,
--     PRIMARY KEY(id)
-- )

select * from member;
insert into member (id,pass,name) values ('pnu1','1234','sw1');
insert into member (id,pass,name) values ('pnu2','1234','sw2');
-- delete from member where id = 'pnu1'; 

select * from board;
insert into board (title,content,id,visitcount) values ('title1','content1','id1',0);

-- 외래키로 테이블 사이의 관계 설정
-- board 테이블의 id 칼럼이 member 테이블의 id 칼럼을 참조하도록 해주는 외래키를 생성
-- Database -> Reverse Engineer -> MySQL Model -> EER Diagram
alter table board
	add constraint board_mem_fk foreign key (id)	-- board_mem_fk는 식별자라서 마음대로 작명 / board의 id
    references member (id);							-- member의 id

select * from spj;

alter table spj
	add constraint spj_s_fk foreign key (sno)
    references s (sno);
alter table spj
	add constraint spj_p_fk foreign key (pno)
    references p (pno);
alter table spj
	add constraint spj_j_fk foreign key (jno)
    references j (jno);
 