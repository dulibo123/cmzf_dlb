import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class BannerTest extends BaseTest{
    @Autowired
    private BannerService bannerService;
    @Test
    public void find(){
        List<Banner> byPage = bannerService.findByPage(1, 1);
        for (Banner banner : byPage) {
            System.out.println(banner);
        }
    }

    @Test
    public void deleteAll(){
        String[] ids={"a1ae56fe-cef4-4762-a83e-d89d7763d7a0","bd3c8593-0295-405d-abc1-f95dcc20d3f7"};
        bannerService.removeAll(ids);

    }

    @Test
    public void update(){
        Banner banner = new Banner();
        banner.setId("f6816a47-1e81-4a0f-acc6-cd7a5bba36f6");
        banner.setImgPath("/back/banner/files/4.jpg");
        banner.setDescs("大师傅士大夫大师傅");
        banner.setStatus("y");
        banner.setTitle("规划局韩国");
        banner.setDate(new Date());
        bannerService.motify(banner);

    }

    @Test
    public void update1(){
        Banner banner = new Banner();
        banner.setId("b8f7a050-c9ae-442f-a483-c0c74d96c4ec");
        Banner banner1 = bannerService.find(banner);
        System.out.println(banner1);

    }
}
