package com.codingdojo.peru.ft2022.bb.models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @NotBlank(message = "Must contain at least one non-whitespace character")
    @Size(min = 3, max = 30, message = "Must be between 3 and 30 characters")
    @Column(nullable = false)
    private String userName;

    @NotBlank(message = "Must contain at least one non-whitespace character")
    @Email(message = "Must be a well-formed email address")
    private String email;

    @NotBlank(message = "Must contain at least one non-whitespace character")
    @Size(min = 8, max = 128, message = "Must be between 8 and 128 characters")
    private String password;

    @Transient
    @NotBlank(message = "Must contain at least one non-whitespace character")
    @Size(min = 8, max = 128, message = "Must be between 8 and 128 characters")
    private String confirm;

    @OneToMany(mappedBy = "user", cascade = {CascadeType.ALL}, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<Book> books;

    @OneToMany(mappedBy = "buser", cascade = {CascadeType.ALL}, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<Book> bbooks = new ArrayList<>();

    public User() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }
}
