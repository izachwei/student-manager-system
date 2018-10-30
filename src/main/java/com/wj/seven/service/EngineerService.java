package com.wj.seven.service;

import com.sun.xml.internal.ws.api.pipe.Engine;
import com.wj.seven.common.domain.Engineer;


import java.util.List;

public interface EngineerService {

    /**
     * 查询所有工程师
     * @return
     */
    List<Engineer> findAll();

    void addEngineer(Engineer enginner);

    void deleteEngineer(Engineer enginner);

    void updateEnginner(Engineer enginner);
}
