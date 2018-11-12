import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class AlbumTest extends BaseTest{
    @Autowired
    private AlbumService albumService;
    @Test
    public void test1(){
        List<Album> all = albumService.findAll();
        System.out.println(all);

    }

    @Test
    public void save(){
        Album album = new Album();
        album.setAuthor("dfgdf");
        album.setBrief("我i的非官方的价格");
        album.setBroadCast("感到反感");
        album.setPublishDate(new Date());
        album.setCoverImg("sdfsd");
        album.setScore("10");
        album.setTitle("fdgfd");

        albumService.add(album);

    }
}
