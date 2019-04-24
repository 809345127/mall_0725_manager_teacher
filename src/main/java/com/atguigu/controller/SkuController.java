package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.service.AttrServiceInf;
import com.atguigu.service.SkuServiceInf;

@Controller
public class SkuController {

	@Autowired
	SkuServiceInf skuServiceInf;

	@Autowired
	AttrServiceInf attrServiceInf;

	@RequestMapping("goto_sku")
	public String goto_sku() {
		return "manager_sku";
	}

	@RequestMapping("save_sku")
	public ModelAndView save_sku(T_MALL_SKU sku, MODEL_T_MALL_SKU_ATTR_VALUE list_av) {

		skuServiceInf.save_sku(list_av.getList_av(), sku);
		
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("url", "goto_sku_add.do");
		mv.addObject("title", "商品sku信息发布");
		return mv;
	}

	@RequestMapping("get_attr_by_class_2_sku")
	public String get_attr_by_class_2_sku(int class_2_id, ModelMap map) {

		List<OBJECT_T_MALL_ATTR> list_attr = attrServiceInf.get_attr_list_by_class_2(class_2_id);

		map.put("list_attr", list_attr);
		return "manager_attr_list_inner";
	}

	@RequestMapping("sku_get_spu")
	@ResponseBody
	public List<T_MALL_PRODUCT> sku_get_spu(int class_2_id, int class_1_id, int pp_id, ModelMap map) {
		List<T_MALL_PRODUCT> list_spu = skuServiceInf.sku_get_spu(class_2_id, class_1_id, pp_id);

		map.put("list_spu", list_spu);
		return list_spu;
	}

}
