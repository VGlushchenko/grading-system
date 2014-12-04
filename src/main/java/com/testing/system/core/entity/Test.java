package com.testing.system.core.entity;

import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "TESTS")
public class Test {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "TITLE")
    private String title;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "test_questions", joinColumns = {
            @JoinColumn(name = "TEST_ID", nullable = false) },
            inverseJoinColumns = { @JoinColumn(name = "QUESTION_ID",
                    nullable = false) })
    @OrderBy("id")
    private Set<Question> questions = new HashSet<>();

    @Formula("(SELECT COUNT(*) FROM TEST_QUESTIONS tq WHERE tq.TEST_ID = ID)")
    private int questionsCount;

    @Column(name = "CREATED_AT")
    private Date createdAt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Set<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }

    public int getQuestionsCount() {
        return questionsCount;
    }

    public void setQuestionsCount(int questionsCount) {
        this.questionsCount = questionsCount;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
