source sqlDB.sql; 

-- <exercise1> --
SET @myVar1 = 5 ;
SET @myVar2 = 3 ;
SET @myVar3 = 4.25 ;
SET @myVar4 = '가수 이름==> ' ;

SELECT @myVar1 ;
SELECT @myVar2 + @myVar3 ;

SELECT @myVar4 , Name FROM userTbl WHERE height > 180 ;

-- <exercise2> --
PREPARE myQuery 
    FROM 'SELECT Name, height FROM userTbl ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar1 ;

-- <exercise3> --
DROP PROCEDURE IF EXISTS ifProc; -- 기존에 만든적이 있다면 삭제
DELIMITER $$
CREATE PROCEDURE ifProc()
BEGIN
  DECLARE var1 INT;  -- var1 변수선언
  SET var1 = 100;  -- 변수에 값 대입

  IF var1 = 100 THEN  -- 만약 @var1이 100이라면,
	SELECT '100입니다.';
  ELSE
    SELECT '100이 아닙니다.';
  END IF;
END $$
DELIMITER ;
CALL ifProc();

-- <exercise 4>--

source employees.sql;


DROP PROCEDURE IF EXISTS ifProc2; 
USE employees;

DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
	DECLARE hireDATE DATE; -- 입사일
	DECLARE curDATE DATE; -- 오늘
	DECLARE days INT; -- 근무한 일수

	SELECT hire_date INTO hireDate -- hire_date 열의 결과를 hireDATE에 대입
	   FROM employees.employees
	   WHERE emp_no = 10001;

	SET curDATE = CURRENT_DATE(); -- 현재 날짜
	SET days =  DATEDIFF(curDATE, hireDATE); -- 날짜의 차이, 일 단위

	IF (days/365) >= 5 THEN -- 5년이 지났다면
		  SELECT CONCAT('입사한지 ', days, '일이나 지났습니다. 축하합니다!');
	ELSE
		  SELECT '입사한지 ' + days + '일밖에 안되었네요. 열심히 일하세요.' ;
	END IF;
END $$
DELIMITER ;
CALL ifProc2();


-- <exercise 5> --
DROP PROCEDURE IF EXISTS ifProc3; 
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
    DECLARE point INT ;
    DECLARE credit CHAR(1);
    SET point = 77 ;
    
    IF point >= 90 THEN
		SET credit = 'A';
    ELSEIF point >= 80 THEN
		SET credit = 'B';
    ELSEIF point >= 70 THEN
		SET credit = 'C';
    ELSEIF point >= 60 THEN
		SET credit = 'D';
    ELSE
		SET credit = 'F';
    END IF;
    SELECT CONCAT('취득점수==>', point), CONCAT('학점==>', credit);
END $$
DELIMITER ;
CALL ifProc3();

-- <exercise 6> --
DROP PROCEDURE IF EXISTS caseProc; 
DELIMITER $$
CREATE PROCEDURE caseProc()
BEGIN
    DECLARE point INT ;
    DECLARE credit CHAR(1);
    SET point = 77 ;
    
    CASE 
		WHEN point >= 90 THEN
			SET credit = 'A';
		WHEN point >= 80 THEN
			SET credit = 'B';
		WHEN point >= 70 THEN
			SET credit = 'C';
		WHEN point >= 60 THEN
			SET credit = 'D';
		ELSE
			SET credit = 'F';
    END CASE;
    SELECT CONCAT('취득점수==>', point), CONCAT('학점==>', credit);
END $$
DELIMITER ;
CALL caseProc();

-- <exercise 7> --
DROP PROCEDURE IF EXISTS whileProc; 
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
	DECLARE i INT; -- 1에서 100까지 증가할 변수
	DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;

	WHILE (i <= 100) DO
		SET hap = hap + i;  -- hap의 원래의 값에 i를 더해서 다시 hap에 넣으라는 의미
		SET i = i + 1;      -- i의 원래의 값에 1을 더해서 다시 i에 넣으라는 의미
	END WHILE;

	SELECT hap;   
END $$
DELIMITER ;
CALL whileProc();

-- <exercise 8> --
DROP PROCEDURE IF EXISTS whileProc2; 
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
    DECLARE i INT; -- 1에서 100까지 증가할 변수
    DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;

    myWhile: WHILE (i <= 100) DO  -- While문에 label을 지정
	IF (i%7 = 0) THEN
		SET i = i + 1;     
		ITERATE myWhile; -- 지정한 label문으로 가서 계속 진행
	END IF;
        
        SET hap = hap + i; 
        IF (hap > 1000) THEN 
		LEAVE myWhile; -- 지정한 label문을 떠남. 즉, While 종료.
	END IF;
        SET i = i + 1;
    END WHILE;

    SELECT hap;   
END $$
DELIMITER ;
CALL whileProc2();