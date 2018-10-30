package com.wj.seven.controller;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.wj.seven.common.domain.Engineer;

import com.wj.seven.service.EngineerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("engineer")
public class EngineerController {

    @Autowired
    private EngineerService engineerService;

    @RequestMapping("findAll")
    @ResponseBody
    public Object findAll(){
        Map<String,Object> map = new HashMap<>();
        try {
            List<Engineer> engineers = engineerService.findAll();
            map.put("success",true);
            map.put("engineers",engineers);
        }catch (Exception e){
            map.put("success",false);
            map.put("msg", "服务器拉闸");
        }

        return  map;
    }
}
