package sopvn.crmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.invoice;

public interface invoiceRepository extends JpaRepository<invoice, Integer> {
	
	boolean existsById(int invoice_id);
	invoice findById(int invoice_id);
}
