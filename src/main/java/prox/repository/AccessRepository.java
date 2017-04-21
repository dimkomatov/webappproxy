package prox.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import prox.dto.RemotehostUrlAccess;
import prox.model.Access;

import java.util.List;

@Repository
public interface AccessRepository extends JpaRepository<Access, Long> {

  @Query("SELECT a FROM Access a")
  List<Access> findAllIs();

  @Query("SELECT count(*) FROM Access a")
  Integer countAll();

  @Query(value="SELECT new prox.dto.RemotehostUrlAccess(remotehost,url) FROM Access order by time desc")
  List<RemotehostUrlAccess> findRemotehostUrl(/*@Param(value = "countRhUrl")Integer countRhUrl*/);

  @Query(nativeQuery = true, value="SELECT remotehost,url FROM Access order by time desc limit :countRhUrl")
  List<RemotehostUrlAccess> findRemotehostUrl(@Param(value = "countRhUrl")Integer countRhUrl);
}
