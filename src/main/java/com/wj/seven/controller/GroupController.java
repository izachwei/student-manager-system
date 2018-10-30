package com.wj.seven.controller;

import com.wj.seven.common.domain.Clazz;
import com.wj.seven.common.domain.Group;
import com.wj.seven.service.ClazzService;
import com.wj.seven.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/group")
public class GroupController {

    @Autowired
    private  ClazzService clazzService;

    @Autowired
    private GroupService groupService;

    @RequestMapping("/randomGroupUI")
    public String randomGroupUI(String clazzId, Model model){
        Clazz clazz =clazzService.findClazzById(clazzId);
        model.addAttribute("clazz",clazz);
        return "/group/randomGroupUI";
    }


    @RequestMapping("/findGroupByClazzId")
    public String findGroupByClazzId(String clazzId, Model model){
        List<Group> groups = groupService.findGroupByClazzId(clazzId);
        model.addAttribute("groups",groups);
        return "/group/showGroup";
    }
}
