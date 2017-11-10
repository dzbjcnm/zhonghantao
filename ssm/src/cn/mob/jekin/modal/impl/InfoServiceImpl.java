package cn.mob.jekin.modal.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mob.jekin.dao.InfoMapper;
import cn.mob.jekin.dao.UserMapper;
import cn.mob.jekin.entity.Info;
import cn.mob.jekin.modal.InfoService;

@Service("infoService")
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private InfoMapper infoMapper;

	@Override
	public int insert(Info entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Info entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Info entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Info select(Info entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Info> getAll() {
		// TODO Auto-generated method stub
		return infoMapper.getAll();
	}

}
