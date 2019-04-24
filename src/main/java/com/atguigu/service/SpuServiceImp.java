package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.mapper.SpuMapper;

@Service
public class SpuServiceImp implements SpuServiceInf {

	@Autowired
	SpuMapper spuMapper;

	@Override
	public void save_spu(T_MALL_PRODUCT spu, List<String> list_image) {
		// 插入商品信息
		spu.setShp_tp(list_image.get(0));
		spuMapper.insert_spu(spu);

		// 插入商品图片信息
		Map<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("list_image", list_image);
		hashMap.put("spu", spu);
		spuMapper.insert_spu_image(hashMap);

	}

}
