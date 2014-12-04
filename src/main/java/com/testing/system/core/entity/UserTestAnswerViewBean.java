package com.testing.system.core.entity;

public class UserTestAnswerViewBean {

    private Integer id;

    private Integer userTestId;

    private Question question;

    private Answer answer;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserTestId() {
        return userTestId;
    }

    public void setUserTestId(Integer userTestId) {
        this.userTestId = userTestId;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }
}
