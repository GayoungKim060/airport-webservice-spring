package co.yeast.controller;

import co.yeast.bean.AirlineVO;
import co.yeast.bean.SearchVO;
import co.yeast.service.AirlineServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value="/airline")
public class AirlineController {
    @Autowired
    AirlineServiceImpl airlineService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model){

        List<AirlineVO> airlineList = airlineService.getAirlineList();
        // Time 데이터를 가공하여 저장할 리스트
        List<String> formattedTakeoffTimeNew = new ArrayList<>();

        // Views에서 보여줄 Data Processing
        for (AirlineVO airlineVO : airlineList) {
//            DEBUG    airlineList에 저장된 각 AirlineVO 객체의 takeoffTimeNew 필드 출력
//            System.out.println("airline: " + airlineVO.getAirline());
//            System.out.println("TakeoffTime, TakeoffTimeNew: " + airlineVO.getTakeoffTime()+ airlineVO.getTakeoffTimeNew());

            Optional<Time> takeoffTimeNewOptional = airlineVO.getTakeoffTimeNew();

            if(takeoffTimeNewOptional.isPresent()){
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
//                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                formattedTakeoffTimeNew.add(
                        sdf.format(takeoffTimeNewOptional.get()));
            }else{
                formattedTakeoffTimeNew.add("");        // 빈 문자열 설정
            }
        }

        model.addAttribute("list", airlineList);
        model.addAttribute("formattedTime", formattedTakeoffTimeNew);

        return "airline/list";    // views/ 이하 실제 경로의 파일을 보여준다
    }
/*
@RequestMapping(value = "/sorted", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> handleDataRequest(@RequestParam("remark") String remark, Model model){
        List<AirlineVO> airlineList = airlineService.getRemarkList();

        // Time 데이터를 가공하여 저장할 리스트
        List<String> formattedTakeoffTimeNew = new ArrayList<>();

        // Views에서 보여줄 Data Processing
        for (AirlineVO airlineVO : airlineList) {
//            DEBUG    airlineList에 저장된 각 AirlineVO 객체의 takeoffTimeNew 필드 출력
//            System.out.println("airline: " + airlineVO.getAirline());
//            System.out.println("TakeoffTime, TakeoffTimeNew: " + airlineVO.getTakeoffTime()+ airlineVO.getTakeoffTimeNew());

            Optional<Time> takeoffTimeNewOptional = airlineVO.getTakeoffTimeNew();

            if(takeoffTimeNewOptional.isPresent()){
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
//                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                formattedTakeoffTimeNew.add(
                        sdf.format(takeoffTimeNewOptional.get()));
            }else{
                formattedTakeoffTimeNew.add("");        // 빈 문자열 설정
            }
        }

        Map<String, Object> responseData = new HashMap<>();
        responseData.put("list", airlineList);
        responseData.put("formattedTime", formattedTakeoffTimeNew);

        return responseData;
    }
* */

    @RequestMapping(value = "/searchtext", method = RequestMethod.GET)
    public String searchPost(Model model, @RequestParam("searchType")String searchType, @RequestParam("keyword")String keyword){
//        System.out.println("searchVO: "+searchVO.getSearchType()+"/"+searchVO.getKeyword());
        List<AirlineVO> airlineList = airlineService.getSearchList(searchType, keyword);

        // Time 데이터를 가공하여 저장할 리스트
        List<String> formattedTakeoffTimeNew = new ArrayList<>();

        // Views에서 보여줄 Data Processing
        for (AirlineVO airlineVO : airlineList) {
//            DEBUG    airlineList에 저장된 각 AirlineVO 객체의 takeoffTimeNew 필드 출력
//            System.out.println("airline: " + airlineVO.getAirline());
//            System.out.println("TakeoffTime, TakeoffTimeNew: " + airlineVO.getTakeoffTime()+ airlineVO.getTakeoffTimeNew());

            Optional<Time> takeoffTimeNewOptional = airlineVO.getTakeoffTimeNew();

            if(takeoffTimeNewOptional.isPresent()){
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
//                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                formattedTakeoffTimeNew.add(
                        sdf.format(takeoffTimeNewOptional.get()));
            }else{
                formattedTakeoffTimeNew.add("");        // 빈 문자열 설정
            }
        }

        model.addAttribute("list", airlineList);
        model.addAttribute("formattedTime", formattedTakeoffTimeNew);

        return "airline/list";
    }

/*    @RequestMapping(value = "/searchRemark", method = RequestMethod.POST)
    public String searchPost(Model model, SearchVO searchVO){

        return "airline/list";
    }*/

    // edit과 같은 코드, @RequestParam 사용하여 id 받기
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String viewPost(@RequestParam("id") int id, Model model){
        // 필드에 null 값이 있을수 있기때문에 Optional 사용
        AirlineVO airlineVO = airlineService.getAirline(id);

        // Data Processing
        // Add Optional values to the model
        if(airlineVO.getManagerTel().isPresent()){
            model.addAttribute("managerTel", airlineVO.getManagerTel().get());
        }else{
            model.addAttribute("managerTel", "NO DATA");
        }

        if(airlineVO.getNote().isPresent()){
            model.addAttribute("note", airlineVO.getNote().get());
        }else{
            model.addAttribute("note", "NO DATA");
        }

        if(airlineVO.getTakeoffTimeNew().isPresent()){
            model.addAttribute("takeoffTimeNew", airlineVO.getTakeoffTimeNew().get());
        }else{
            model.addAttribute("takeoffTimeNew", "NO DATA");
        }

        model.addAttribute("u", airlineVO);
        return "airline/view";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addPost(){
        return "airline/addpostform";
    }

    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addPostOK(AirlineVO vo){
        if(airlineService.insertAirline(vo) == 0) System.out.println("데이터 추가 실패");
        else System.out.println("데이터 추가 성공!!");
        return "redirect:list";
    }

    @RequestMapping(value = "/editform/{id}", method = RequestMethod.GET)
    public String editPost(@PathVariable("id") int id, Model model){
        // 필드에 null 값이 있을수 있기때문에 Optional 사용
        AirlineVO airlineVO = airlineService.getAirline(id);

        // Data Processing
        // Add Optional values to the model
        if(airlineVO.getManagerTel().isPresent()){
            model.addAttribute("managerTel", airlineVO.getManagerTel().get());
        }else{
            model.addAttribute("managerTel", "NO DATA");
        }

        if(airlineVO.getNote().isPresent()){
            model.addAttribute("note", airlineVO.getNote().get());
        }else{
            model.addAttribute("note", "NO DATA");
        }

        if(airlineVO.getTakeoffTimeNew().isPresent()){
            model.addAttribute("takeoffTimeNew", airlineVO.getTakeoffTimeNew().get());
        }else{
            model.addAttribute("takeoffTimeNew", "NO DATA");
        }
        model.addAttribute("u", airlineVO);
        return "airline/editform";
    }

    @RequestMapping(value = "/editok", method = RequestMethod.POST)
    public String editPostOk(AirlineVO vo){
        if(airlineService.updateAirline(vo) == 0) System.out.println("데이터 수정 실패");
        else System.out.println("데이터 수정 성공!!");
        return "redirect:list";
    }

    @RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)
    public String deletePostOk(@PathVariable("id") int id){
        if(airlineService.deleteAirline(id) == 0) System.out.println("데이터 삭제 실패");
        else System.out.println("데이터 삭제 성공!!");
        return "redirect:../list";
    }
}
