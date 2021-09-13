package sopvn.crmsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import sopvn.crmsystem.model.account;
import sopvn.crmsystem.model.lead;

public interface accountRepository extends JpaRepository<account, Integer> {
	
	account findById(int account_id);
	account findByLeadId(int leadId);
	void deleteById(int account_id);
	
	@Query(value="select * from lead  join account on account.lead_id = lead.lead_id", nativeQuery = true)
	List<account> findAllAccount();
}
