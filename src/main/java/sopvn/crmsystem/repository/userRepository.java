package sopvn.crmsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import sopvn.crmsystem.model.user;

public interface userRepository extends JpaRepository<user, Integer> {
	@Query(value = "SELECT * FROM EMPLOYEE",nativeQuery = true)
	List<user> findAll();	
	user findById(int user_id);
}
