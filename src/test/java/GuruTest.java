import com.baizhi.entity.Guru;
import com.baizhi.entity.Menu;
import com.baizhi.service.GuruService;
import com.baizhi.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class GuruTest extends BaseTest {
    @Autowired
    private GuruService guruService;
    @Test
    public void test1(){
        List<Guru> all = guruService.findAll();
        for (Guru guru : all) {
            System.out.println(guru);
        }

    }


    @Test
    public void test2(){
        Guru guru = new Guru();
        guru.setId("3fab263c-9d18-4ed1-928b-5c73bb860df3");
        Guru guru1 = guruService.find(guru);
        System.out.println(guru1+"-----------");


    }
}
