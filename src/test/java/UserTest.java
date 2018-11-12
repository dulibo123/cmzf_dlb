import com.baizhi.dao.UserDAO;
import com.baizhi.entity.Guru;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import sun.misc.BASE64Encoder;


import java.util.Date;
import java.util.List;


public class UserTest extends BaseTest{

    @Autowired
    private UserService userService;
    @Test
    public void test(){
        User user1 = new User();
        user1.setUsername("嗡嗡");
        user1.setPassword("111111");
        User user = userService.find(user1);
        System.out.println(user);
    }

    @Test
    public void test2(){

        List<User> byPage = userService.findByPage(1, 2);
        for (User user : byPage) {
            System.out.println(user);
        }
        long total = userService.findTotal();
        System.out.println(total);
    }

    @Test
    public void register(){
        User user1 = new User();

        user1.setUsername("的广泛广泛的");
        user1.setPassword("123321");
        user1.setCity("haidoan");
        user1.setDate(new Date());
        user1.setGender("男");
        user1.setHeadPic("dgfdg");
        user1.setNickName("嗡嗡嗡");
        user1.setPhoneNum("12312321");
        user1.setProvince("sdfds");
        user1.setSalt("gfdgf");
        user1.setSign("sfgsdfds");
        user1.setStatus("启用");
        Guru guru = new Guru();
        guru.setId("3fab263c-9d18-4ed1-928b-5c73bb860df3");
        user1.setGuru(guru);
        userService.add(user1);

    }


    @Test
    public void update(){
        User user1 = new User();
        user1.setId("72bd3379-5f94-4bdd-bb95-29b0407bb6c4");
        user1.setUsername("嗡嗡嗡哇哇哇哇");
        user1.setPassword("666666");
        user1.setCity("关灯");
        user1.setDate(new Date());
        user1.setGender("男");
        user1.setHeadPic("dgfdg");
        user1.setNickName("嗡嗡嗡");
        user1.setPhoneNum("12312321");
        user1.setProvince("sdfds");
        user1.setSalt("gfdgf");
        user1.setSign("sfgsdfds");
        user1.setStatus("启用");
        userService.motify(user1);

    }
    @Test
    public void test45(){


        String password = "123456";
        System.out.println(DigestUtils.md5Hex(password));



    }
}
