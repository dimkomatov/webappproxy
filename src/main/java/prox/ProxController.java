package prox;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import prox.dto.*;
import prox.repository.AccessRepository;
import prox.repository.StoreRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ProxController {

    @Autowired
    private AccessRepository accessRepository;

    @Autowired
    private StoreRepository storeRepository;

    Date date1 = null;
    Date date2 = null;
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(value = "/page")
    public Model getForm(Model model) throws ParseException {

        Integer countAll = accessRepository.countAll();
        model.addAttribute("countAll", countAll);

        Integer countDistinct = accessRepository.countDistinct();
        model.addAttribute("countDistinct", countDistinct);

        Integer avgBytes = accessRepository.avgBytes();
        model.addAttribute("avgBytes", avgBytes);

        List<RemotehostUrlAccess> remotehostUrl = accessRepository.findRemotehostUrl(10);
        model.addAttribute("remotehostUrl", remotehostUrl);

        return model;
    }

    @RequestMapping(value = "/page1")
    public Model getForm1(Model model,
                          @RequestParam(value = "dateCountryCity1", required = false) String dateCountryCity1,
                          @RequestParam(value = "dateCountryCity2", required = false) String dateCountryCity2) throws ParseException {

        if (dateCountryCity1 != null || dateCountryCity2 != null)
            try {
                date1 = formatter.parse(dateCountryCity1);
                date2 = formatter.parse(dateCountryCity2);

            } catch (ParseException e) {
                System.out.println("Error");
            }
            List<CityCount> cityCount = accessRepository.findCityCount(date1, date2);
            model.addAttribute("cityCount", cityCount);

            List<CountryCount> countryCount = accessRepository.findCountryCount(date1, date2);
            model.addAttribute("countryCount", countryCount);

        return model;
    }

    @RequestMapping(value = "/page2")
    public Model getForm2(Model model,
                          @RequestParam(value = "dateCountryCityUrl1", required = false) String dateCountryCityUrl1,
                          @RequestParam(value = "dateCountryCityUrl2", required = false) String dateCountryCityUrl2,
                          @RequestParam(value = "countryCoUrl", required = false) String countryCoUrl,
                          @RequestParam(value = "cityCoUrl", required = false) String cityCoUrl
    ) throws ParseException {

        List<String> findAllCountry = accessRepository.findAllCountry();
        model.addAttribute("findAllCountry", findAllCountry);

        List<String> findAllCity = accessRepository.findAllCity();
        model.addAttribute("findAllCity", findAllCity);

        model.addAttribute("selectedFacUrl", countryCoUrl);
        model.addAttribute("selectedFaciUrl", cityCoUrl);

        if (dateCountryCityUrl1 != null || dateCountryCityUrl2 != null)
            try {
                date1 = formatter.parse(dateCountryCityUrl1);
                date2 = formatter.parse(dateCountryCityUrl2);

            } catch (ParseException e) {
                System.out.println("Error");
            }
        List<UrlCount> countryUrl = accessRepository.findUrlCountry(countryCoUrl, date1, date2);
        model.addAttribute("countryUrl", countryUrl);

        List<UrlCount> cityUrl = accessRepository.findUrlCity(cityCoUrl, date1, date2);
        model.addAttribute("cityUrl", cityUrl);

        return model;
    }

    @RequestMapping(value = "/page3")
    public Model getForm3(Model model,
                          @RequestParam(value = "dateCountryCityHP1", required = false) String dateCountryCityHP1,
                          @RequestParam(value = "dateCountryCityHP2", required = false) String dateCountryCityHP2,
                          @RequestParam(value = "countryCoHP", required = false) String countryCoHP,
                          @RequestParam(value = "cityCoHP", required = false) String cityCoHP) throws ParseException {

        List<String> findAllCountry = accessRepository.findAllCountry();
        model.addAttribute("findAllCountry", findAllCountry);

        List<String> findAllCity = accessRepository.findAllCity();
        model.addAttribute("findAllCity", findAllCity);

        model.addAttribute("selectedFacHP", countryCoHP);
        model.addAttribute("selectedFaciHP", cityCoHP);

        if (dateCountryCityHP1 != null || dateCountryCityHP2 != null)
            try {
                date1 = formatter.parse(dateCountryCityHP1);
                date2 = formatter.parse(dateCountryCityHP2);

            } catch (ParseException e) {
                System.out.println("Error");
            }
            List<UrlCount> countryHP = accessRepository.findHPCountry(countryCoHP, date1, date2);
            model.addAttribute("countryHP", countryHP);

            List<UrlCount> cityHP = accessRepository.findHPCity(cityCoHP, date1, date2);
            model.addAttribute("cityHP", cityHP);

        return model;
    }

    @RequestMapping(value = "/page4")
    public Model getForm4(Model model,
                          @RequestParam(value = "dateCountryCityAvgEl1", required = false) String dateCountryCityAvgEl1,
                          @RequestParam(value = "dateCountryCityAvgEl2", required = false) String dateCountryCityAvgEl2,
                          @RequestParam(value = "coAvgEl", required = false) String coAvgEl) throws ParseException {

        List<String> findAllUrl = accessRepository.findAllUrl();
        model.addAttribute("findAllUrl", findAllUrl);

        model.addAttribute("selectedUrlAvgEl", coAvgEl);

        if (dateCountryCityAvgEl1 != null || dateCountryCityAvgEl2 != null)
            try {
                date1 = formatter.parse(dateCountryCityAvgEl1);
                date2 = formatter.parse(dateCountryCityAvgEl2);

            } catch (ParseException e) {
                System.out.println("Error");
            }
            List<UrlCount> countryAvgEl = accessRepository.findAvgElapseCountry(coAvgEl, date1, date2);
            model.addAttribute("countryAvgEl", countryAvgEl);

            List<UrlCount> cityAvgEl = accessRepository.findAvgElapseCity(coAvgEl, date1, date2);
            model.addAttribute("cityAvgEl", cityAvgEl);

        return model;
    }


    @RequestMapping(value = "/page5")
    public Model getForm5(Model model,
                          @RequestParam(value = "dateClientStatistic1", required = false) String dateClientStatistic1,
                          @RequestParam(value = "dateClientStatistic2", required = false) String dateClientStatistic2,
                          @RequestParam(value = "rhClientStatistic", required = false) String rhClientStatistic) throws ParseException {

        /*Client*/
        model.addAttribute("rhClient", rhClientStatistic);

        if (dateClientStatistic1 != null || dateClientStatistic2 != null)
            try {
                date1 = formatter.parse(dateClientStatistic1);
                date2 = formatter.parse(dateClientStatistic2);

            } catch (ParseException e) {
                System.out.println("Error");
            }

            String findClientCity = accessRepository.findClientCity(rhClientStatistic);
            model.addAttribute("findClientCity", findClientCity);

            String findClientCountry = accessRepository.findClientCountry(rhClientStatistic);
            model.addAttribute("findClientCountry", findClientCountry);

            Integer findClientSumElapse = accessRepository.findClientSumElapse(rhClientStatistic, date1, date2);
            model.addAttribute("findClientSumElapse", findClientSumElapse);

            Integer findClientSumBytes = accessRepository.findClientSumBytes(rhClientStatistic, date1, date2);
            model.addAttribute("findClientSumBytes", findClientSumBytes);

            String findClientMostType = accessRepository.findClientMostType(rhClientStatistic, date1, date2);
            model.addAttribute("findClientMostType", findClientMostType);

            String findClientMostHP = accessRepository.findClientMostHP(rhClientStatistic, date1, date2);
            model.addAttribute("findClientMostHP", findClientMostHP);

            List<Url2Count> findClientUrlSumEl = accessRepository.findClientUrlSumEl(rhClientStatistic, date1, date2);
            model.addAttribute("findClientUrlSumEl", findClientUrlSumEl);

        return model;
    }

    @RequestMapping(value = "/page6")
    public Model getForm6(Model model,
                          @RequestParam(value = "dateUrlStatistic1", required = false) String dateUrlStatistic1,
                          @RequestParam(value = "dateUrlStatistic2", required = false) String dateUrlStatistic2,
                          @RequestParam(value = "urlStatistic", required = false) String urlStatistic) throws ParseException {

        List<String> findAllUrl = accessRepository.findAllUrl();
        model.addAttribute("findAllUrl", findAllUrl);

        /*URL*/
        model.addAttribute("selectedUrl", urlStatistic);
        model.addAttribute("urlStatistic", urlStatistic);

        if (dateUrlStatistic1 != null || dateUrlStatistic2 != null)
            try {
                date1 = formatter.parse(dateUrlStatistic1);
                date2 = formatter.parse(dateUrlStatistic2);

            } catch (ParseException e) {
                System.out.println("Error");
            }

            Integer findCountOfUrl = accessRepository.findCountOfUrl(urlStatistic);
            model.addAttribute("findCountOfUrl", findCountOfUrl);

            String findMostUrlCountry = accessRepository.findMostUrlCountry(urlStatistic, date1, date2);
            model.addAttribute("findMostUrlCountry", findMostUrlCountry);

            String findMostUrlCity = accessRepository.findMostUrlCity(urlStatistic, date1, date2);
            model.addAttribute("findMostUrlCity", findMostUrlCity);

            String findMostUrlHp = accessRepository.findMostUrlHp(urlStatistic, date1, date2);
            model.addAttribute("findMostUrlHp", findMostUrlHp);

            List<Url2Count> findMostUrlIp = accessRepository.findMostUrlIp(urlStatistic, date1, date2);
            model.addAttribute("findMostUrlIp", findMostUrlIp);

        return model;
    }


    @RequestMapping(value = "/page7")
    public Model getForm7(Model model,
                          @RequestParam(value = "dateAvgRhBytes1", required = false) String dateAvgRhBytes1,
                          @RequestParam(value = "dateAvgRhBytes2", required = false) String dateAvgRhBytes2) throws ParseException {

        if (dateAvgRhBytes1 != null || dateAvgRhBytes2 != null)
            try {
                date1 = formatter.parse(dateAvgRhBytes1);
                date2 = formatter.parse(dateAvgRhBytes2);

            } catch (ParseException e) {
                System.out.println("Error");
            }
            List<RhBytes> findAvgRhBytes = accessRepository.findAvgRhBytes(date1, date2);
            model.addAttribute("findAvgRhBytes", findAvgRhBytes);

        return model;
    }

}