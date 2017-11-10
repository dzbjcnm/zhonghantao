package com.ctgu.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ctgu.dao.UserDao;
import com.ctgu.dao.picDao;
import com.ctgu.pojo.Pic;
import com.ctgu.pojo.User;
import com.ctgu.utils.VerifyCodeUtils;
import com.sun.image.codec.jpeg.*;


@Controller
public class UserController {
    //注入接口对象
    @Resource   
    private UserDao userDao;

    @Resource
    private picDao pDao;

    @RequestMapping("/loginPage.do")
    public String loginPage() {
        return "/login";
    }
    //注册界面
    @RequestMapping("/toRegister.do")
    public String toRegist() {
        return "/regist";
    }

    //用户列表界面
    @RequestMapping("/userListPage.do")
    public ModelAndView userListPage() {
        List<User> list = new ArrayList<User>();
        list = userDao.findAll();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return new ModelAndView("/userList",map);
    }
    
    //防止其他用户信息被修改
    @RequestMapping("/toUpload.do")
    public String toUpload() {
            
        return "";
    }


    //验证用户名是否存在
    @RequestMapping("/findByName.do")
    @ResponseBody
    public boolean checkUsername(@RequestParam("username")String username) {
        User user = userDao.findByName(username);
        if(user != null) {
            return false;
        }else {
            return true;
        }
    }

    //提交注册
    @RequestMapping("/Regist.do")
    public ModelAndView doRegist(User user) {
        userDao.save(user);
        return new ModelAndView("/regist_success");
    }

    //验证用户名密码
    @RequestMapping("/login.do")
    @ResponseBody
    public boolean checkLogin(@RequestParam("username")String username, @RequestParam("password")String password) throws IOException {
        User user = userDao.findByName(username);
        if (user == null) {
            return false;
        }else if(user.getPassword().equals(password)) {
            return true;
        }else {
            return false;
        }
    }

    //登陆成功,并获取所有用户信息
    @RequestMapping("/doLogin.do")
    public ModelAndView doLogin(HttpServletRequest request, @RequestParam("username")String username, @RequestParam("password")String password) throws IOException {
        List<User> list = new ArrayList<User>();
        User user = userDao.findByName(username);
        list = userDao.findAll();
        Map<String, Object> map = new HashMap<String, Object>();
        request.getSession().setAttribute("u", user);
        map.put("u", user);
        map.put("list", list);
        return new ModelAndView("/userList",map);
    }

    //删除
    @RequestMapping("/delete.do")
    public String doDelete(HttpServletRequest request,@RequestParam("id")String id) {
        userDao.doDelete(Integer.parseInt(id));
        request.removeAttribute("u");
        return "/delete_success";
    }

    //更新
    @RequestMapping("/load.do")
    public ModelAndView doLoad(HttpServletRequest request) {
        User u = (User) request.getSession().getAttribute("u");
        User user = userDao.findById(u.getId());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user1", user);
        return new ModelAndView("/upload", map);
    }

    //执行更新
    @RequestMapping("/update.do")
    public ModelAndView doUpdate(User user) {
        userDao.doUpdate(user);
        User u = userDao.findById(user.getId());
        List<User> list = new ArrayList<User>();
        list = userDao.findAll();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return new ModelAndView("/userList", map);
    }
    //详情页面
    @RequestMapping("/userDetail.do")
    public ModelAndView userDetail(@RequestParam("id")String id) throws NumberFormatException, SQLException {
        User user = userDao.findById(Integer.parseInt(id));
        List<Pic> pList = new ArrayList<Pic>();
        pList = pDao.findByUserId(Integer.parseInt(id));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pList", pList);
        map.put("myUser", user);
        return new ModelAndView("/userDetail", map);
    }

    //上传图片
    @SuppressWarnings("unchecked")
	@RequestMapping("/msgUpload.do")
    public String msgUpload(HttpServletRequest request, HttpServletResponse response,
            @RequestParam("id")String Id) throws SQLException {
        int id = Integer.parseInt(Id);
        //文件上传到本地服务器
        DiskFileItemFactory disk = new DiskFileItemFactory();
        //创建解析对象upload
        ServletFileUpload upload = new ServletFileUpload(disk);
        List<FileItem> list = new ArrayList<>();
        try {
            list = upload.parseRequest(request);
        } catch (FileUploadException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        for(int i = 0; i < list.size(); i++){
            FileItem item = list.get(i);
            //得到文件名称
            String name = item.getName();
            String path = request.getServletContext().getRealPath("upload");
            String path1 = path.substring(path.lastIndexOf("\\") + 1);
            path1 = path + File.separator + "pic_" + id;
            File file = new File(path1);
            file.mkdirs();
            file = new File(path1, name);
            String pName = "pic_" + id + File.separator + name;
            Pic pic = new Pic();
            pic.setPicName(pName);
            pic.setUserId(id);
            try {
                item.write(file);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            pDao.save(pic);

        }
        //上传完毕跳转到页面
        List<Pic> pList = new ArrayList<>();
        pList = pDao.findByUserId(id);
        User user = userDao.findById(id);
        request.getSession().setAttribute("pList", pList);
        request.getSession().setAttribute("myUser", user);
        return "/userDetail";
    }

}
