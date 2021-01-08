package mari.updatedelete.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import mari.updatedelete.models.Author;
import mari.updatedelete.repositories.AuthorRepository;


@Service
public class AuthorService {
    private final AuthorRepository authorRepository;
    
    public AuthorService(AuthorRepository authorRepository) {
        this.authorRepository = authorRepository;
    }
    // returns all the books
    public List<Author> allAuthors() {
        return authorRepository.findAll();
    }
    
    public Author createAuthor(@Valid Author author) {
    	return authorRepository.save(author);
    }
}
