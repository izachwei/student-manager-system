package com.wj.seven.service;



import com.wj.seven.common.domain.Clazz;

import java.util.List;

/**
 * 班级服务层接口
 */
public interface ClazzService {
    /**
     * 查询所有班级
     * @return 查询结果
     */
    public List<Clazz> findAll();

    /**
     * 根据主键查找班级
     * @param id
     * @return
     */
    public Clazz findClazzById(String id);

    /**
     * 添加班级
     * @param clazz
     */
    public void addClazz(Clazz clazz);

    /**
     * 通过主键删除班级
     * @param clazzId 班级id
     */
    public void deleteClazzByClazzId(String clazzId);

    /**
     * 更新班级
     * @param clazz
     */
    public void updateClazz(Clazz clazz);


    /**
     * 查询对应班级学员 后分组
     * @param clazzId
     * @param groupCount
     */
    void randomGroup(String clazzId, int groupCount);
}
