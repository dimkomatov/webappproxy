package prox.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import prox.model.Store;

import java.util.Date;
import java.util.List;

@Repository
public interface StoreRepository extends JpaRepository<Store,Integer>{

    @Query("SELECT p FROM Person p WHERE p IN (select pv.person from PersonVote pv where pv.vote.dateTime =:voteDate)")
    List<Store> findByVoteDate(@Param(value = "voteDate") Date date);


    @Query("SELECT p FROM Person p WHERE p IN (select pv.person from PersonVote pv where pv.vote.dateTime =:voteDate and pv.vote.address = :address)")
    List<Store> findByVoteDateAndAddress(@Param(value = "voteDate") Date date,@Param(value = "address") String address );

}
