package sopvn.crmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.opportunitylead;

public interface opportunityleadRepository extends JpaRepository<opportunitylead, Integer> {
	opportunitylead findById(int opportunitylead_id);
}
