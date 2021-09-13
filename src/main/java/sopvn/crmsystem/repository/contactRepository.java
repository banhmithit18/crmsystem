package sopvn.crmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.contact;

public interface contactRepository extends JpaRepository<contact, Integer> {
	contact findById(int contact_id);
	Boolean existsByContactPhone(String contactPhone);
	Boolean existsByContactEmail(String contactEmail);
}
