package com.wj.seven.controller;


import com.wj.seven.common.domain.Clazz;
import com.wj.seven.common.util.IdGenerator;
import com.wj.seven.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/clazz")
public class ClazzController {

    @Autowired
    private ClazzService clazzService;


    @RequestMapping(value = "findAll",method = RequestMethod.GET)
    public String findAll( Model model){
        try{
           List<Clazz> clazzes  =  clazzService.findAll();
           model.addAttribute("clazzes",clazzes);
           return "clazz/clazzManager";
        }catch (Exception e){
            e.printStackTrace();
          return "error";
        }
    }

    /**
     * 添加班级
     * @param clazz
     * @return
     */
    @RequestMapping("addClazz")
    @ResponseBody
    public Object addClazz(Clazz clazz){
        Map<String,Object> map = new HashMap<>();
        clazz.setClazzId(IdGenerator.uuid());
        try{
            clazzService.addClazz(clazz);
            map.put("result",true);
            map.put("msg","添加班级成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("result",true);
            map.put("msg","操作失败，服务器拉闸");
        }finally {
            return  map;
        }
    }

    /**
     * 更改用户信息
     * @param clazz
     * @return
     */
    @RequestMapping("updateClazz")
    @ResponseBody
    public  Object updateClazz(Clazz clazz){
        Map<String,Object> map = new HashMap<>();
        try{
            clazzService.updateClazz(clazz);
            map.put("result",true);
            map.put("msg","更改班级成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("result",true);
            map.put("msg","操作失败，服务器拉闸");
        }finally {
            return  map;
        }
    }
    /**
     *
     *  根据
     * @return
     */
    @RequestMapping(value = "updateClazzUI")
    public String updateClazzUI(String clazzId , Model model){
        try{
            Clazz clazz = clazzService.findClazzById(clazzId);
            model.addAttribute("clazzUd",clazz);
            return "clazz/updateClazz";
        }catch (Exception e){
            e.printStackTrace();
            return "error";
        }
    }


    /**
     * 班级学员随机分组
     * @param clazzId-->班级主键
     * @return
     */
    @RequestMapping("randomGroup")
    @ResponseBody
    public Object  randomGroup(String clazzId,String groupCount){
        Map<String,Object> map = new HashMap<>();
        try{
            System.out.println(groupCount);
            int grounCountToInt = Integer.parseInt(groupCount);
            clazzService.randomGroup(clazzId,grounCountToInt);
            map.put("result",true);
            map.put("msg","学员分组完成！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("result",true);
            map.put("msg","操作失败，服务器拉闸");
        }finally {
            return  map;
        }
    }

    /**
     * 删除班级
     * @param clazzId-->班级主键
     * @return
     */
    @RequestMapping("delClazz")
    @ResponseBody
    public Object addClazz(String clazzId){
        Map<String,Object> map = new HashMap<>();
        try{
            System.out.println(clazzId);
            clazzService.deleteClazzByClazzId(clazzId);
            map.put("result",true);
            map.put("msg","删除班级成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("result",true);
            map.put("msg","操作失败，服务器拉闸");
        }finally {
            return  map;
        }
    }


}
