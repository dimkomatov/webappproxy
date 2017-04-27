package prox;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import prox.dto.CityCount;
import prox.dto.CountryCount;
import prox.dto.RemotehostUrlAccess;
import prox.dto.RhBytes;
import prox.model.Access;
import prox.repository.AccessRepository;
import prox.repository.StoreRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
                                      @RequestParam(value="dateCountCity1", required=false) String dateCountCity1,
                                      @RequestParam(value="dateCountCity2", required=false) String dateCountCity2,
                                      @RequestParam(value="dateCountCountry1", required=false) String dateCountCountry1,
                                      @RequestParam(value="dateCountCountry2", required=false) String dateCountCountry2,
                                      @RequestParam(value="dateAvgRhBytes1", required=false) String dateAvgRhBytes1,
                                      @RequestParam(value="dateAvgRhBytes2", required=false) String dateAvgRhBytes2) throws ParseException {
        if (action == null)
            return model;

        Integer countAll = accessRepository.countAll();
        model.addAttribute("countAll", countAll);

        Integer avgBytes = accessRepository.avgBytes();
        model.addAttribute("avgBytes", avgBytes);

            try {
                //date1 = formatter.parse(dateCountCity1);
               // date2 = formatter.parse(dateCountCity2);
                date1 = formatter.parse(dateAvgRhBytes1);
                date2 = formatter.parse(dateAvgRhBytes2);

            } catch (ParseException e) {
                System.out.println("Error");
            }
            List<CityCount> cityCount = accessRepository.findCityCount(date1,date2);
            model.addAttribute("cityCount", cityCount);

            try {
               // date1 = formatter.parse(dateCountCountry1);
               // date2 = formatter.parse(dateCountCountry2);
                date1 = formatter.parse(dateAvgRhBytes1);
                date2 = formatter.parse(dateAvgRhBytes2);

            } catch (ParseException e) {
                System.out.println("Error");
            }
            List<CountryCount> countryCount = accessRepository.findCountryCount(date1,date2);
            model.addAttribute("countryCount", countryCount);

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

        if (action.equals("findAllAccess"))
        {
            List<Access> access = accessRepository.findAllIs();
            List<String> accessList = new ArrayList<>();
            for (Access p : access) {
                accessList.add(p.getTime().toString() + " " + p.getElapse() + " " + p.getRemotehost() + " " + p.getCountry() +
                        " " + p.getCity() + " " + p.getCode()+" "+p.getBytes()+" " + p.getMethod()+ " " + p.getUrl() + " " +
                        p.getRfc931()+ " " + p.getHierarchy_peerhost()+" "+ p.getType());
            }
            model.addAttribute("allAccess", accessList);
        }
        return model;
    }
}