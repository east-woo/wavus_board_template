package com.wavus.user.web;

import com.wavus.user.service.UserService;
import com.wavus.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {


    UserService userService;


    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "registerForm"; // registerForm.jsp 파일을 보여줌
    }

/*    @PostMapping("/register")
    public String registerUser(@RequestParam("userId") Long userId,
                                @RequestParam("username") String username,
                               @RequestParam("email") String email,
                               @RequestParam("password") String password) {
        // 사용자 정보를 생성
        UserVO user = new UserVO(userId, username, email, password);

        // 사용자 등록
        userService.registerUser(user);

        // 사용자 등록 후에는 다른 페이지로 리다이렉트
        return "redirect:/users/thankyou";
    }*/

    @GetMapping("/thankyou")
    public String showThankYouPage() {
        return "thankyou"; // thankyou.jsp 파일을 보여줌
    }

    @GetMapping("/list")
    public String showUserList(Model model) throws Exception {

        // 모든 사용자 정보를 조회
        List<UserVO> userList = userService.getAllUsers();

        // 모델에 사용자 목록 추가
        model.addAttribute("users", userList);
        System.out.println(userList);
        // userList.jsp 파일을 보여줌

        return  "board/userList";
    }
}