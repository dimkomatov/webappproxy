package prox;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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

    @GetMapping("/greeting")
    public String greetingForm(Model model) {
        List<Access> access = accessRepository.findAll();
        List<String> accessList = new ArrayList<>();

        model.addAttribute("allAccess", accessList);
        return "all";
    }

    @PostMapping("/greeting")
    public String greetingSubmit(@ModelAttribute Greeting greeting) {
        return "result";
    }

}