import com.baizhi.entity.Admin;
import com.baizhi.entity.Guru;
import com.baizhi.service.AdminService;
import com.baizhi.service.GuruService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class AdminTest extends BaseTest{
    @Autowired
    private AdminService adminService;
    @Autowired
    private GuruService guruService;
    @Test
    public void login(){
        Admin admin1 = new Admin();
        admin1.setUsername("张三");
        admin1.setPassword("123123");
        Admin admin = adminService.find(admin1);
        System.out.println(admin);
    }

    @Test
    public void update(){
        Admin admin = new Admin();
        admin.setId("1");
        admin.setPassword("123456");
        adminService.motify(admin);
    }


    @Test
    public void update1(){
        List<Guru> byPage = guruService.findByPage(1, 2);
        for (Guru guru : byPage) {
            System.out.println(guru);
        }
    }
}
