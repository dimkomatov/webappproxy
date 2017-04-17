//package prox.repository;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//import org.springframework.stereotype.Repository;
//import prox.model.Account;
//
//@Repository
//public interface AccountRepository extends JpaRepository<Account, Long> {
//
//    @Query("SELECT a FROM Account a WHERE a.username= :username")
//    Account findByUsernameAndEnabled(@Param(value = "username") String username);
//
//
//
//
//}
