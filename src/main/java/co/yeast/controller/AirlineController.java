package co.yeast.controller;

import co.yeast.bean.AirlineVO;
import co.yeast.service.AirlineServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/airline")
public class AirlineController {
    @Autowired
    AirlineServiceImpl airlineService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String boardlist(Model model){
        model.addAttribute("list", airlineService.getAirlineList());
        return "airline/list";    // views/ 이하 실제 경로의 파일을 보여준다
    }
    /*

    // edit과 같은 코드, @RequestParam 사용하여 seq 받기
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String viewPost(@RequestParam("id") int id, Model model){
        BoardVO boardVO = boardService.getBoard(id);
        model.addAttribute("u", boardVO);
        return "board/view";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addPost(){
        return "board/addpostform";
    }

    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addPostOK(BoardVO vo){
        if(boardService.insertBoard(vo) == 0) System.out.println("데이터 추가 실패");
        else System.out.println("데이터 추가 성공!!");
        return "redirect:list";
    }

    @RequestMapping(value = "/editform/{id}", method = RequestMethod.GET)
    public String editPost(@PathVariable("id") int id, Model model){
        BoardVO boardVO = boardService.getBoard(id);
        // System.out.println("boardVO.getTitle(): "+ boardVO.getTitle());
        model.addAttribute("u", boardVO);
        return "board/editform";
    }

    @RequestMapping(value = "/editok", method = RequestMethod.POST)
    public String editPostOk(BoardVO vo){
        if(boardService.updateBoard(vo) == 0) System.out.println("데이터 수정 실패");
        else System.out.println("데이터 수정 성공!!");
        return "redirect:list";
    }

    @RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)
    public String deletePostOk(@PathVariable("id") int id){
        if(boardService.deleteBoard(id) == 0) System.out.println("데이터 삭제 실패");
        else System.out.println("데이터 삭제 성공!!");
        return "redirect:../list";
    }

     */
}
