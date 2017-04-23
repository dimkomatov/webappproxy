package prox.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import prox.dto.RemotehostUrlAccess;
import prox.dto.RhBytes;
import prox.model.Access;

import java.util.Date;
import java.util.List;

@Repository
public interface AccessRepository extends JpaRepository<Access, Long> {

  @Query("SELECT a FROM Access a")
  List<Access> findAllIs();

  @Query("SELECT count(*) FROM Access a")
  Integer countAll();

  @Query(nativeQuery = true, value="SELECT remotehost,url FROM Access order by time desc limit :countRhUrl")
  List<RemotehostUrlAccess> findRemotehostUrl(@Param(value = "countRhUrl")Integer countRhUrl);

  @Query(nativeQuery = true, value="SELECT avg(bytes) FROM Access")
  Integer avgBytes();

  @Query(nativeQuery = true, value="SELECT remotehost,avg(bytes) FROM Access where time between :date1 and :date2 group by remotehost " +
          "order by avg(bytes) desc limit :countRhBytes")
  List<RhBytes> findAvgRhBytes(@Param(value = "countRhBytes")Integer countRhBytes, @Param(value = "date1")Date date1,
                               @Param(value = "date1")Date date2);
}
