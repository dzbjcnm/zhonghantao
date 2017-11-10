package cn.mob.jekin.control;

import java.util.List;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.mob.jekin.entity.Info;
import cn.mob.jekin.entity.User;
import cn.mob.jekin.modal.InfoService;
import cn.mob.jekin.modal.UserService;
@Controller
@RequestMapping("/user")
public class UserAction extends BaseAction {
	
	@Resource
	private UserService userService;
	
	@RequestMapping(value="/login")
	public String login(User user,HttpServletRequest request,HttpSession session){
		System.out.println("---action.user:"+user);
		User acc= userService.login(user);
		if(acc!=null){
			//存session
			session.setAttribute("user", acc);
			return "redirect:/user/getAll.action";
		}else{
			request.setAttribute("msg", "用户名或密码错误！");
			return "forward:/login.jsp";
		}
		
	}
	@Resource
	private InfoService infoService;
	// @RequestMapping(value="/getAll")
	/**public String getAll(HttpServletRequest request,Model model) {
		List<Info> infolist=infoService.getAll();
		
		model.addAttribute("infoList", infolist); 

		if (infolist != null){
			System.out.println("success!");
			System.out.println(infolist);  
		}
		model.addAttribute("info", infolist); 
		return "redirect:/main.jsp"; 
	}  */
	@RequestMapping(value="/getAll")
	public ModelAndView getAll(HttpServletRequest request) throws Exception {
		// 测试forward后request是否可以共享

		System.out.println(request.getParameter("id"));
		// 调用service查找 数据库，查询商品列表s
		List<Info> infoList = infoService.getAll();

		// 返回ModelAndView
		ModelAndView modelAndView = new ModelAndView();
		// 相当 于request的setAttribut，在jsp页面中通过itemsList取数据
		modelAndView.addObject("infoList", infoList);

		// 指定视图
		// 下边的路径，如果在视图解析器中配置jsp路径的前缀和jsp路径的后缀，修改为
		// modelAndView.setViewName("/WEB-INF/jsp/items/itemsList.jsp");	
		// 上边的路径配置可以不在程序中指定jsp路径的前缀和jsp路径的后缀
		modelAndView.setViewName("/main.jsp");

		return modelAndView;
}
}
