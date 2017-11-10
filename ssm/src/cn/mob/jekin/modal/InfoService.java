package cn.mob.jekin.modal;

import java.util.List;

import cn.mob.jekin.entity.Info;

public interface InfoService extends BaseService<Info>{
	public List<Info> getAll();
}
