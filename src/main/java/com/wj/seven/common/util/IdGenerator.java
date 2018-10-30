package com.wj.seven.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 生成ID 的工具类
 */
public class IdGenerator {

    private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddhhmm");

    /**
     * 获取ID 由时间与UUID组合
     * @return ID 32位
     */
    public static String uuid(){
        String rs = null;
        rs = UUID.randomUUID().toString().replace("-","").substring(11);
        rs = dateFormat.format(new Date())+"_"+ rs;
        return rs;
    }
}
