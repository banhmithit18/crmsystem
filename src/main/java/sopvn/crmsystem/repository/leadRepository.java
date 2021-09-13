package sopvn.crmsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import sopvn.crmsystem.model.lead;

public interface leadRepository extends JpaRepository<lead, Integer> {
	lead findByLeadPhone(String leadPhone);
	Boolean existsByLeadPhone(String leadPhone);
	Boolean existsByLeadEmail(String leadEmail);
	lead findById(int lead_id);
	void deleteById(int lead_id);

	@Query(value = "select * from lead where lead_id not in (select lead_id from account)", nativeQuery = true)
	List<lead> findAllLead();
}
