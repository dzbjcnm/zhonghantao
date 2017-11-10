package com.ctgu.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ctgu.dao.UserDao;
import com.ctgu.pojo.User;

public class UserTest {
    @Test
    public void test() throws Exception {
        ApplicationContext ac = new ClassPathXmlApplicationContext("com/ctgu/source/applicationContext.xml");
        DefaultSqlSessionFactory bean = ac.getBean("sessionFactory", DefaultSqlSessionFactory.class);
        SqlSession session = bean.openSession();
        UserDao dao = session.getMapper(UserDao.class);
        User user = dao.findByName("呵呵");
        System.out.println(user);
    }
}
