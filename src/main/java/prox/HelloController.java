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
public class HelloController {

    @Autowired
    private AccessRepository accessRepository;

    @Autowired
    private StoreRepository storeRepository;

    @RequestMapping("/page")
    public Model hello(Model model,
                       @RequestParam(value="action", required=false) String action){
        if (action == null)
            return model;
        if (action.equals("findAllAccess")) {
            List<Access> access = accessRepository.findAll();
            List<String> accessList = new ArrayList<>();

            for (Access p : access) {
                accessList.add(p.getTime().toString() + " " + p.getElapse() + " " + p.getRemotehost() + " " + p.getCountry() +
                                    " " + p.getCity() + " " + p.getCode()+" "+p.getBytes()+" " + p.getMethod()+ " " + p.getUrl() + " " +
                p.getRfc931()+ " " + p.getHierarchy_peerhost()+" "+ p.getType());

            }
            model.addAttribute("allAccess", accessList);
        }

//        if (action.equals("findVoted")) {
//            List<Person> people = peopleRepository.findAllVoted();
//            List<String> userList = new ArrayList<>();
//            for (Person p : people) {
//                userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес: " + p.getAddress() +
//                        "   |   Телефон: " + p.getPhone() + "   |   Дата рождения:" + p.getBirthdate().toString().split(" ")[0]);
//            }
//            model.addAttribute("voted", userList);
//        }

        return model;
    }


//    @RequestMapping("/admin")
//    public Model hello2(Model model,
//                        @RequestParam(value="action", required=false) String action) {
//        return model;
//    }

//    @RequestMapping("/login")
//    public Model login(Model model, @RequestParam(value="name", required=false) String name) {
//
//        return model;
//    }

}
