package com.mvc.Final.model.dao;

import java.util.List;

import com.mvc.Final.model.dto.HostDto;
import com.mvc.Final.model.dto.LoginDto;
import com.mvc.Final.model.dto.RequireDto;
import com.mvc.Final.model.dto.ReservationDto;

public interface RequireDao {

	String NAMESPACE = "mypage.";
	
	public int insertrequire(RequireDto rdto);
	
	
	
}
