package cn.edu.cuit.ssm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.edu.cuit.ssm.entity.User;
import cn.edu.cuit.ssm.service.UserService;
/**
 * 
 *
 *

 */
@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	@RequestMapping("/toLogin")
	public String toLogin() {
		return "index";
	}
	@RequestMapping("/toRegister")
	public String toRegister() {
		return "regist";
	}
    @RequestMapping("/login")
    @ResponseBody
	public Map<String,Object> login(@RequestBody User requestuser,Model model,HttpSession session) {
		// 到数据库比对
    	Map<String,Object> modelmap = new HashMap<>();
    	
        boolean ret=userService.login(requestuser.getName(),requestuser.getPass());
        if(requestuser.getName().equals("peter"))
        {
            	modelmap.put("admin", true);
    			
        }
        else
        {
        	modelmap.put("admin", false);
        }
        if (ret) {
        	modelmap.put("success", true);
        	session.setAttribute("user", requestuser);
			
		} else {
			modelmap.put("success", false);
			
		}
        return modelmap;
       

	}
       @PostMapping("/register")
       @ResponseBody
    public Map<String,Object> register(@RequestBody User requestuser)
    {
    	   Map<String,Object> modelmap = new HashMap<>();
    	   
    	   User user = new User();
    	   try {
    	   user.setName(requestuser.getName());
    	   user.setPass(requestuser.getPass());
    	   user.setPhone(requestuser.getPhone());
    	   user.setAddress(requestuser.getAddress());
    	   
    	   userService.insertUserintoDb(user); 
    	   modelmap.put("success", true);
    	   
    	   }catch (Exception e) {
			modelmap.put("success", false);
		}
    	   return modelmap;
    }
       
       @RequestMapping("/success")
       public String toSuccess()
       {
    	   return "success";
       }
       @RequestMapping("/ck")
       @ResponseBody
       public Map<String,Object> ck(@RequestParam("name") String name)
       {
    	   Map<String,Object> modelmap = new HashMap<>();
    	   
    	   if(userService.ck(name)) {
    		   modelmap.put("success", false);
    	   }
    	   else {
    		   modelmap.put("success", true);
    	   }
    	   
    	   return modelmap;
       }
       
}
