package sopvn.crmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.opportunity;

public interface opportunityRepository extends JpaRepository<opportunity, Integer> {
	opportunity findById(int opportunity_id);
}
