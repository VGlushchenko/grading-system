package com.testing.system.core.entity;

import org.hibernate.annotations.Formula;

import javax.persistence.*;

@Entity
@Table(name = "USER_TEST_ANSWERS")
public class UserTestAnswer {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "QUESTION_ID")
    private Integer questionId;

    @Formula("(select q.description from questions q where q.id = question_Id)")
    private String questionDescription;

    @Column(name = "USER_TEST_ID")
    private Integer userTestId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ANSWER_ID", updatable = false, nullable = false)
    private Answer answer;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    public Integer getUserTestId() {
        return userTestId;
    }

    public void setUserTestId(Integer userTestId) {
        this.userTestId = userTestId;
    }

    public String getQuestionDescription() {
        return questionDescription;
    }

    public void setQuestionDescription(String questionDescription) {
        this.questionDescription = questionDescription;
    }
}
