package cn.mob.jekin.modal;

import cn.mob.jekin.entity.User;

public interface UserService extends BaseService<User> {
	public User login(User user);
}
