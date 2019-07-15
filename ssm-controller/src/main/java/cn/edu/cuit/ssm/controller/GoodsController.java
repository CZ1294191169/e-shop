package cn.edu.cuit.ssm.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;

import cn.edu.cuit.ssm.entity.Goods;
import cn.edu.cuit.ssm.entity.User;
import cn.edu.cuit.ssm.service.GoodsService;
@Controller
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
    @RequestMapping("/goodsList")
	public String list(Model model,@RequestParam(required=false,defaultValue="1") int pageNum,HttpSession session) {
		PageInfo<Goods> ls = goodsService.findAll(pageNum,4);
		model.addAttribute("ls", ls);
		
		model.addAttribute("user",(User)session.getAttribute("user"));
		return "goodList";
	}
    
    @RequestMapping("/fuzzySearch")
    @ResponseBody
    public Map<String,Object> search(@RequestParam("condition")String condition,Model model)
    {
    	Map<String,Object> modelmap = new HashMap<>();
    	System.out.println("ss"+condition);
    	
    	try {
    		List<Goods> goodslist = goodsService.fuzzysearch(condition);
    		for(int i=0;i<goodslist.size();i++) {
    			System.out.println(goodslist.toString());
    			
    		}
    		
    		modelmap.put("goodlist", goodslist);
    		System.out.println(goodslist.size());
    		modelmap.put("success", true);
    	}catch(Exception e){
    		modelmap.put("success", false);
    	}
    	
    	return modelmap;
    }
    @RequestMapping(value = "/insertShop",method = RequestMethod.POST)
    @ResponseBody
    private Map<String,Object> insert(@RequestParam("name") String name,
    		@RequestParam("price") String price,
    		@RequestParam("num") String num,HttpServletRequest request) throws IOException{

        Map<String, Object> modelMap = new HashMap<String ,Object>();
        
       // String s =  request.getParameter("good");
        //System.out.println("test"+s);
        
//        ObjectMapper mapper = new ObjectMapper();
//        Goods gd = new Goods();
//        try{
//            gd = mapper.readValue(s,Goods.class);
//        }catch (Exception e)
//        {
//            modelMap.put("success",false);
//           
//            //e.printStackTrace();
//           
//        }
        //获取图片信息
        CommonsMultipartFile Img = null;
        CommonsMultipartResolver resolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());//获取上传文件
        if(resolver.isMultipart(request))
        {
           // MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        	 MultipartResolver resolver1 = new CommonsMultipartResolver(request.getSession().getServletContext());

             MultipartHttpServletRequest multipartRequest = resolver1.resolveMultipart(request);
            Img = (CommonsMultipartFile)multipartRequest.getFile("img");
           
            System.out.println(Img.getOriginalFilename());
            File file = new File("/Users/chenz/Desktop/ssm-parent/ssm-controller/src/main/webapp/WEB-INF/static/images/"+Img.getOriginalFilename());
           Img.transferTo(file);
           
           
           
        }
        else
        {
           
            modelMap.put("errMsg","图片上传为空");
           
        }

    	Goods good  = new Goods();
    	
    	good.setName(name);
    	//System.out.println(gd.getName());
    	good.setNum(Integer.parseInt(num));
    	//System.out.println(gd.getNum());
    	good.setPrice(Integer.parseInt(price));
    	good.setType(1);
    	good.setImg(Img.getOriginalFilename());
    	
    	
    	try {
    	boolean flag = goodsService.insertGoods(good);
    	if(flag)
    	{
    		modelMap.put("success", true);
    	}
    	else
    	{
    		modelMap.put("success", false);
    	}
    	}catch(Exception e) {
    		modelMap.put("success", false);
    	}
        return modelMap;
    }
    
    @RequestMapping("/deleteGood")
    @ResponseBody
    public Map<String,Object> deleteGood(@RequestParam("id")String id)
    {
    	Map<String,Object> modelmap = new HashMap<>();
    	//System.out.println(id);
    	
    	try {
    		boolean flag = goodsService.deleteGoods(Integer.parseInt(id));
    		if(flag) {
    			modelmap.put("success", true);
    		}else {
    			modelmap.put("success", false);
    		}
    		
    	}catch(Exception e) {
    		modelmap.put("success", false);
    	}
    	
    	
    	return modelmap;
    }
    
    @RequestMapping("/initgoods")
	@ResponseBody
	public Map<String,Object> ModifyGood(@RequestParam("id") String id)
	{
    	 Map<String, Object> modelmap = new HashMap<String ,Object>();
    	// System.out.println(id);
    	 
    	 try {
    	 Goods good = goodsService.findBygoodId(Integer.parseInt(id));
    	 modelmap.put("success", true);
    	 modelmap.put("good", good);
    	 }catch (Exception e) {
			// TODO: handle exception
    		 modelmap.put("success", false);
		}
    	 
    	 
    	 
    	 
    	 return modelmap;
	}
    @PostMapping("/updateGoods")
	@ResponseBody
	public Map<String,Object> ModifyGood(HttpServletRequest request,@RequestParam("id") String id,
			@RequestParam("name") String name,
    		@RequestParam("price") String price,
    		@RequestParam("num") String num) throws IllegalStateException, IOException
	{
    	Map<String, Object> modelMap = new HashMap<String ,Object>();
        
        //String s =  request.getParameter("good");
        
       // System.out.println("!!!!!");
        
        
        Goods g = goodsService.findBygoodId(Integer.parseInt(id));
        
       // ObjectMapper mapper = new ObjectMapper();
        //Goods gd = new Goods();
//        try{
//            gd = mapper.readValue(s,Goods.class);
//        }catch (Exception e)
//        {
//            modelMap.put("success",false);
//           
//            //e.printStackTrace();
//           
//        }
        //获取图片信息
        CommonsMultipartFile Img = null;
        CommonsMultipartResolver resolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());//获取上传文件
        if(resolver.isMultipart(request))
        {
            //MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
            MultipartResolver resolver1 = new CommonsMultipartResolver(request.getSession().getServletContext());

          MultipartHttpServletRequest multipartRequest = resolver1.resolveMultipart(request);
            
            Img = (CommonsMultipartFile)multipartRequest.getFile("img");
           
            //System.out.println(Img.getOriginalFilename());
            if(Img!=null) {
            File file = new File("/Users/chenz/Desktop/ssm-parent/ssm-controller/src/main/webapp/WEB-INF/static/images/"+Img.getOriginalFilename());
           Img.transferTo(file);
            }
           
           
           
        }
        else
        {
           
            modelMap.put("errMsg","图片上传为空");
           
        }

    	Goods good  = new Goods();
    	
    	good.setName(name);
    	//System.out.println(good.getName());
    	good.setNum(Integer.parseInt(num));
    	//System.out.println(good.getNum());
    	good.setPrice(Integer.parseInt(price));
    	good.setType(1);
    	
    	if(Img!=null)
    	{
    	good.setImg(Img.getOriginalFilename());
    	}
    	else {
    		good.setImg(g.getImg());
    	}
    	
    	
    	
    	try {
    		
    	boolean flag = goodsService.modifuGoods(good.getName(),
    											good.getPrice(),
    											good.getNum(),
    											good.getImg(),
    											Integer.parseInt(id));
    	if(flag)
    	{
    		modelMap.put("success", true);
    	}
    	else
    	{
    		modelMap.put("success", false);
    	}
    	}catch(Exception e) {
    		modelMap.put("success", false);
    	}
        return modelMap;
	}
}
