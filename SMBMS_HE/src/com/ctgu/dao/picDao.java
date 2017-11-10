package com.ctgu.dao;

import java.sql.SQLException;
import java.util.List;

import com.ctgu.pojo.Pic;

public interface picDao {
    //保存
    public void save(Pic p) throws SQLException;
    
    //根据用户id查询图片名称
    public List<Pic> findByUserId(Integer userId) throws SQLException;
}
