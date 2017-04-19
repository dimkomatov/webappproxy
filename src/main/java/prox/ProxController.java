package prox;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import prox.model.Access;
import prox.repository.AccessRepository;
import prox.repository.StoreRepository;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProxController {

    @Autowired
    private AccessRepository accessRepository;

    @Autowired
    private StoreRepository storeRepository;

    @RequestMapping(value = "/page")
    public Model getForm(Model model, @RequestParam(value="action", required=false) String action) {
        if (action == null)
            return model;
        Integer countAll = accessRepository.countAll();
        model.addAttribute("countAll", countAll);
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