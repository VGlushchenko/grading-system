CREATE TABLE IF NOT EXISTS `testing`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `role_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


CREATE TABLE IF NOT EXISTS `testing`.`roles` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `testing`.`tests` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `TITLE` VARCHAR(255) NOT NULL,
  `CREATED_AT` DATETIME default NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `testing`.`questions` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `testing`.`answers` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` VARCHAR(255) NOT NULL,
  `IS_RIGHT_ANSWER` BIT(1) DEFAULT NULL,
  `QUESTION_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `idx_1` (`QUESTION_ID` ASC),
  CONSTRAINT `fk_1`
    FOREIGN KEY (`QUESTION_ID`)
    REFERENCES `testing`.`questions` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `testing`.`test_questions` (
  `TEST_ID` INT(11) NOT NULL,
  `QUESTION_ID` INT(11) NOT NULL,
  PRIMARY KEY (`TEST_ID`, `QUESTION_ID`),
  INDEX `idx_2` (`QUESTION_ID` ASC),
  INDEX `idx_3` (`TEST_ID` ASC),
  CONSTRAINT `FK_2`
    FOREIGN KEY (`QUESTION_ID`)
    REFERENCES `testing`.`questions` (`ID`),
  CONSTRAINT `FK_3`
    FOREIGN KEY (`TEST_ID`)
    REFERENCES `testing`.`tests` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `testing`.`user_tests` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `PASSED_AT` DATE NOT NULL,
  `SCORE` INT(11) NOT NULL,
  `USER_ID` INT(11) NOT NULL,
  `TEST_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `user_tests_idx1` (`TEST_ID` ASC),
  CONSTRAINT `user_tests_fk1`
    FOREIGN KEY (`TEST_ID`)
    REFERENCES `testing`.`tests` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `testing`.`user_test_answers` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `USER_TEST_ID` INT(11) NOT NULL,
  `ANSWER_ID` INT(11) NOT NULL,
  `QUESTION_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `user_answers_idx_1` (`USER_TEST_ID` ASC),
  INDEX `user_answers_idx_2` (`ANSWER_ID` ASC),
  INDEX `user_answers_idx_3` (`QUESTION_ID` ASC),
  CONSTRAINT `user_answers_fk2`
    FOREIGN KEY (`ANSWER_ID`)
    REFERENCES `testing`.`answers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_answers_fk1`
    FOREIGN KEY (`USER_TEST_ID`)
    REFERENCES `testing`.`user_tests` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT `user_answers_fk3`
    FOREIGN KEY (`QUESTION_ID`)
    REFERENCES `testing`.`questions` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `testing`.`tests` (`CREATED_AT`, `TITLE`) VALUES ('03.12.2014', ' JavaScript QUIZ');
INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('Inside which HTML element do we put the JavaScript?');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<script>', 1, '1');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<scripting>', 0, '1');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<javascript>', 0, '1');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<js>', 0, '1');

INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('What is the correct JavaScript syntax to change the content of the HTML element below?
 <p id="demo">This is a demonstration.</p>');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('#demo.innerHTML = "Hello World!"', 0, '2');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('document.getElementById("demo").innerHTML = "Hello World!"', 1, '2');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('document.getElementByName("p").innerHTML = "Hello World!";', 0, '2');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('document.getElement("p").innerHTML = "Hello World!"', 0, '2');




INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('Where is the correct place to insert a JavaScript?');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('The <body> section', 0, '3');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('The <head> section', 0, '3');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('Both the <head> section and the <body> section are correct', 1, '3');

INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('What is the correct syntax for referring to an external script called "xxx.js"?
');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<script name="xxx.js">', 0, '4');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<script href="xxx.js">', 0, '4');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<script src="xxx.js">', 1, '4');

INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('The external JavaScript file must contain the <script> tag.
');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('True">', 0, '5');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('False', 1, '5');

INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('1', '1');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('1', '2');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('1', '3');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('1', '4');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('1', '5');

commit;



INSERT INTO `testing`.`tests` (`CREATED_AT`, `TITLE`) VALUES ('03.12.2014', 'CSS QUIZ');
INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('What does CSS stand for?');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('Cascading Style Sheets', 1, '6');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('Computer Style Sheets', 0, '6');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('Creative Style Sheets', 0, '6');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('Colorful Style Sheets', 0, '6');

INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('What is the correct HTML for referring to an external style sheet?');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<stylesheet>mystyle.css</stylesheet>', 0, '7');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<link rel="stylesheet" type="text/css" href="mystyle.css">', 1, '7');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('<style src="mystyle.css">', 0, '7');


INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('Where in an HTML document is the correct place to refer to an external style sheet?');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('At the top of the document', 0, '8');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('In the <head> section', 1, '8');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('At the end of the document', 0, '8');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('In the <body> section', 0, '8');

INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('2', '6');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('2', '7');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('2', '8');



INSERT INTO `testing`.`tests` (`CREATED_AT`, `TITLE`) VALUES ('03.12.2014', 'jQuery QUIZ');
INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('Which of the following is correct?');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('jQuery is a JavaScript Library', 1, '9');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('jQuery is a JSON Library', 0, '9');

INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('jQuery uses CSS selectors to select elements?');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('True', 1, '10');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('False', 0, '10');

INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('Which sign does jQuery use as a shortcut for jQuery?');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('the $ sign', 1, '11');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('the ? Sign', 0, '11');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('the % sign', 0, '11');

INSERT INTO `testing`.`questions` (`DESCRIPTION`) VALUES ('With jQuery, look at the following selector: $("div"). What does it select?');

INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('All div elements', 1, '12');
INSERT INTO `testing`.`answers` (`DESCRIPTION`, `IS_RIGHT_ANSWER`, `QUESTION_ID`) VALUES ('he first div element', 0, '12');

INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('3', '9');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('3', '8');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('3', '11');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('3', '12');
INSERT INTO `testing`.`test_questions` (`TEST_ID`, `QUESTION_ID`) VALUES ('3', '10');

insert into testing.roles (role_name) values('ADMIN');
insert into testing.roles (role_name) values('USER');

insert into testing.users (name, email, password, role_id) values('User Admin', 'heavyck@gmail.com', '1111', 1);
insert into testing.users (name, email, password, role_id) values('Default User', 'user@gmail.com', '1111', 2);

commit;



