package com.testing.system.core.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "USER_TESTS")
public class UserTest {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "USER_ID")
    private Integer userId;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "TEST_ID")
    private Test test;

    @Column(name = "SCORE")
    private Integer score;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL,targetEntity = UserTestAnswer.class)
    @JoinColumn(name = "USER_TEST_ID")
    private Set<UserTestAnswer> answers = new HashSet<>();

    @Temporal(TemporalType.DATE)
    @Column(name = "PASSED_AT")
    private Date passedAt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getPassedAt() {
        return passedAt;
    }

    public void setPassedAt(Date passedAt) {
        this.passedAt = passedAt;
    }

    public Set<UserTestAnswer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<UserTestAnswer> answers) {
        this.answers = answers;
    }
}
