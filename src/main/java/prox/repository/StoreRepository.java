package prox.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import prox.model.Store;

import java.util.List;

@Repository
public interface StoreRepository extends JpaRepository<Store,Integer>{

   @Query("SELECT s FROM Store s")
   List<Store> findAllIs();

}
