package com.dao;

import com.entity.DiscussjianshenkechengEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscussjianshenkechengVO;
import com.entity.view.DiscussjianshenkechengView;


/**
 * 健身课程评论表
 * 
 * @author 
 * @email 
 * @date 2021-04-20 11:56:29
 */
public interface DiscussjianshenkechengDao extends BaseMapper<DiscussjianshenkechengEntity> {
	
	List<DiscussjianshenkechengVO> selectListVO(@Param("ew") Wrapper<DiscussjianshenkechengEntity> wrapper);
	
	DiscussjianshenkechengVO selectVO(@Param("ew") Wrapper<DiscussjianshenkechengEntity> wrapper);
	
	List<DiscussjianshenkechengView> selectListView(@Param("ew") Wrapper<DiscussjianshenkechengEntity> wrapper);

	List<DiscussjianshenkechengView> selectListView(Pagination page,@Param("ew") Wrapper<DiscussjianshenkechengEntity> wrapper);
	
	DiscussjianshenkechengView selectView(@Param("ew") Wrapper<DiscussjianshenkechengEntity> wrapper);
	
}
