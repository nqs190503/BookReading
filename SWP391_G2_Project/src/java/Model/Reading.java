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
public class Reading {
    private int userid;
    private int bookid;
    private int chapterid;
    private Timestamp readingDate;
    public Reading(int userid, int bookid, int chapterid, Timestamp readingDate) {
        this.userid = userid;
        this.bookid = bookid;
        this.chapterid = chapterid;
        this.readingDate = readingDate;
    }

    public Timestamp getReadingDate() {
        return readingDate;
    }

    public void setReadingDate(Timestamp readingDate) {
        this.readingDate = readingDate;
    }

    

    public int getChapterid() {
        return chapterid;
    }

    public void setChapterid(int chapterid) {
        this.chapterid = chapterid;
    }




    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }
    
}
