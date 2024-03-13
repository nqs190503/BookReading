
package Model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Comment {
    private int cmtid;
    private int bookid;
    private int userid;
    private String cmt;
    private Date date;
    private int like;
    private int reply;
    private String avatar;
    private String userName;
    public Comment() {
    }

    public Comment(int cmtid, int bookid, int userid, String cmt, Date date, int like, int reply, String avatar, String userName) {
        this.cmtid = cmtid;
        this.bookid = bookid;
        this.userid = userid;
        this.cmt = cmt;
        this.date = date;
        this.like = like;
        this.reply = reply;
        this.avatar = avatar;
        this.userName = userName;
    }

    public Comment(int cmtid, int bookid, int userid, String cmt, Date date, int like, int reply) {
        this.cmtid = cmtid;
        this.bookid = bookid;
        this.userid = userid;
        this.cmt = cmt;
        this.date = date;
        this.like = like;
        this.reply = reply;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getCmtid() {
        return cmtid;
    }

    public void setCmtid(int cmtid) {
        this.cmtid = cmtid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getReply() {
        return reply;
    }

    public void setReply(int reply) {
        this.reply = reply;
    }

    @Override
    public String toString() {
        return "Comment{" + "cmtid=" + cmtid + ", bookid=" + bookid + ", userid=" + userid + ", cmt=" + cmt + ", date=" + date + ", like=" + like + ", reply=" + reply + ", avatar=" + avatar + ", userName=" + userName + '}';
    }

    
}
   