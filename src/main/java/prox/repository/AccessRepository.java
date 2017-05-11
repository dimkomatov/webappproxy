package prox.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import prox.dto.*;
import prox.model.Access;

import java.util.Date;
import java.util.List;

@Repository
public interface AccessRepository extends JpaRepository<Access, Long> {

  /**Общее количество подключений*/
  @Query("SELECT count(*) FROM Access a")
  Integer countAll();

  /**Все страны*/
  @Query("SELECT distinct country FROM Access a")
  List<String> findAllCountry();

  /**Все города*/
  @Query("SELECT distinct city FROM Access a")
  List<String> findAllCity();

  /**Все Распарс URL*/
  @Query("SELECT distinct url_0 FROM Access a")
  List<String> findAllUrl();

  /**Все Клиенты*/
  @Query("SELECT distinct remotehost FROM Access a")
  List<String> findAllClients();

  /**Общее количество уникальных подключений*/
  @Query("SELECT count(distinct remotehost) FROM Access a")
  Integer countDistinct();

  /**Среднее количество передаваемых байт*/
  @Query(nativeQuery = true, value="SELECT avg(bytes) FROM Access")
  Integer avgBytes();

  /**Последние запросы с IP на URL*/
  @Query(nativeQuery = true, value="SELECT remotehost,url FROM Access order by time desc limit :countRhUrl")
  List<RemotehostUrlAccess> findRemotehostUrl(@Param(value = "countRhUrl")Integer countRhUrl);

  /**Среднее количество передаваемых байт отдельным IP*/
  @Query(nativeQuery = true, value="SELECT remotehost,avg(bytes) FROM Access where time between " +
          "coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by remotehost " +
          "order by avg(bytes) desc limit :countRhBytes")
  List<RhBytes> findAvgRhBytes(@Param(value = "countRhBytes")Integer countRhBytes, @Param(value = "date1")Date date1,
                               @Param(value = "date2")Date date2);

  /**Количество запросов по странам*/
  @Query(nativeQuery = true, value="SELECT country,count(country) FROM Access  where time between coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by country order by count(country) desc limit 4")
  List<CountryCount> findCountryCount(@Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Количество запросов по городам*/
  @Query(nativeQuery = true, value="SELECT city,count(city) FROM Access  where time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by city order by count(city) desc limit 4")
  List<CityCount> findCityCount(@Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Самые популярные URL по странам*/
  @Query(nativeQuery = true, value="SELECT url_0,count(url_0) FROM Access where country=coalesce(:countryUrl,'Russia') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by url_0 " +
          "order by count(url_0) desc limit 4")
  List<UrlCount> findUrlCountry(@Param(value = "countryUrl")String countryUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Самые популярные URL по городам*/
  @Query(nativeQuery = true, value="SELECT url_0,count(url_0) FROM Access where city=coalesce(:cityUrl,'Klimovsk') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by url_0 " +
          "order by count(url_0) desc limit 4")
  List<UrlCount> findUrlCity(@Param(value = "cityUrl")String cityUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Самые популярные поисковики по странам*/
  @Query(nativeQuery = true, value="SELECT hierarchy_peerhost_1,count(hierarchy_peerhost_1) FROM Access where country=coalesce(:countryUrl,'Russia') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by hierarchy_peerhost_1 " +
          "order by count(hierarchy_peerhost_1) desc limit 4")
  List<UrlCount> findHPCountry(@Param(value = "countryUrl")String countryUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Самые популярные поисковики по городам*/
  @Query(nativeQuery = true, value="SELECT hierarchy_peerhost_1,count(hierarchy_peerhost_1) FROM Access where city=coalesce(:cityUrl,'Klimovsk') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by hierarchy_peerhost_1 " +
          "order by count(hierarchy_peerhost_1) desc limit 4")
  List<UrlCount> findHPCity(@Param(value = "cityUrl")String cityUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Среднее время посещения URL по странам*/
  @Query(nativeQuery = true, value="SELECT country,avg(elapse) FROM Access where url_0=coalesce(:countryUrl,'m.search.yahoo.com') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by country " +
          "order by avg(elapse) desc limit 3")
  List<UrlCount> findAvgElapseCountry(@Param(value = "countryUrl")String cityUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Среднее время посещения URL по городам*/
  @Query(nativeQuery = true, value="SELECT city,avg(elapse) FROM Access where url_0=coalesce(:cityUrl,'m.search.yahoo.com') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by city " +
          "order by avg(elapse) desc limit 3")
  List<UrlCount> findAvgElapseCity(@Param(value = "cityUrl")String cityUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);


  /**Статистика по отдельному клиенту*/
  /**Город клиента*/
  @Query(nativeQuery = true, value="SELECT city FROM Access where remotehost=:rh")
  String findClientCity(@Param(value = "rh")String rh);

  /**Страна клиента*/
  @Query(nativeQuery = true, value="SELECT country FROM Access where remotehost=:rh")
  String findClientCountry(@Param(value = "rh")String rh);

  /**Общее время пользования прокси клиентом*/
  @Query(nativeQuery = true, value="SELECT sum(elapse) FROM Access where remotehost=:rh and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')")
  Integer findClientSumElapse(@Param(value = "rh")String rh, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Суммарное переданное количесво байт  клиентом*/
  @Query(nativeQuery = true, value="SELECT sum(bytes) FROM Access where remotehost=:rh and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')")
  Integer findClientSumBytes(@Param(value = "rh")String rh, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Наиболее часто передаваемый тип данных клиентом*/
  @Query(nativeQuery = true, value="SELECT type FROM Access where remotehost=coalesce(:rh,'46.105.98.53') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')" +
          " group by type order by count(type) desc limit 1")
  String findClientMostType(@Param(value = "rh")String rh, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Наиболее часто используемая поисковая система клиентом*/
  @Query(nativeQuery = true, value="SELECT hierarchy_peerhost_1 FROM Access where remotehost=coalesce(:rh,'46.105.98.53') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')" +
          " group by hierarchy_peerhost_1 order by count(hierarchy_peerhost_1) desc limit 1")
  String findClientMostHP(@Param(value = "rh")String rh, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Наиболее часто посещаемые клиентом ресурсы с фильтрацией по методу*/
  @Query(nativeQuery = true, value="SELECT url_0,sum(elapse),count(url_0) FROM Access" +
          " where remotehost=coalesce(:rh,'89.23.206.221')" +
          " and method=coalesce(:method,'GET') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')" +
          " group by url_0 order by url_0,sum(elapse) desc limit 5")
  List<Url2Count> findClientUrlSumEl(@Param(value = "rh")String rh,@Param(value = "method")String method, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);
}
