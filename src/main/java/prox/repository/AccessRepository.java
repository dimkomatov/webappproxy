package prox.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import prox.model.Access;

import java.util.List;

@Repository
public interface AccessRepository extends JpaRepository<Access, Long> {

  @Query("SELECT a FROM Access a")
  List<Access> findAllIs();

  @Query("SELECT count(*) FROM Access a")
  Integer countAll();

}
