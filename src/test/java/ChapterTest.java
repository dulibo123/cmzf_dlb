import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

public class ChapterTest extends BaseTest {
    @Autowired
    private ChapterService chapterService;
    @Test
    public void addChapter(){
        Chapter chapter = new Chapter();
        Album album = new Album();
        album.setId("1");
        chapter.setAlbum(album);
        album.setPublishDate(new Date());
        chapter.setDownPath("dsfs");
        chapter.setDuration("10");
        chapter.setSize(10);
        chapter.setTitle("sdfds");
        chapter.setUploadDate(new Date());
        chapterService.add(chapter);
    }

    @Test
    public void test2(){
        String s="/back/album/music/佛教音乐-吉祥天母护法供赞.mp3";
        String[] a=s.split("/");
        for (int i=0;i<a.length;i++){
            System.out.println(i+"==="+a[i]);
        }
    }
}
