package sopvn.crmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.opportunitycompetitor;

public interface opportunitycompetitorRepository extends JpaRepository<opportunitycompetitor, Integer> {
	opportunitycompetitor findById(int opportunitycompetitor_id);
}
