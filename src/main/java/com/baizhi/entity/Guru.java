package com.baizhi.entity;

public class Guru {
    private String id;
    private String title;
    private String headPic;
    private String gender;

    @Override
    public String toString() {
        return "Guru{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", headPic='" + headPic + '\'' +
                ", gender='" + gender + '\'' +
                '}';
    }

    public Guru(String id, String title, String headPic, String gender) {
        this.id = id;
        this.title = title;
        this.headPic = headPic;
        this.gender = gender;
    }

    public Guru() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
