package sopvn.crmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.cases;

public interface caseRepository extends JpaRepository<cases, Integer> {
	cases findById(int case_id);
}
