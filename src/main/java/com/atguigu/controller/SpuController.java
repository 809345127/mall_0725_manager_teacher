package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.service.SpuServiceInf;
import com.atguigu.util.MyUploadUtil;

@Controller
public class SpuController {

	@Autowired
	SpuServiceInf spuServiceInf;

	@RequestMapping("save_spu")
	public ModelAndView save_spu(T_MALL_PRODUCT spu, @RequestParam("files") MultipartFile[] files) {

		// 保存spu信息的业务

		// 上传图片文件，返回图片信息
		List<String> list_image = MyUploadUtil.upload_images(files);

		// 插入spu信息(spu表)，插入图片信息(商品图片表)
		spuServiceInf.save_spu(spu, list_image);

		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("url", "goto_spu_add.do");
		mv.addObject("title", "商品信息添加");
		return mv;
	}

	@RequestMapping("goto_spu_add")
	public String goto_spu_add() {

		return "manager_spu_add";
	}

	@RequestMapping("goto_spu")
	public String goto_spu() {
		System.out.println("5");
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				for (int i = 0; i < 100; i++) {
					try {
						Thread.sleep(10);
						System.out.println("555555");
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}).start();
		return "manager_spu";
	}

}
