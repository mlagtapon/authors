package mari.updatedelete.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mari.updatedelete.models.Author;
import mari.updatedelete.models.Book;
import mari.updatedelete.services.AuthorService;
import mari.updatedelete.services.BookService;

@Controller
public class AuthorController {
	private final AuthorService authorService;
	private final BookService bookService;
	
	public AuthorController(AuthorService authorService, BookService bookService) {
		this.authorService = authorService;
		this.bookService = bookService;
	}
	
	@RequestMapping("/")
	public String index(@ModelAttribute("author") Author author, @ModelAttribute("book") Book book, Model model) {
		model.addAttribute("authorsall", authorService.allAuthors());
		model.addAttribute("books", bookService.allBooks());
		return "authors.jsp";
	}
	
	@PostMapping("/authors")
	public String create(@Valid @ModelAttribute("author") Author author, BindingResult result) {
        if(result.hasErrors()) {
            return "authors.jsp";
        } else {
            authorService.createAuthor(author);
            return "redirect:/";
        }
        
	}
}
