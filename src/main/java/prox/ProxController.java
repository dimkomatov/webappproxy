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
    public Model getForm(Model model, @RequestParam(value="action", required=false) String action,
                                      @RequestParam(value="countRhUrl", required=false) Integer countRhUrl,
                                      @RequestParam(value="dateCountryCity1", required=false) String dateCountryCity1,
                                      @RequestParam(value="dateCountryCity2", required=false) String dateCountryCity2,
                                      @RequestParam(value="dateCountryCityUrl1", required=false) String dateCountryCityUrl1,
                                      @RequestParam(value="dateCountryCityUrl2", required=false) String dateCountryCityUrl2,
                                      @RequestParam(value="countryCoUrl", required=false) String countryCoUrl,
                                      @RequestParam(value="cityCoUrl", required=false) String cityCoUrl,
                                      @RequestParam(value="dateAvgRhBytes1", required=false) String dateAvgRhBytes1,
                                      @RequestParam(value="dateAvgRhBytes2", required=false) String dateAvgRhBytes2) throws ParseException {
        if (action == null)
            return model;

        Integer countAll = accessRepository.countAll();
        model.addAttribute("countAll", countAll);

        Integer countDistinct = accessRepository.countDistinct();
        model.addAttribute("countDistinct", countDistinct);

        Integer avgBytes = accessRepository.avgBytes();
        model.addAttribute("avgBytes", avgBytes);


        if (action.equals("cityAndCountry")) {
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
        }

        List<String> findAllCountry = accessRepository.findAllCountry();
        model.addAttribute("findAllCountry", findAllCountry);

        List<String> findAllCity = accessRepository.findAllCity();
        model.addAttribute("findAllCity", findAllCity);

        if (action.equals("cityAndCountryUrl")) {
            try {
                date1 = formatter.parse(dateCountryCityUrl1);
                date2 = formatter.parse(dateCountryCityUrl2);

            } catch (ParseException e) {
                System.out.println("Error");
            }
            List<UrlCount> countryUrl = accessRepository.findUrlCountry(countryCoUrl,date1, date2);
            model.addAttribute("countryUrl", countryUrl);

            List<UrlCount> cityUrl = accessRepository.findUrlCity(cityCoUrl,date1, date2);
            model.addAttribute("cityUrl", cityUrl);
        }

        if (action.equals("findAvgRhBytes")) {
            try {
                date1 = formatter.parse(dateAvgRhBytes1);
                date2 = formatter.parse(dateAvgRhBytes2);

            } catch (ParseException e) {
                System.out.println("Error");
            }
            List<RhBytes> findAvgRhBytes = accessRepository.findAvgRhBytes(countRhUrl, date1, date2);
            model.addAttribute("findAvgRhBytes", findAvgRhBytes);
        }

        List<RemotehostUrlAccess> remotehostUrl = accessRepository.findRemotehostUrl(10);
        model.addAttribute("remotehostUrl", remotehostUrl);
        return model;
    }
}