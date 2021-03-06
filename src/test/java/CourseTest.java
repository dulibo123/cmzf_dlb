import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CourseTest extends BaseTest {
    @Autowired
    private CourseService courseService;
    @Test
    public void test(){
        List<Course> byPage = courseService.findByPage(1, 2);
        for (Course course : byPage) {
            System.out.println(course);
        }
    }
}
