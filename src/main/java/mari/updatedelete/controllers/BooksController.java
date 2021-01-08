package mari.updatedelete.controllers;


import javax.validation.Valid;

import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import mari.updatedelete.models.Book;
import mari.updatedelete.services.AuthorService;
import mari.updatedelete.services.BookService;

@Controller
public class BooksController {
	
	private final AuthorService authorService;
	private final BookService bookService;
	
	public BooksController(AuthorService authorService, BookService bookService) {
		this.authorService = authorService;
		this.bookService = bookService;
	}
	
	@PostMapping("/books")
	
	public String create(@Valid @ModelAttribute("book") Book book, BindingResult result) {
        if(result.hasErrors()) {
            return "authors.jsp";
        } else {
           bookService.createBook(book);
            return "redirect:/";
        }
		
	}

}