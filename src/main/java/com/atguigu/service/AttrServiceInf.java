package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;

public interface AttrServiceInf {

	List<OBJECT_T_MALL_ATTR> get_attr_list_by_class_2(int class_2_id);

	void save_attr(List<OBJECT_T_MALL_ATTR> list, int class_2_id);

}
