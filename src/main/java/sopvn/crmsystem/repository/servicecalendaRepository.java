package sopvn.crmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sopvn.crmsystem.model.servicecalendar;

public interface servicecalendaRepository extends JpaRepository<servicecalendar, Integer> {
	servicecalendar findById(int servicecalendar_id);
}
