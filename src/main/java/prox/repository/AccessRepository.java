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
  @Query(nativeQuery = true, value="SELECT count(*) FROM access")
  Integer countAll();

  /**Все страны*/
  @Query(nativeQuery = true, value="SELECT distinct country FROM access")
  List<String> findAllCountry();

  /**Все города*/
  @Query(nativeQuery = true, value="SELECT distinct city FROM access")
  List<String> findAllCity();

  /**Все Распарс URL*/
  @Query(nativeQuery = true, value="SELECT distinct url_0 FROM access")
  List<String> findAllUrl();

  /**Все Клиенты*/
  @Query(nativeQuery = true, value="SELECT distinct remotehost FROM access")
  List<String> findAllClients();

  /**Общее количество уникальных подключений*/
  @Query(nativeQuery = true, value="SELECT count(distinct remotehost) FROM access")
  Integer countDistinct();

  /**Среднее количество передаваемых байт*/
  @Query(nativeQuery = true, value="SELECT avg(bytes) FROM access")
  Integer avgBytes();

  /**Последние запросы с IP на URL*/
  @Query(nativeQuery = true, value="SELECT remotehost,url FROM access order by time desc limit :countRhUrl")
  List<RemotehostUrlAccess> findRemotehostUrl(@Param(value = "countRhUrl")Integer countRhUrl);

  /**Среднее количество передаваемых байт отдельным IP*/
  @Query(nativeQuery = true, value="SELECT remotehost,avg(bytes) FROM access where time between " +
          "coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by remotehost " +
          "order by avg(bytes) desc limit :countRhBytes")
  List<RhBytes> findAvgRhBytes(@Param(value = "countRhBytes")Integer countRhBytes, @Param(value = "date1")Date date1,
                               @Param(value = "date2")Date date2);

  /**Количество запросов по странам*/
  @Query(nativeQuery = true, value="SELECT country,count(country) FROM access  where time between coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by country order by count(country) desc limit 4")
  List<CountryCount> findCountryCount(@Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Количество запросов по городам*/
  @Query(nativeQuery = true, value="SELECT city,count(city) FROM access  where time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by city order by count(city) desc limit 4")
  List<CityCount> findCityCount(@Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Самые популярные URL по странам*/
  @Query(nativeQuery = true, value="SELECT url_0,count(url_0) FROM access where country=coalesce(:countryUrl,'Russia') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by url_0 " +
          "order by count(url_0) desc limit 4")
  List<UrlCount> findUrlCountry(@Param(value = "countryUrl")String countryUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Самые популярные URL по городам*/
  @Query(nativeQuery = true, value="SELECT url_0,count(url_0) FROM access where city=coalesce(:cityUrl,'Saint Petersburg') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by url_0 " +
          "order by count(url_0) desc limit 4")
  List<UrlCount> findUrlCity(@Param(value = "cityUrl")String cityUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Самые популярные поисковики по странам*/
  @Query(nativeQuery = true, value="SELECT hierarchy_peerhost_1,count(hierarchy_peerhost_1) FROM access where country=coalesce(:countryUrl,'Russia') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by hierarchy_peerhost_1 " +
          "order by count(hierarchy_peerhost_1) desc limit 4")
  List<UrlCount> findHPCountry(@Param(value = "countryUrl")String countryUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Самые популярные поисковики по городам*/
  @Query(nativeQuery = true, value="SELECT hierarchy_peerhost_1,count(hierarchy_peerhost_1) FROM access where city=coalesce(:cityUrl,'Saint Petersburg') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by hierarchy_peerhost_1 " +
          "order by count(hierarchy_peerhost_1) desc limit 4")
  List<UrlCount> findHPCity(@Param(value = "cityUrl")String cityUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Среднее время посещения URL по странам*/
  @Query(nativeQuery = true, value="SELECT country,avg(elapse) FROM access where url_0=coalesce(:countryUrl,'m.search.yahoo.com') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by country " +
          "order by avg(elapse) desc limit 3")
  List<UrlCount> findAvgElapseCountry(@Param(value = "countryUrl")String cityUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Среднее время посещения URL по городам*/
  @Query(nativeQuery = true, value="SELECT city,avg(elapse) FROM access where url_0=coalesce(:cityUrl,'m.search.yahoo.com') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by city " +
          "order by avg(elapse) desc limit 3")
  List<UrlCount> findAvgElapseCity(@Param(value = "cityUrl")String cityUrl, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);


  /**Статистика по отдельному клиенту*/

  /**Город клиента*/
  @Query(nativeQuery = true, value="SELECT city FROM access where remotehost=coalesce(:rh,'163.172.72.31')")
  String findClientCity(@Param(value = "rh")String rh);

  /**Страна клиента*/
  @Query(nativeQuery = true, value="SELECT country FROM access where remotehost=coalesce(:rh,'163.172.72.31')")
  String findClientCountry(@Param(value = "rh")String rh);

  /**Общее время пользования прокси клиентом*/
  @Query(nativeQuery = true, value="SELECT sum(elapse) FROM access where remotehost=coalesce(:rh,'163.172.72.31') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')")
  Integer findClientSumElapse(@Param(value = "rh")String rh, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Суммарное переданное количесво байт  клиентом*/
  @Query(nativeQuery = true, value="SELECT sum(bytes) FROM access where remotehost=coalesce(:rh,'163.172.72.31') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')")
  Integer findClientSumBytes(@Param(value = "rh")String rh, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Наиболее часто передаваемый тип данных клиентом*/
  @Query(nativeQuery = true, value="SELECT type FROM access where remotehost=coalesce(:rh,'163.172.72.31') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')" +
          " group by type order by count(type) desc limit 1")
  String findClientMostType(@Param(value = "rh")String rh, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Наиболее часто используемая поисковая система клиентом*/
  @Query(nativeQuery = true, value="SELECT hierarchy_peerhost_1 FROM access where remotehost=coalesce(:rh,'163.172.72.31') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')" +
          " group by hierarchy_peerhost_1 order by count(hierarchy_peerhost_1) desc limit 1")
  String findClientMostHP(@Param(value = "rh")String rh, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Наиболее часто посещаемые клиентом ресурсы с фильтрацией по методу*/
  @Query(nativeQuery = true, value="SELECT url_0,sum(elapse),count(url_0) FROM access" +
          " where remotehost=coalesce(:rh,'163.172.72.31')" +
          " and method=coalesce(:method,'GET') and time between" +
          " coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')" +
          " group by url_0 order by url_0,sum(elapse) desc limit 5")
  List<Url2Count> findClientUrlSumEl(@Param(value = "rh")String rh,@Param(value = "method")String method, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Статистика по отдельному URL*/

  /**Больше всего используют с этой страны*/
  @Query(nativeQuery = true, value="select country from access where url_0=coalesce(:url,'m.search.yahoo.com') " +
          "and time between coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by country order by count(country) desc limit 1")
  String findMostUrlCountry(@Param(value = "url")String url, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Больше всего используют с этого города*/
  @Query(nativeQuery = true, value="select city from access where url_0=coalesce(:url,'m.search.yahoo.com') " +
          "and time between coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by city order by count(city) desc limit 1")
  String findMostUrlCity(@Param(value = "url")String url, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Больше всего используют с этого поисковика*/
  @Query(nativeQuery = true, value="select hierarchy_peerhost_1 from access where url_0=coalesce(:url,'m.search.yahoo.com') " +
          "and time between coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01') group by hierarchy_peerhost_1 order by count(hierarchy_peerhost_1) desc limit 1")
  String findMostUrlHp(@Param(value = "url")String url, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Больше всего используют эти Ip*/
  @Query(nativeQuery = true, value="select remotehost,sum(elapse) from access where url_0=coalesce(:url,'m.search.yahoo.com')" +
          " and time between coalesce(:date1,'2016-01-01 00:00:01') and coalesce(:date2,'2025-12-12 00:00:01')" +
          " group by remotehost order by sum(elapse) desc limit 10")
  List<Url2Count> findMostUrlIp(@Param(value = "url")String url, @Param(value = "date1")Date date1, @Param(value = "date2")Date date2);

  /**Суммарное количество обращений к этому URL*/
  @Query(nativeQuery = true, value="select count(1) from access where url_0=coalesce(:url,'m.search.yahoo.com')")
  Integer findCountOfUrl(@Param(value = "url")String url);
}
