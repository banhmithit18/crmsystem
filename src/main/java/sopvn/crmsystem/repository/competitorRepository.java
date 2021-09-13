package sopvn.crmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.competitor;

public interface competitorRepository extends JpaRepository<competitor, Integer> {
	
	competitor findById(int competitor_id);
}
