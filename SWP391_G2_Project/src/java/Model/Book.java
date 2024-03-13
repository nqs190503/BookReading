/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class Book {
    private int bookid;
    private int creator;
    private String author;
    private String title;
    private int views;
    private String detail;
    private String img;
    private Date publishDate;
    private String status;
    
    
   //use for get reading list
    
    private String chapterName;
    private int chapterId;
    private Timestamp readingDate;
    public Book(int bookid, int creator, String author, String title, int views, String detail, String img, Date publishDate, String status) {
        this.bookid = bookid;
        this.creator = creator;
        this.author = author;
        this.title = title;
        this.views = views;
        this.detail = detail;
        this.img = img;
        this.publishDate = publishDate;
        this.status = status;
    }

    public Book(int bookid, int creator, String author, String title, int views, String detail, String img, Date publishDate, String status, String chapterName, int chapterId, Timestamp readingDate) {
        this.bookid = bookid;
        this.creator = creator;
        this.author = author;
        this.title = title;
        this.views = views;
        this.detail = detail;
        this.img = img;
        this.publishDate = publishDate;
        this.status = status;
        this.chapterName = chapterName;
        this.chapterId = chapterId;
        this.readingDate = readingDate;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }

    public Timestamp getReadingDate() {
        return readingDate;
    }

    public void setReadingDate(Timestamp readingDate) {
        this.readingDate = readingDate;
    }

    
    
    
    
    
    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Book{" + "bookid=" + bookid + ", creator=" + creator + ", author=" + author + ", title=" + title + ", views=" + views + ", detail=" + detail + ", img=" + img + ", publishDate=" + publishDate + ", status=" + status + '}';
    }
    
}
