package sopvn.crmsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.quote;

public interface quoteRepository extends JpaRepository<quote, Integer> {
	quote findById(int id);
	List<quote> findByQuoteStatusTrue();
	
}
