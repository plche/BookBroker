package com.codingdojo.peru.ft2022.bb.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.peru.ft2022.bb.models.Book;
import com.codingdojo.peru.ft2022.bb.models.User;
import com.codingdojo.peru.ft2022.bb.repositories.BookRepository;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Service
public class BookService {
    @Autowired
    BookRepository bookRepo;

    public List<Book> allBooks() {
        return bookRepo.findAll();
    }

    public List<Book> allNBBooks() {
        return bookRepo.findAllByBuserId(null);
    }

    public List<Book> allBBooks(Long id) {
        return bookRepo.findAllByBuserId(id);
    }

    public Book saveNewBook(Book newBook, BindingResult result, HttpSession session) {
        User user = new User();
        user.setId((Long) session.getAttribute("userId"));
        newBook.setUser(user);
        if (result.hasErrors()) return null;
        else return bookRepo.save(newBook);
    }

    public Book findBookById(Long id) {
        Optional<Book> optionalBook = bookRepo.findById(id);
        if (optionalBook.isEmpty()) {
            System.out.println("Error: Not found; Book with ID: " + id + " doesn't exist!");
            return null;
        } else return optionalBook.get();
    }

    public boolean userAuthorized(HttpSession session, Book book) {
        if ((Long) session.getAttribute("userId") == book.getUser().getId()) return true;
        else return false;
    }

    public void deleteBook(Long id) {
        bookRepo.deleteById(id);
    }

    public Book borrowBook(Long id, HttpSession session) {
        User buser = new User();
        buser.setId((Long) session.getAttribute("userId"));
        Book book = findBookById(id);
        if (book != null) {
            book.setBuser(buser);
            return bookRepo.save(book);
        } else return null;
    }

    public Book returnBBook(Long id) {
        Book book = findBookById(id);
        if (book != null) {
            book.setBuser(null);
            return bookRepo.save(book);
        } else return null;
    }
}
