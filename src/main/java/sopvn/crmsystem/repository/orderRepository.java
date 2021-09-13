package sopvn.crmsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.order;

public interface orderRepository extends JpaRepository<order, Integer> {
	
	List<order> findByAccountId(int accountId);
}