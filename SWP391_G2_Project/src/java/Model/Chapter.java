/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Chapter {

    private int chapterid;
    private int bookid;
    private int numberchapter;
    private String chaptername;
    private String content_1;
    private String content_2;
    private String status;
    
    public Chapter(int chapterid, int bookid, int numberchapter, String chaptername, String content_1, String content_2) {
        this.chapterid = chapterid;
        this.bookid = bookid;
        this.numberchapter = numberchapter;
        this.chaptername = chaptername;
        this.content_1 = content_1;
        this.content_2 = content_2;
    }

    public Chapter(int chapterid, int bookid, int numberchapter, String chaptername, String content_1, String content_2, String status) {
        this.chapterid = chapterid;
        this.bookid = bookid;
        this.numberchapter = numberchapter;
        this.chaptername = chaptername;
        this.content_1 = content_1;
        this.content_2 = content_2;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
    public int getChapterid() {
        return chapterid;
    }

    public void setChapterid(int chapterid) {
        this.chapterid = chapterid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getChaptername() {
        return chaptername;
    }

    public void setChaptername(String chaptername) {
        this.chaptername = chaptername;
    }

    public String getContent_1() {
        return content_1;
    }

    public void setContent_1(String content_1) {
        this.content_1 = content_1;
    }

    public String getContent_2() {
        return content_2;
    }

    public void setContent_2(String content_2) {
        this.content_2 = content_2;
    }

    public int getNumberchapter() {
        return numberchapter;
    }

    public void setNumberchapter(int numberchapter) {
        this.numberchapter = numberchapter;
    }
    

    @Override
    public String toString() {
        return "Chapter{" + "chapterid=" + chapterid + ", bookid=" + bookid + ", chaptername=" + chaptername + ", content_1=" + content_1 + ", content_2=" + content_2 + '}';
    }

}
