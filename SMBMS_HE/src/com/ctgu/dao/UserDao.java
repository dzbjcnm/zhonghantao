package com.ctgu.dao;

import java.util.List;


import com.ctgu.pojo.User;

public interface UserDao {
    //根据id查找用户
    public User findById(Integer id);
    //保存注册的信息
    public void save(User user);
    //验证用户名
    public User findByName(String username);
    //查询所有信息
    public List<User> findAll();
    //删除
    public void doDelete(Integer id);
    //更新
    public void doUpdate(User user);
}
