
import com.wj.seven.common.domain.Clazz;
import com.wj.seven.common.domain.Group;
import com.wj.seven.common.util.IdGenerator;
import com.wj.seven.service.ClazzService;
import com.wj.seven.service.GroupService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.annotation.ApplicationScope;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ApplicationScope()
@ContextConfiguration(locations={"classpath:config/spring-mvc.xml","classpath:config/spring-mybatis.xml"})
public class insertForClazz {

    @Autowired
    private ClazzService clazzService;

    @Autowired
    private GroupService groupService;

    @Test
    public void fun2() {
        Group group = new Group();
        group.setGroupId(IdGenerator.uuid());
        group.setGroupName("sss");
        groupService.addGroup(group);
    }

    @Test
    public void fun1(){
        for (int i = 0; i <50 ; i++) {
            Clazz clazz = new Clazz();
            clazz.setClazzId(IdGenerator.uuid());
            clazz.setClazzName("测试用户_"+i);
            clazz.setClazzStuCount((int)Math.random()*100);
            clazz.setClazzCreateTime(new Date());
            clazz.setClazzEndTime(new Date());
            clazz.setClazzStartTime(new Date());
            clazz.setClazzClazzRemark("测试");
            clazz.setClazzDirection(i%2==0?"大数据":"JAVA");
            clazz.setClazzEngineerId("SS");
            clazzService.addClazz(clazz);
        }


    }
}
