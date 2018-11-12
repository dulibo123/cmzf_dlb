import com.baizhi.entity.Guru;
import com.baizhi.entity.Menu;
import com.baizhi.service.AdminService;
import com.baizhi.service.MenuService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MenuTest extends BaseTest{
    @Autowired
    private MenuService menuService;

    @Test
    public void test1(){
        List<Menu> all = menuService.findAll();
        for (Menu menu : all) {

            System.out.println(menu);
        }


    }
}
