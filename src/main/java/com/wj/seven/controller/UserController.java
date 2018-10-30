package com.wj.seven.controller;

import com.wj.seven.common.domain.User;
import com.wj.seven.common.util.IdGenerator;
import com.wj.seven.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController  {


    @Autowired
    private UserService userService;

    /**
     * 用户登录
     * @param user
     * @param response
     */
    @RequestMapping("/login")
    public void  userLogin(User user, HttpServletResponse response, HttpServletRequest request) {
        JSONObject json = new JSONObject();
        User findUser = null;
        try {
            findUser = userService.findUserByUserName(user.getUserName());
            if (findUser==null||findUser.getUserId()==null) {
                json.put("result",false);
            }else if(findUser.getUserPwd().trim().equals(user.getUserPwd().trim())) {
                request.getSession().setAttribute("user",findUser);
                json.put("result",true);
            }else{
                json.put("result",false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            json.put("result",false);
        }finally {
            try {
                response.getWriter().print(json);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping("/register")
    @ResponseBody
    public Object register(User user){
        user.setUserId(IdGenerator.uuid());
        Map<String,Object> map = new HashMap<>();
        try {
            userService.addUser(user);
            map.put("rs",true);
        }catch (RuntimeException e){
            e.printStackTrace();
            map.put("rs",false);
        }finally {
            return map;
        }
    }




    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user!=null){
            return "clazz/clazzManager";
        }else{
            return "forward:/login.jsp";
        }
    }

    /**
     * 跳转到用户的注册页面
     * @return
     */
    @RequestMapping("/registerUI")
    public String registerUI(){
        return "register";
    }

    /**
     * 跳转到用户的登录页面
     * @return
     */
    @RequestMapping("/loginUI")
    public String loginUI(){
        return "forward:/login.jsp";
    }

    /**
     *  用户退出
     * @return
     */
    @RequestMapping("/exit")
    @ResponseBody
    public Map  exit(HttpSession session){
        Map<String,Object> rs = new HashMap<>();
        try {
            session.invalidate();
            rs.put("result",true);
            rs.put("msg","用户已退出");
        }catch (Exception e){
            rs.put("result",false);
            rs.put("msg","服务器拉闸，请重试");
        }finally {
            return  rs;
        }
    }


   /* @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String username= req.getParameter("email");
        String password = req.getParameter("password");
        if(username.trim().equals("123@qq.com")&&password.trim().equals("123")){
            System.out.println("登录成功");
        }else{
            System.out.println("失败");
        }
    }*/
}
