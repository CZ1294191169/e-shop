package cn.edu.cuit.ssm.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.cuit.ssm.entity.Goods;
import cn.edu.cuit.ssm.entity.Order;
import cn.edu.cuit.ssm.entity.User;
import cn.edu.cuit.ssm.service.GoodsService;
import cn.edu.cuit.ssm.service.OrderService;

@Controller
public class UsergoodsController {

	@Autowired
	private GoodsService goodsService;

	@Autowired
	private OrderService orderService;

	@RequestMapping("/usergoods")
	public String list(Model model, @RequestParam(required = false, defaultValue = "1") int pageNum,
			HttpSession session) {
		PageInfo<Goods> ls = goodsService.findAll(pageNum, 4);
		model.addAttribute("ls", ls);

		model.addAttribute("user", (User) session.getAttribute("user"));
		return "client";
	}

	@RequestMapping("/addcart")
	@ResponseBody
	public Map<String, Object> addCart(Model model, @RequestParam("name") String name, @RequestParam("gid") String gid,
			@RequestParam("num") String num, HttpSession session) {

		Map<String, Object> modelmap = new HashMap<>();
		System.out.println(name);
		System.out.println(gid);
		System.out.println(num);
		Order o = new Order();
		o.setName(name);
		o.setGid(Integer.parseInt(gid));
		o.setNum(Integer.parseInt(num));
		try {
			System.out.println("flag =");
			boolean flag = orderService.insertCart(name, Integer.parseInt(gid), Integer.parseInt(num));
			System.out.println("flag = "+flag);
			if (flag) {
				modelmap.put("success", true);
			} else {
				modelmap.put("success", false);
			}
		} catch (Exception e) {
			// TODO: handle exception
			modelmap.put("success", false);
		}

		return modelmap;
	}

	@RequestMapping("/cart")
	public String cart(Model model,@RequestParam("name") String name) {
		System.out.println(name);
		double sum = 0.0;
		List<Order> list = orderService.findOrder(name);
		List<Goods> goodlist = new ArrayList<>();
		System.out.println("!!1");
		
		for(int i=0;i<list.size();i++)
		{
			System.out.println(list.get(i).getGid());
			Goods good = goodsService.findBygoodId(list.get(i).getGid());
			good.setNum(list.get(i).getNum());
			
			
			goodlist.add(good);		
		}
		for(int i=0;i<goodlist.size();i++)
		{
			sum+=goodlist.get(i).getNum()*goodlist.get(i).getPrice();
		}
		model.addAttribute("goodlist", goodlist);
		model.addAttribute("sum", sum);
		return "cart";

	}

}