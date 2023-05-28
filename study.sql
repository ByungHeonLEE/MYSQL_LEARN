create DATABASE company;

USE company;

SELECT DATABASE();

DROP DATABASE company;

#unique를 선언하는 방법도 PK와 같다. 
#PK를 선언하는 방법은, attribute하나라면 primary key를 직접적으로 선언하고, 두 개면 primary key(a,b)이렇게 설정한다.
create table
    DEPARTMENT(
        id INT PRIMARY KEY,
        name VARCHAR(20) NOT NULL UNIQUE,
        leader_id INT
    );

create table
    EMPLOYEE(
        id INT Primary KEY,
        name VARCHAR(20) NOT NULL,
        birth_date DATE,
        sex CHAR(1) CHECK(sex in ('M', 'F')),
        position VARCHAR(10),
        salary INT DEFAULT 50000000,
        dept_id INT,
        FOREIGN KEY(dept_id) REFERENCES DEPARTMENT(id) on DELETE
        SET
            NULL on update CASCADE,
            CHECK (salary >= 50000000)
    );

create table
    PROJECT (
        id INT PRIMARY KEY,
        name VARCHAR(20) NOT NULL UNIQUE,
        leader_id INT,
        start_date DATE,
        end_date DATE,
        FOREIGN KEY(leader_id) REFERENCES EMPLOYEE(id) on DELETE
        SET
            NULL on update CASCADE,
            CHECK (start_date < end_date)
    );

create table
    WORKS_ON (
        empl_id INT,
        proj_id INT,
        PRIMARY KEY (empl_id, proj_id),
        FOREIGN KEY(empl_id) REFERENCES EMPLOYEE(id) on DELETE CASCADE on update CASCADE,
        FOREIGN KEY(proj_id) REFERENCES PROJECT(id) on DELETE CASCADE on update CASCADE
    );

ALTER TABLE department
ADD
    FOREIGN KEY (leader_id) REFERENCES employee(id) on DELETE
SET NULL on update CASCADE;