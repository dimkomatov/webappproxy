package prox;

import prox.model.Person;
import prox.repository.PeopleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class HelloController {


    @Autowired
    private PeopleRepository peopleRepository;

    @Autowired
    private VoteRepository voteRepository;


    @Autowired
    private PersonVoteRepository personVoteRepository;

    @RequestMapping("/page")
    public Model hello(Model model,
                       @RequestParam(value="action", required=false) String action,
                       @RequestParam(value="voteId", required=false) Integer voteId,
                       @RequestParam(value="voteDateTime", required=false) String voteDateTime,
                       @RequestParam(value="voteAddress", required=false) String voteAddress) {

        model.addAttribute("votes", new String());
        Collection<Vote> votes = voteRepository.findAll();
        Map<Integer, String> country = new LinkedHashMap<Integer, String>();
        for (Vote vote : votes) {
            country.put(vote.getId(), "Название выборов: " + vote.getDescription() + "   |    Адрес выборов: " + vote.getAddress()
                    + "   |    Дата выборов:" + vote.getDateTime().toString().split(" ")[0]);
        }
        model.addAttribute("voteList", country);

        if (action == null)
            return model;
        if (action.equals("findNamesakes")) {
            List<Person> persons = peopleRepository.findAll();
            List<String> userList = new ArrayList<>();
            Collection<Person> personCollection = new ArrayList<>();

            for (Person p : persons) {
                for (Person pInternal : persons) {
                    if (!p.getId().equals(pInternal.getId()) && p.getSurName().toLowerCase().equals(pInternal.getSurName().toLowerCase())) {
                        if (!personCollection.contains(p)) {

                            userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес: " + p.getAddress() +
                                    "   |   Телефон: " + p.getPhone() + "   |   Дата рождения:" + p.getBirthdate().toString().split(" ")[0]);

                            personCollection.add(p);
                        }

                    }
                }
            }
            model.addAttribute("lists", userList);
        }
        /*if (action.equals("findNamesakes")) {
            List<Person> persons = peopleRepository.findAll();
            List<String> userList = new ArrayList<>();
            for (Person p : persons) {
                for (Person pInternal : persons) {
                    if (!userList.contains(p) && !userList.contains(pInternal) && p.getId() != pInternal.getId() && p.getSurName().equals(pInternal.getSurName())) {
                        System.out.println("P" + userList.contains(p));
                        System.out.println("pInternal" + userList.contains(pInternal));
                        userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес: " + p.getAddress() +
                                "   |   Телефон: " + p.getPhone() + "   |   Дата рождения:" + p.getBirthdate().toString().split(" ")[0]);

                    }
                }
            }

            prox.model.addAttribute("lists", userList);
        }*/

        if (action.equals("findVoted")) {
            List<Person> people = peopleRepository.findAllVoted();
            List<String> userList = new ArrayList<>();
            for (Person p : people) {
                userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес: " + p.getAddress() +
                        "   |   Телефон: " + p.getPhone() + "   |   Дата рождения:" + p.getBirthdate().toString().split(" ")[0]);
            }
            model.addAttribute("voted", userList);
        }

        if (action.equals("findMlSt")) {
            List<Person> people = peopleRepository.findMlSt();
            List<String> userList = new ArrayList<>();
            for (Person p : people) {
                userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес: " + p.getAddress() +
                        "   |   Телефон: " + p.getPhone() + "   |   Дата рождения:" + p.getBirthdate().toString().split(" ")[0]);
            }
            model.addAttribute("mlSt", userList);
        }

        if (action.equals("findUnVoted")) {
            List<Person> people = peopleRepository.findAllUnVoted();
            List<Person> peopleVoted = peopleRepository.findAllVoted();
            people.removeAll(peopleVoted);

            List<String> userList = new ArrayList<>();
            for (Person p : people) {
                userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес: " + p.getAddress() +
                        "   |   Телефон: " + p.getPhone() + "   |   Дата рождения:" + p.getBirthdate().toString().split(" ")[0]);
            }
            model.addAttribute("unvoted", userList);
        }
        if (action.equals("getByVote")) {
            List<Person> people = peopleRepository.findByVote(voteId);
            List<String> userList = new ArrayList<>();
            for (Person p : people) {
                userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес: " + p.getAddress() +
                        "   |   Телефон: " + p.getPhone() + "   |   Дата рождения:" + p.getBirthdate().toString().split(" ")[0]);
            }
            model.addAttribute("peopleByVote", userList);
        }
        if (action.equals("getByDate")) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = formatter.parse(voteDateTime);

            } catch (ParseException e) {
                //e.printStackTrace();
                model.addAttribute("peopleByDate", "Ошибка! Неверно задана дата! Требуемый формат: ГГГГ-ММ-ДД");
                return model;
            }
//            List<Person> people = peopleRepository.findByVoteDate(date);
//            List<String> userList = new ArrayList<>();
//            for (Person p : people) {
//                userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + " Address:" + p.getAddress() +
//                        " Phone:" + p.getPhone() + " birthdate:" + p.getBirthdate().toString());
//            }
            List<Person> people = peopleRepository.findAll();
            List<String> userList = new ArrayList<>();
            for (Person p : people) {
                Date a = new Date(p.getBirthdate().getTime() + 568025136000L);

                if (a.before(date)) {
                    userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + " Address:" + p.getAddress() +
                            " Phone:" + p.getPhone() + " birthdate:" + p.getBirthdate().toString());
                }
//                else {
//                    if(p.getBirthdate().getYear() + 18 == date.getYear() && p.getBirthdate().getMonth() < date.getMonth()){
//                        userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + " Address:" + p.getAddress() +
//                                " Phone:" + p.getPhone() + " birthdate:" + p.getBirthdate().toString());
//                    }
//                    else{
//                        if(p.getBirthdate().getYear() + 18 == date.getYear()
//                                && p.getBirthdate().getMonth() == date.getMonth()
//                                && p.getBirthdate().getDay() <= date.getDay()) {
//                            int a = date.getDay();
//                            userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + " Address:" + p.getAddress() +
//                                    " Phone:" + p.getPhone() + " birthdate:" + p.getBirthdate().toString());
//                        }
//                    }
//                }
            }
            model.addAttribute("peopleByDate", userList);
        }

        if (action.equals("getByAddress")) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String date = formatter.format(new Date());
            Date formattedDate = null;
            try {
                formattedDate = formatter.parse(date);
            } catch (Exception e) {

            }

//            List<Person> people = peopleRepository.findByVoteDateAndAddress(formattedDate, voteAddress);
            List<Person> people = peopleRepository.findAll();
            List<String> userList = new ArrayList<>();
            for (Person p : people) {
                Date a = new Date(p.getBirthdate().getTime() + 568025136000L);

                if (a.before(new Date()) && p.getAddress().toLowerCase().equals(voteAddress.toLowerCase())) {
                    userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + " Address:" + p.getAddress() +
                            " Phone:" + p.getPhone() + " birthdate:" + p.getBirthdate().toString());
                }
//                userList.add(p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + " Address:" + p.getAddress() +
//                        " Phone:" + p.getPhone() + " birthdate:" + p.getBirthdate().toString());
            }
            model.addAttribute("peopleByAddress", userList);
        }
        return model;
    }

    @RequestMapping("/admin")
    public Model hello2(Model model,
                        @RequestParam(value="action", required=false) String action,
                        @RequestParam(value="personName", required=false) String personName,
                        @RequestParam(value="personMiddleName", required=false) String personMiddleName,
                        @RequestParam(value="personSurName", required=false) String personSurName,
                        @RequestParam(value="address", required=false) String address,
                        @RequestParam(value="phone", required=false) String phone,
                        @RequestParam(value="birthdate", required=false) String birthdate,


                        @RequestParam(value="addressVote", required=false) String addressVote,
                        @RequestParam(value="description", required=false) String description,
                        @RequestParam(value="voteDate", required=false) String voteDate,

                        @RequestParam(value="voteId", required=false) Integer voteId,
                        @RequestParam(value="personId", required=false) Integer personId,
                        @RequestParam(value="voted", required=false) Boolean voted,

                        @RequestParam(value="personVoteIds", required=false) String personVoteIds
                        ) {

        model.addAttribute("personVote",new String());
        model.addAttribute("votess",new String());
        model.addAttribute("votes",new String());
        model.addAttribute("people",new String());
        model.addAttribute("peoplee",new String());
        model.addAttribute("personVotes",new String());
        if (action == null) {
            action = "showDefault";
        }
        if(action.equals("addPerson")) {
            List<String> userList = new ArrayList<>();
            if(personName.length() > 100 || personName.length() == 0){
                userList.add("Неверно задано имя (1-100 символов)");
            }
            if(personMiddleName.length() > 100 || personMiddleName.length() == 0){
                userList.add("Неверно задано отчество (1-100 символов)");
            }
            if(personSurName.length() > 100 || personSurName.length() == 0){
                userList.add("Неверно задана фамилия (1-100 символов)");
            }
            if(address.length() > 100 || address.length() == 0){
                userList.add("Неверно задан адрес (1-100 символов)");
            }
            if(phone.length() > 100 || phone.length() == 0){
                userList.add("Неверно задан телефон (1-100 символов)");
            }
            Date date = null;
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            try {
                date = formatter.parse(birthdate);

            } catch (ParseException e) {
                userList.add("Неверно задана дата рождения! Требуемый формат: ГГГГ-ММ-ДД");
            }

            if(userList.size() > 0 ){//Ошибка
                model.addAttribute("addedPerson", userList);



                Collection<Vote> votes = voteRepository.findAll();
                Map<Integer,String> country = new LinkedHashMap<Integer,String>();
                for(Vote vote: votes){
                    country.put(vote.getId(), "Название выборов: " + vote.getDescription() + "   |    Адрес выборов: " + vote.getAddress()
                            + "   |    Дата выборов:" +vote.getDateTime().toString().split(" ")[0]);
                }
                model.addAttribute("voteList",country);

                Collection<Person> personCollection = peopleRepository.findAll();
                Map<Integer,String> peopleMap = new LinkedHashMap<Integer,String>();
                for(Person p: personCollection){
                    peopleMap.put(p.getId(),p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес :" + p.getAddress() +
                            "   |   Телефон :" + p.getPhone() + "   |   Дата рождения :" + p.getBirthdate().toString().split(" ")[0]);
                }
                model.addAttribute("personList",peopleMap);

                Collection<PersonVote> personVotes = personVoteRepository.findAll();
                Map<String,String> personVotesMap = new LinkedHashMap<String,String>();
                for(PersonVote personVote:personVotes){
                    personVotesMap.put(personVote.getVote().getId() +"-"+ personVote.getPerson().getId(),
                            personVote.getPerson().getSurName() + "-" + personVote.getVote().getDescription());
                }
                model.addAttribute("personVoteList",personVotesMap);
                return model;
            }
            Person person = new Person(personName,personMiddleName,
                    personSurName,address,phone,date);

            Person savedPerson = peopleRepository.save(person);
            userList.add(savedPerson.getName() + " " + savedPerson.getMiddleName() + " "
                    + savedPerson.getSurName() + "   |   Адрес:" + savedPerson.getAddress() +
                    " Phone:" + savedPerson.getPhone() + "   |   Дата рождения:" + savedPerson.getBirthdate().toString().split(" ")[0]);


            model.addAttribute("addedPerson", userList);
        }

        if(action.equals("addVote")) {
            List<String> userList = new ArrayList<>();
            if(addressVote.length() > 100 || addressVote.length() == 0){
                userList.add("Неверно задан адрес голосования(1-100 символов)");
            }
            if(description.length() > 100 || description.length() == 0){
                userList.add("Неверно задано описание голосования (1-100 символов)");
            }
            Date date = null;
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            try {
                date = formatter.parse(voteDate);

            } catch (ParseException e) {
                userList.add("Ошибка! Неверно задана дата голосования! Требуемый формат: ГГГГ-ММ-ДД");
            }

            if(userList.size() > 0 ){//Ошибка
                model.addAttribute("addedVote", userList);



                Collection<Vote> votes = voteRepository.findAll();
                Map<Integer,String> country = new LinkedHashMap<Integer,String>();
                for(Vote vote: votes){
                    country.put(vote.getId(), "Название выборов: " + vote.getDescription() + "   |    Адрес выборов: " + vote.getAddress()
                            + "   |    Дата выборов:" +vote.getDateTime().toString().split(" ")[0]);
                }
                model.addAttribute("voteList",country);

                Collection<Person> personCollection = peopleRepository.findAll();
                Map<Integer,String> peopleMap = new LinkedHashMap<Integer,String>();
                for(Person p: personCollection){
                    peopleMap.put(p.getId(),p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес :" + p.getAddress() +
                            "   |   Телефон :" + p.getPhone() + "   |   Дата рождения :" + p.getBirthdate().toString().split(" ")[0]);
                }
                model.addAttribute("personList",peopleMap);

                Collection<PersonVote> personVotes = personVoteRepository.findAll();
                Map<String,String> personVotesMap = new LinkedHashMap<String,String>();
                for(PersonVote personVote:personVotes){
                    personVotesMap.put(personVote.getVote().getId() +"-"+ personVote.getPerson().getId(),
                            personVote.getPerson().getSurName() + "-" + personVote.getVote().getDescription());
                }
                model.addAttribute("personVoteList",personVotesMap);
                return model;
            }
            Vote vote = new Vote(date, addressVote, description);

            Vote savedVote = voteRepository.save(vote);
            userList.add("Название выборов:" + savedVote.getDescription() + " Адрес выборов:" + savedVote.getAddress()
                    + " Дата выборов:" +savedVote.getDateTime().toString().split(" ")[0]);


            model.addAttribute("addedVote", userList);
        }

        if(action.equals("addPersonVote")) {
            List<String> userList = new ArrayList<>();
            Person person = peopleRepository.findOne(personId);

            Vote vote = voteRepository.findOne(voteId);

            if(vote == null || person == null){
                userList.add("Ошибка при попытке добавить пользователя на выборы");
                model.addAttribute("addedPersonVote", userList);


                Collection<Vote> votes = voteRepository.findAll();
                Map<Integer,String> country = new LinkedHashMap<Integer,String>();
                for(Vote vote2: votes){
                    country.put(vote2.getId(), "Название выборов:" + vote2.getDescription() + " Адрес выборов:" + vote2.getAddress()
                            + " Дата выборов:" +vote2.getDateTime().toString().split(" ")[0]);
                }
                model.addAttribute("voteList",country);

                Collection<Person> personCollection = peopleRepository.findAll();
                Map<Integer,String> peopleMap = new LinkedHashMap<Integer,String>();
                for(Person p: personCollection){
                    peopleMap.put(p.getId(),p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес :" + p.getAddress() +
                            "   |   Телефон :" + p.getPhone() + "   |   Дата рождения :" + p.getBirthdate().toString().split(" ")[0]);
                }
                model.addAttribute("personList",peopleMap);

                Collection<PersonVote> personVotes = personVoteRepository.findAll();
                Map<String,String> personVotesMap = new LinkedHashMap<String,String>();
                for(PersonVote personVote:personVotes){
                    personVotesMap.put(personVote.getVote().getId() +"-"+ personVote.getPerson().getId(),
                            personVote.getPerson().getSurName() + "-" + personVote.getVote().getDescription());
                }
                model.addAttribute("personVoteList",personVotesMap);
                return model;
            }

            PersonVote personVote = new PersonVote(person, vote, voted);
            if(personVoteRepository.findByVoteAndPerson(vote,person) != null){
                userList.add("Ошибка! Признак участия в голосовании данного избирателя на данных выборах уже существует!");
                model.addAttribute("addedPersonVote", userList);


                Collection<Vote> votes = voteRepository.findAll();
                Map<Integer,String> country = new LinkedHashMap<Integer,String>();
                for(Vote vote2: votes){
                    country.put(vote2.getId(), "Название выборов:" + vote2.getDescription() + " Адрес выборов:" + vote2.getAddress()
                            + " Дата выборов:" +vote2.getDateTime().toString().split(" ")[0]);
                }
                model.addAttribute("voteList",country);

                Collection<Person> personCollection = peopleRepository.findAll();
                Map<Integer,String> peopleMap = new LinkedHashMap<Integer,String>();
                for(Person p: personCollection){
                    peopleMap.put(p.getId(),p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес :" + p.getAddress() +
                            "   |   Телефон :" + p.getPhone() + "   |   Дата рождения :" + p.getBirthdate().toString().split(" ")[0]);
                }
                model.addAttribute("personList",peopleMap);

                Collection<PersonVote> personVotes = personVoteRepository.findAll();
                Map<String,String> personVotesMap = new LinkedHashMap<String,String>();
                for(PersonVote personVote2:personVotes){
                    personVotesMap.put(personVote2.getVote().getId() +"-"+ personVote2.getPerson().getId(),
                            personVote2.getPerson().getSurName() + "-" + personVote2.getVote().getDescription());
                }
                model.addAttribute("personVoteList",personVotesMap);
                return model;
            }

            PersonVote savedPersonVote = personVoteRepository.save(personVote);
            userList.add("Успешно добавлено!");

            model.addAttribute("addedPersonVote", userList);
        }

        if(action.equals("deleteVote")) {
            List<String> userList = new ArrayList<>();
            Vote vote = voteRepository.findOne(voteId);

            if(vote == null){
                userList.add("Ошибка при удалении");
                model.addAttribute("deletedVote", userList);


                Collection<Vote> votes = voteRepository.findAll();
                Map<Integer,String> country = new LinkedHashMap<Integer,String>();
                for(Vote vote2: votes){
                    country.put(vote2.getId(), "Название выборов:" + vote2.getDescription() + " Адрес выборов:" + vote2.getAddress()
                            + " Дата выборов:" +vote2.getDateTime().toString().split(" ")[0]);
                }
                model.addAttribute("voteList",country);

                Collection<Person> personCollection = peopleRepository.findAll();
                Map<Integer,String> peopleMap = new LinkedHashMap<Integer,String>();
                for(Person p: personCollection){
                    peopleMap.put(p.getId(),p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес :" + p.getAddress() +
                            "   |   Телефон :" + p.getPhone() + "   |   Дата рождения :" + p.getBirthdate().toString().split(" ")[0]);
                }
                model.addAttribute("personList",peopleMap);

                Collection<PersonVote> personVotes = personVoteRepository.findAll();
                Map<String,String> personVotesMap = new LinkedHashMap<String,String>();
                for(PersonVote personVote:personVotes){
                    personVotesMap.put(personVote.getVote().getId() +"-"+ personVote.getPerson().getId(),
                            personVote.getPerson().getSurName() + "-" + personVote.getVote().getDescription());
                }
                model.addAttribute("personVoteList",personVotesMap);
                return model;
            }

            voteRepository.delete(vote);
            userList.add("Успешно удалено!");

            model.addAttribute("deletedVote", userList);
        }

        if(action.equals("deletePerson")) {
            List<String> userList = new ArrayList<>();
            Person person = peopleRepository.findOne(personId);

            if(person == null){
                userList.add("Ошибка при удалении");
                model.addAttribute("deletedPerson", userList);


                Collection<Vote> votes = voteRepository.findAll();
                Map<Integer,String> country = new LinkedHashMap<Integer,String>();
                for(Vote vote2: votes){
                    country.put(vote2.getId(), "Название выборов:" + vote2.getDescription() + " Адрес выборов:" + vote2.getAddress()
                            + " Дата выборов:" +vote2.getDateTime().toString().split(" ")[0]);
                }
                model.addAttribute("voteList",country);

                Collection<Person> personCollection = peopleRepository.findAll();
                Map<Integer,String> peopleMap = new LinkedHashMap<Integer,String>();
                for(Person p: personCollection){
                    peopleMap.put(p.getId(),p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес :" + p.getAddress() +
                            "   |   Телефон :" + p.getPhone() + "   |   Дата рождения :" + p.getBirthdate().toString().split(" ")[0]);
                }
                model.addAttribute("personList",peopleMap);

                Collection<PersonVote> personVotes = personVoteRepository.findAll();
                Map<String,String> personVotesMap = new LinkedHashMap<String,String>();
                for(PersonVote personVote:personVotes){
                    personVotesMap.put(personVote.getVote().getId() +"-"+ personVote.getPerson().getId(),
                            personVote.getPerson().getSurName() + "-" + personVote.getVote().getDescription());
                }
                model.addAttribute("personVoteList",personVotesMap);
                return model;
            }

            peopleRepository.delete(person);
            userList.add("Успешно удалено!");

            model.addAttribute("deletedPerson", userList);
        }

        if(action.equals("deletePersonVote")) {
            List<String> userList = new ArrayList<>();
            Integer personIdForDelete = Integer.valueOf(personVoteIds.split("-")[1]);
            Integer voteIdForDelete = Integer.valueOf(personVoteIds.split("-")[0]);
            Person person = peopleRepository.findOne(personIdForDelete);

            Vote vote = voteRepository.findOne(voteIdForDelete);

            if(vote == null || person == null){
                userList.add("Ошибка при попытке удалить пользователя с выборов");
                model.addAttribute("deletedPersonVote", userList);


                Collection<Vote> votes = voteRepository.findAll();
                Map<Integer,String> country = new LinkedHashMap<Integer,String>();
                for(Vote vote2: votes){
                    country.put(vote2.getId(), "Название выборов:" + vote2.getDescription() + " Адрес выборов:" + vote2.getAddress()
                            + " Дата выборов:" +vote2.getDateTime().toString().split(" ")[0]);
                }
                model.addAttribute("voteList",country);

                Collection<Person> personCollection = peopleRepository.findAll();
                Map<Integer,String> peopleMap = new LinkedHashMap<Integer,String>();
                for(Person p: personCollection){
                    peopleMap.put(p.getId(),p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес :" + p.getAddress() +
                            "   |   Телефон :" + p.getPhone() + "   |   Дата рождения :" + p.getBirthdate().toString().split(" ")[0]);
                }
                model.addAttribute("personList",peopleMap);

                Collection<PersonVote> personVotes = personVoteRepository.findAll();
                Map<String,String> personVotesMap = new LinkedHashMap<String,String>();
                for(PersonVote personVote:personVotes){
                    personVotesMap.put(personVote.getVote().getId() +"-"+ personVote.getPerson().getId(),
                            personVote.getPerson().getSurName() + "-" + personVote.getVote().getDescription());
                }
                model.addAttribute("personVoteList",personVotesMap);
                return model;
            }

            if(personVoteRepository.findByVoteAndPerson(vote,person) == null){
                userList.add("Ошибка! Признак участия в голосовании данного избирателя на данных выборах не найден!");
                model.addAttribute("addedPersonVote", userList);


                Collection<Vote> votes = voteRepository.findAll();
                Map<Integer,String> country = new LinkedHashMap<Integer,String>();
                for(Vote vote2: votes){
                    country.put(vote2.getId(), "Название выборов:" + vote2.getDescription() + " Адрес выборов:" + vote2.getAddress()
                            + " Дата выборов:" +vote2.getDateTime().toString().split(" ")[0]);
                }
                model.addAttribute("voteList",country);

                Collection<Person> personCollection = peopleRepository.findAll();
                Map<Integer,String> peopleMap = new LinkedHashMap<Integer,String>();
                for(Person p: personCollection){
                    peopleMap.put(p.getId(),p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес :" + p.getAddress() +
                            "   |   Телефон :" + p.getPhone() + "   |   Дата рождения :" + p.getBirthdate().toString().split(" ")[0]);
                }
                model.addAttribute("personList",peopleMap);

                Collection<PersonVote> personVotes = personVoteRepository.findAll();
                Map<String,String> personVotesMap = new LinkedHashMap<String,String>();
                for(PersonVote personVote:personVotes){
                    personVotesMap.put(personVote.getVote().getId() +"-"+ personVote.getPerson().getId(),
                            personVote.getPerson().getSurName() + "-" + personVote.getVote().getDescription());
                }
                model.addAttribute("personVoteList",personVotesMap);
                return model;
            }

            personVoteRepository.deleteByVoteAndPerson(vote,person);
            userList.add("Успешно удалено!");

            model.addAttribute("deletedPersonVote", userList);
        }



        Collection<Vote> votes = voteRepository.findAll();
        Map<Integer,String> country = new LinkedHashMap<Integer,String>();
        for(Vote vote: votes){
            country.put(vote.getId(), "Название выборов: " + vote.getDescription() + "   |    Адрес выборов: " + vote.getAddress()
                    + "   |    Дата выборов:" +vote.getDateTime().toString().split(" ")[0]);
        }
        model.addAttribute("voteList",country);

        Collection<Person> personCollection = peopleRepository.findAll();
        Map<Integer,String> peopleMap = new LinkedHashMap<Integer,String>();
        for(Person p: personCollection){
            peopleMap.put(p.getId(),p.getName() + " " + p.getMiddleName() + " " + p.getSurName() + "   |   Адрес :" + p.getAddress() +
                    "   |   Телефон :" + p.getPhone() + "   |   Дата рождения :" + p.getBirthdate().toString().split(" ")[0]);
        }
        model.addAttribute("personList",peopleMap);

        Collection<PersonVote> personVotes = personVoteRepository.findAll();
        Map<String,String> personVotesMap = new LinkedHashMap<String,String>();
        for(PersonVote personVote:personVotes){
            personVotesMap.put(personVote.getVote().getId() +"-"+ personVote.getPerson().getId(),
                    personVote.getPerson().getSurName() + "-" + personVote.getVote().getDescription());
        }
        model.addAttribute("personVoteList",personVotesMap);

        return model;
    }

    @RequestMapping("/votes")
    public Model findVotes(Model model) {
        Map<String,String> country = new LinkedHashMap<String,String>();
        country.put("US", "United Stated");
        country.put("CHINA", "China");
        country.put("SG", "Singapore");
        country.put("MY", "Malaysia");
        model.addAttribute("voteList",country);
        return model;
    }

    @RequestMapping("/login")
    public Model login(Model model, @RequestParam(value="name", required=false) String name) {

        return model;
    }

}
