package com.codingdojo.peru.ft2022.bb.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class LoginUser {
    @NotBlank(message = "Must contain at least one non-whitespace character")
    @Email(message = "Must be a well-formed email address")
    private String email;

    @NotBlank(message = "Must contain at least one non-whitespace character")
    @Size(min = 8, max = 128, message = "Must be between 8 and 128 characters")
    private String password;

    public LoginUser() {
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
}
