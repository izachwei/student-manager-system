
import com.wj.seven.dao.UserMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test1 {

    @Test
    public void fun1(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        UserMapper bean = ac.getBean(UserMapper.class);
//        bean.findUserByUserEmail("2");
    }
}
