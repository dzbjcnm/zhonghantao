package cn.mob.jekin.dao;

import java.util.List;

import cn.mob.jekin.entity.Info;

public interface InfoMapper extends BaseMapper<Info>{
	public List<Info> getAll();
}
