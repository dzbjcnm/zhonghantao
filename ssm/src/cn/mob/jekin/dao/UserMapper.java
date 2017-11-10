package cn.mob.jekin.dao;

import cn.mob.jekin.entity.User;

public interface UserMapper extends BaseMapper<User> {
	public User login(User user);
}
