package com.wj.seven.controller;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.wj.seven.common.domain.Clazz;
import com.wj.seven.common.domain.Student;
import com.wj.seven.common.domain.User;
import com.wj.seven.common.util.IdGenerator;
import com.wj.seven.common.util.excel.ImportExcel;
import com.wj.seven.dao.UserMapper;
import com.wj.seven.service.ClazzService;
import com.wj.seven.service.StuService;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/stu")
public class StuController {

    @Autowired
    private StuService stuService;

    @Autowired
    private ClazzService clazzService;
    @RequestMapping("importStuUI")
    public String importStuUI(String clazzId , Model model){
        model.addAttribute("clazzId",clazzId);
        return "/stu/importStuUI";
    }

    @RequestMapping("unlockStudent")
    @ResponseBody
    public Object unlockStudent(Student student){
        Map<String,Object> map = new HashMap<>();
        try {
            stuService.unlockStu(student);
            map.put("msg","用户已解锁！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("msg","解锁用户失败，请重试！");
        }finally {
            return map;
        }
    }
    @RequestMapping("lockStudent")
    @ResponseBody
    public Object lockStudent(Student student){
        Map<String,Object> map = new HashMap<>();
        try {
            stuService.lockStu(student);
            map.put("msg","用户已解锁！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("msg","解锁用户失败，请重试！");
        }finally {
            return map;
        }
    }

    @RequestMapping("addStudent")
    @ResponseBody
    public Object addStudent(Student student){
        Map<String,Object> map = new HashMap<>();
        try {
            System.out.println(student);
            student.setStudentId(IdGenerator.uuid());
            stuService.addStu(student);
            map.put("msg","在“"+student.getStudentClazzName()+"”添加学生成功！");
            map.put("result",true);
        }catch (Exception e){
            if(e instanceof DuplicateKeyException){
                map.put("msg","学生学号已存在！");
            }else {
                map.put("msg","添加学生失败，请重试！");
            }
            e.printStackTrace();
            map.put("result",false);
        }finally {
            return map;
        }
    }

    /**
     * 删除学员
     * @param studentId-->班级主键
     * @return
     */
    @RequestMapping("delStudent")
    @ResponseBody
    public Object delStudent(String studentId){
        Map<String,Object> map = new HashMap<>();
        try{
            stuService.delStu(studentId);
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


    @RequestMapping("updateStudentUI")
    public String updateStudentUI(String studentId,Model model){
        try {
            Student student = stuService.findByStudentId(studentId);
            model.addAttribute("studentUd",student);
            return "/stu/updateStudent";
        }catch (Exception e){
            e.printStackTrace();
            return "error";
        }
    }
    @RequestMapping("findStuByClazzId")
    public String findStuByClazzId(String stuClazzId, Model model){
        try {
            List<Student> students = stuService.findAllByClazzId(stuClazzId);
            Clazz clazz = clazzService.findClazzById(stuClazzId);
            model.addAttribute("students",students);
            model.addAttribute("clazz",clazz);
            return "/stu/showStudent";
        }catch (Exception e){
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping("downloadmd")
    public ResponseEntity<byte[]> downloadmd(HttpSession session){
        String fileName = "学员信息导入数据_模板.xlsx";
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(session.getServletContext().getRealPath("/WEB-INF/base_files/" + fileName));
            byte[] bs = new byte[fileInputStream.available()];
            fileInputStream.read(bs);
            fileName = new String(fileName.getBytes("GBK"), "ISO-8859-1");//防止中文乱码
            HttpHeaders headers = new HttpHeaders();//设置响应头
            headers.add("Content-Disposition", "attachment;filename=" + fileName);
            HttpStatus statusCode = HttpStatus.OK;//设置响应吗
            ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(bs, headers, statusCode);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("uploaderFile")
    @ResponseBody
    public Object uploaderFile(@RequestParam("file") MultipartFile multipartFile, String clazzId){

        Map<String,Object> map = new HashMap<>();
        List<String[]> lists = null;
        List<Student> students = null;
        try {
            lists  =  parseMultipartFile(multipartFile);
            students  = new ArrayList<>();
            String clazzName = clazzService.findClazzById(clazzId).getClazzName();
            for (int i = 1; i <lists.size() ; i++) {
                String[] row =  lists.get(i);
                Student student = new Student(IdGenerator.uuid(),row[2],
                        row[3].trim().equals("男")?1:0,row[4],row[6],row[7],row[5],row[1],clazzName,clazzId);
                students.add(student);
            }
            int count = stuService.insertListStu(students,clazzId);
            map.put("success",true);
            map.put("updateCount",count);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            System.out.println(e);
            if(e instanceof DuplicateKeyException){
                map.put("msg","文件信息错误，表中学生学号已存在！");
            }else {
                map.put("msg", "服务器拉闸，请重试！");
            }
        }finally {
            return map;
        }
    }


    /**
     *  根据 上传的Excel 文件 分析成字符串
     * @param multipartFile
     * @return
     */
    private List<String[]> parseMultipartFile(MultipartFile multipartFile){
        List<String[]> all = new ArrayList<>();
        try{
            ImportExcel ei= new ImportExcel(multipartFile, 0,0);
            StringBuilder eachRow=new StringBuilder();
            outter:for (int i = ei.getDataRowNum(); i < ei.getLastDataRowNum(); i++) {
                Row row = ei.getRow(i);
                String[] rowArr = new String[ei.getLastCellNum()];
                for (int j = 0; j < ei.getLastCellNum(); j++) {
                    if((ei.getCellValue(row,1)+"").trim().length()<=0){
                        continue outter;
                    }
                    Object val = ei.getCellValue(row,j);
                    if(val instanceof Double){//double 类型的数字，去掉 .00
                        double d = (Double) val;
                        val = (int)d;
                    }
                    rowArr[j] =String.valueOf(val).trim();
                }
                all.add(rowArr);
            }
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return all.size()>0?all:null;
    }

}
