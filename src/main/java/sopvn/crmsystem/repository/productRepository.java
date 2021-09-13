package sopvn.crmsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.product;

public interface productRepository extends JpaRepository<product, Integer> {
	product findById(int product_id);
	List<product> findByProductStatusTrue();
}
