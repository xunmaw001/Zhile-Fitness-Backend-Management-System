package com.entity.vo;

import com.entity.JianshenzhishiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
 

/**
 * 健身知识
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 * @date 2021-04-20 11:56:29
 */
public class JianshenzhishiVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 文章编号
	 */
	
	private String wenzhangbianhao;
		
	/**
	 * 图片封面
	 */
	
	private String tupianfengmian;
		
	/**
	 * 健身类型
	 */
	
	private String jianshenleixing;
		
	/**
	 * 文章内容
	 */
	
	private String wenzhangneirong;
		
	/**
	 * 发布时间
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date fabushijian;
				
	
	/**
	 * 设置：文章编号
	 */
	 
	public void setWenzhangbianhao(String wenzhangbianhao) {
		this.wenzhangbianhao = wenzhangbianhao;
	}
	
	/**
	 * 获取：文章编号
	 */
	public String getWenzhangbianhao() {
		return wenzhangbianhao;
	}
				
	
	/**
	 * 设置：图片封面
	 */
	 
	public void setTupianfengmian(String tupianfengmian) {
		this.tupianfengmian = tupianfengmian;
	}
	
	/**
	 * 获取：图片封面
	 */
	public String getTupianfengmian() {
		return tupianfengmian;
	}
				
	
	/**
	 * 设置：健身类型
	 */
	 
	public void setJianshenleixing(String jianshenleixing) {
		this.jianshenleixing = jianshenleixing;
	}
	
	/**
	 * 获取：健身类型
	 */
	public String getJianshenleixing() {
		return jianshenleixing;
	}
				
	
	/**
	 * 设置：文章内容
	 */
	 
	public void setWenzhangneirong(String wenzhangneirong) {
		this.wenzhangneirong = wenzhangneirong;
	}
	
	/**
	 * 获取：文章内容
	 */
	public String getWenzhangneirong() {
		return wenzhangneirong;
	}
				
	
	/**
	 * 设置：发布时间
	 */
	 
	public void setFabushijian(Date fabushijian) {
		this.fabushijian = fabushijian;
	}
	
	/**
	 * 获取：发布时间
	 */
	public Date getFabushijian() {
		return fabushijian;
	}
			
}
