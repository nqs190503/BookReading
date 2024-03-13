/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Report {
    private int reportId;
    private int userid;
    private int bookid;
    private int problem;
    private int chapter;
    private String detail;
    private String reportType;
    private String imgbook;
    private String title;
    private String userName;
    private int numberchapter;
    private String chaptername;
    private int userIdInBook;
    public Report() {
    }


//    public Report(int reportId, int userid, int bookid, int problem, int chapter, String detail, String reportType, String imgbook, String title, String userName, int numberchapter, String chaptername) {
//        this.reportId = reportId;
//        this.userid = userid;
//        this.bookid = bookid;
//        this.problem = problem;
//        this.chapter = chapter;
//        this.detail = detail;
//        this.reportType = reportType;
//        this.imgbook = imgbook;
//        this.title = title;
//        this.userName = userName;
//        this.numberchapter = numberchapter;
//        this.chaptername = chaptername;
//    }
    public Report(int reportId, int userid, int bookid, int problem, int chapter, String detail, String reportType, String imgbook, String title, String userName, int numberchapter, String chaptername, int userIdInBook) {
        this.reportId = reportId;
        this.userid = userid;
        this.bookid = bookid;
        this.problem = problem;
        this.chapter = chapter;
        this.detail = detail;
        this.reportType = reportType;
        this.imgbook = imgbook;
        this.title = title;
        this.userName = userName;
        this.numberchapter = numberchapter;
        this.chaptername = chaptername;
        this.userIdInBook = userIdInBook;
    }

    public int getUserIdInBook() {
        return userIdInBook;
    }

    public void setUserIdInBook(int userIdInBook) {
        this.userIdInBook = userIdInBook;
    }

    public int getNumberchapter() {
        return numberchapter;
    }

    public void setNumberchapter(int numberchapter) {
        this.numberchapter = numberchapter;
    }

    public String getChaptername() {
        return chaptername;
    }

    public void setChaptername(String chaptername) {
        this.chaptername = chaptername;
    }

    public int getReportId() {
        return reportId;
    }

    public void setReportId(int reportId) {
        this.reportId = reportId;
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

    public int getProblem() {
        return problem;
    }

    public void setProblem(int problem) {
        this.problem = problem;
    }

    public int getChapter() {
        return chapter;
    }

    public void setChapter(int chapter) {
        this.chapter = chapter;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getReportType() {
        return reportType;
    }

    public void setReportType(String reportType) {
        this.reportType = reportType;
    }

    public String getImgbook() {
        return imgbook;
    }

    public void setImgbook(String imgbook) {
        this.imgbook = imgbook;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    
}