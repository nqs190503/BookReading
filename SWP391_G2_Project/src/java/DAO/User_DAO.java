/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.Book;
import Model.PayChapter;
import Model.Reading;
import Model.Report;
import Model.Response;
import Model.SavedBook;
import Model.User;
import jakarta.servlet.http.Part;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Vector;

/**
 *
 * @author ADMIN
 */
public class User_DAO {

    private Connection con;
    private String status = "ok";
    private List<User> user;
    PreparedStatement ps;
    ResultSet rs;

    public User_DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public void deleteVipTime(int userID) {
        String sql = "delete from VipTime where userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.execute();
        } catch (Exception e) {
        }
    }

    public boolean checkVipTime(int userID) {
        boolean b = true;
        String sql = "select * from VipTime where userID = ? and endDate < ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            rs = ps.executeQuery();
            while (rs.next()) {
                b = false;
            }
        } catch (Exception e) {
        }
        return b;
    }

    public User login(String username, String password) {
        String sql = "select * from [User] where [username] = ? and [password] = ? and roleID != 4";
        User u = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
            status = "error at login";
        }

        if (u != null) {
            if (!checkVipTime(u.getUserID())) {
                deleteVipTime(u.getUserID());
                sql = "update [User] set roleID = 1 where userID = ?";
                try {
                    ps = con.prepareStatement(sql);
                    ps.setInt(1, u.getUserID());
                    ps.execute();
                } catch (Exception e) {
                    status = "error at ";
                }
            }
        }
        return u;
    }

    public void logout() {
        user = null;
    }

    public boolean checkExistAcc(String username) {
        User u = null;
        String sql = "select * from [User] where username = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        if (u != null) {
            return true;
        }
        return false;
    }

    public boolean checkExistEmail(String email) {
        User u = null;
        String sql = "select * from [User] where email = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
            status = "error at checking exist email";
        }
        if (u != null) {
            return true;
        }
        return false;
    }

    public void resetPassword(String email, String pass) {
        String sql = "update [User] set [password] = ? where email = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.execute();
        } catch (Exception e) {
            status = "error at reset password";
        }
    }

    public String randomSentence() {
        String regex = "[A-Z0-9a-z]+{5}";
        char[] result = new char[6];
        Random rd = new Random();
        while (true) {
            for (int i = 0; i < 6; i++) {
                result[i] = (char) rd.nextInt(255);
            }
            String a = new String(result);
            if (a.matches(regex)) {
                return a;
            }
        }
    }

    public void register(String username, String password) {
        String sql = "insert into [User] values(?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, null);
            ps.setString(4, null);
            ps.setString(5, null);
            ps.setString(6, null);
            ps.setString(7, null);
            ps.setInt(8, 1);

            ps.execute();
        } catch (Exception e) {
        }
    }

    public boolean ChangePassword(String user_id, String user_pass) {
        String sql = "update [User] set [password] = ?\n"
                + "where [userID] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user_pass);
            ps.setString(2, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public User getAccountByID(int id) {
        String query = "select * from [User]\n"
                + "where userID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public String getUserAvatarByID(String userID) {
        String sql = "SELECT avatar FROM [User] WHERE userID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("avatar");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean UpdateUser(String uID, String email, String address, String phone, String avatar) {
        String query = "update [User]\n"
                + "set [email] = ?,\n"
                + "[address] = ?\n,"
                + "[phone] = ?\n,"
                + "[avatar] = ?\n"
                + "where userID = ?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, avatar);
            ps.setString(5, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public Reading checkReadingExist(int bookID, int userID) {
        Reading r = null;
        String sql = "select * from Reading where bookid = ? and userid = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookID);
            ps.setInt(2, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                r = new Reading(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getTimestamp(4));
            }
        } catch (Exception e) {

        }
        return r;
    }

    public void addReading(int userid, int bookid, int chapterid) {
        Reading r = checkReadingExist(bookid, userid);
        if (r != null) {
            String sql = "update Reading set chapterid = ?, readingDate = ? where userid = ? and bookid = ?";
            try {
                ps = con.prepareStatement(sql);
                ps.setInt(1, chapterid);
                ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
                ps.setInt(3, userid);
                ps.setInt(4, bookid);
                ps.execute();

            } catch (Exception e) {
                status = "error at update reading";
            }
        } else {
            String sql = "insert into Reading values(?,?,?,?)";
            try {
                ps = con.prepareStatement(sql);
                ps.setInt(1, userid);
                ps.setInt(2, bookid);
                ps.setInt(3, chapterid);
                ps.setDate(4, new Date(System.currentTimeMillis()));
                ps.execute();

            } catch (Exception e) {
                status = "error at insert reading";
            }
        }

    }

    public List<Book> getReadingList(int userID) {
        List<Book> reading = new Vector<Book>();
        String sql = "select b.*,c.ChapterName,c.ChapterID,r.readingDate "
                + "from Book b join Reading r on b.bookID = r.bookid "
                + "join Chapter c on c.ChapterID = r.chapterid "
                + "where r.userid = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                reading.add(new Book(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getTimestamp(12)));
            }
        } catch (Exception e) {

        }
        return reading;
    }

    public void sendReport(int userId, int bookId, int reportType, int chapter, String detail) {
        String sql = "insert into Report values(?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            ps.setInt(3, reportType);
            ps.setInt(4, chapter);
            ps.setString(5, detail);
            ps.execute();
        } catch (Exception e) {
            status = "error at send report";
        }
    }

    public boolean checkSavedBook(int userID, int bookID) {
        SavedBook s = null;
        String query = "select * from SavedBook where UserID=? and BookID=?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, bookID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            status = "error at save book";
        }
        return true;
    }

    public void saveBook(int userID, int bookID) {
        String query = "insert into SavedBook values (?,?)";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, bookID);
            ps.execute();
        } catch (Exception e) {
            status = "error at save book";
        }
    }

    public List<Book> getSaveBookByUserId(int userID) {
        List<Book> savebook = new Vector<Book>();
        String sql = "select b.* from SavedBook sv join Book b on sv.BookID = b.bookID\n"
                + "where sv.UserID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                savebook.add(new Book(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getDate(8), rs.getString(9)));
            }
        } catch (Exception e) {
        }

        return savebook;
    }

    public void DeleteSaveBook(int userID, int bookID) {
        String sql = "delete from SavedBook where UserID = ? and BookID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, bookID);
            ps.execute();
        } catch (Exception e) {
            status = "error at delete save book";
        }
    }

    public void saveDataDeletedAccount(String table, int userID) {
        String sql = "update " + table + " set userID = 11 where userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.execute();
        } catch (Exception e) {
            status = "error at save delete account in table" + table;
        }
    }

    public void deleteDataDeletedAccount(String table, int userID) {
        String sql = "delete from " + table + " where userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.execute();
        } catch (Exception e) {
            status = "error at delete data account in table" + table;
        }
    }

    public void deleteAccount(int userId) {
        saveDataDeletedAccount("Book", userId);
        saveDataDeletedAccount("Comment", userId);
        deleteDataDeletedAccount("SavedBook", userId);
        deleteDataDeletedAccount("Reading", userId);
        deleteDataDeletedAccount("Rate", userId);
        deleteDataDeletedAccount("DeletedUser", userId);
        deleteDataDeletedAccount("FeedBack", userId);
        deleteDataDeletedAccount("Report", userId);
        deleteDataDeletedAccount("PayChapter", userId);
        deleteDataDeletedAccount("Response", userId);
        deleteDataDeletedAccount("VipTime", userId);
        String sql = "delete from [User] where userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.execute();
        } catch (Exception e) {
            status = "error at delete account:" + userId;
        }
    }

    public void deleteAllAccount() {
        String sql = "select * from DeletedUser where toDate < ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            rs = ps.executeQuery();
            while (rs.next()) {
                deleteAccount(rs.getInt(1));
            }
        } catch (Exception e) {
        }
    }

    public void waitingForDelete(int userId) {
        String sql = "update [User] set roleId = 4 where userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.execute();
        } catch (Exception e) {
            status = "error at waiting for delete account";
        }
        sql = "insert into DeletedUser values(?,?,?)";
        Timestamp time = new Timestamp(System.currentTimeMillis());
        long threeHoursInMillis = 3 * 60 * 60 * 1000;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setTimestamp(2, time);
            ps.setTimestamp(3, new Timestamp(time.getTime() + threeHoursInMillis));
            ps.execute();
        } catch (Exception e) {
            status = "error at insert to deletedUser";
        }
    }

    public void buyChapter(int userId, int chapterId, int bookid) {
        String sql = "update [User] set [transaction] = ? where userID = ?";
        int a = getAccountByID(userId).getTransaction() - 2000;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, a);
            ps.setInt(2, userId);
            ps.execute();
        } catch (Exception e) {
            status = "error at buy chapter";
        }
        sql = "insert into PayChapter values (?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, chapterId);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.execute();
        } catch (Exception e) {
            status = "error at insert to paychapter";
        }
        Book_DAO dao = new Book_DAO();
        Book b = dao.getBookDetailById(bookid);
        sql = "update [User] set [transaction] = ? where userID = ?";
        a = getAccountByID(b.getCreator()).getTransaction() + 2000;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, a);
            ps.setInt(2, b.getCreator());
            ps.execute();
        } catch (Exception e) {
            status = "error at add money to creator";
        }
    }

    public List<PayChapter> getPayChapterByUserId(int userID) {
        List<PayChapter> paychapter = new Vector<PayChapter>();
        String sql = "select p.*,c.BookID,c.NumberChapter,c.ChapterName,b.title from PayChapter p join Chapter c on p.chapterId = c.ChapterID join Book b on c.BookID = b.bookID\n"
                + "where p.userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                paychapter.add(new PayChapter(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getTimestamp(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
            }
        } catch (Exception e) {
        }

        return paychapter;
    }

    public void updateAccToVip(int userId) {
        int a = getAccountByID(userId).getTransaction() - 30000;
        String sql = "update [User] set roleID = 2,[transaction] = ? where userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, a);
            ps.setInt(2, userId);
            ps.execute();
        } catch (Exception e) {
            status = "error at update Acc to vip";
        }
        sql = "insert into VipTime values(?,?,?)";
        Timestamp time = new Timestamp(System.currentTimeMillis());
        long threeHoursInMillis = 3 * 60 * 60 * 1000;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setTimestamp(2, time);
            ps.setTimestamp(3, new Timestamp(time.getTime() + threeHoursInMillis));
            ps.execute();
        } catch (Exception e) {
            status = "error at insert to VipTime table";
        }
    }

    public void Rate(int userId, int point, int bookid) {
        int p = getRatedPoint(userId, bookid);
        String sql = null;
        if (p < 0) {
            sql = "insert into Rate values (?,?,?)";
            try {
                ps = con.prepareStatement(sql);
                ps.setInt(1, bookid);
                ps.setInt(2, userId);
                ps.setInt(3, point);
                ps.execute();
            } catch (Exception e) {
                status = "error at insert rate";
            }
        } else {
            sql = "update Rate set point = ? where userID = ? and bookID = ?";
            try {
                ps = con.prepareStatement(sql);
                ps.setInt(1, point);
                ps.setInt(2, userId);
                ps.setInt(3, bookid);
                ps.execute();
            } catch (Exception e) {
                status = "error at update rate";
            }
        }

    }

    public int getRatedPoint(int userId, int bookId) {
        int x = -1;
        String sql = "select point from Rate where userID = ? and bookID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return x;
    }

    public List<Response> getMailBoxById(int userID) {
        List<Response> mailbox = new Vector<Response>();
        String sql = "select * from Response where userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                mailbox.add(new Response(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5)));
            }
        } catch (Exception e) {
            status = "error at get mailbox";
        }
        return mailbox;
    }

    public List<User> getListAccount() {
        List<User> user = new ArrayList<User>();
        String query = "select * from [User] order by roleID";
        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                user.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {

        }
        return user;
    }

    public void banComment(int userId, int reportType, String detail) {
        String sql = "insert into BanComment values(?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, reportType);
            ps.setString(3, detail);
            ps.execute();
        } catch (Exception e) {
            status = "error at send bAN";
        }
        sql = "update [User] set roleID=3 where userID=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.execute();
        } catch (Exception e) {
            status = "error at edit user";
        }
    }

    public void deleteBanComment(int userId) {
        String sql = "delete from BanComment where userID=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();

            sql = "update [User] set roleID=1 where userID=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();

        } catch (Exception e) {
            status = "error at send bAN";
        }
    }

    public void addAccount(String userName, String passWord, int roleID) {
        String sql = "insert into [User] values(?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, passWord);
            ps.setString(3, null);
            ps.setString(4, null);
            ps.setString(5, null);
            ps.setString(6, null);
            ps.setString(7, null);
            ps.setInt(8, roleID);
            ps.execute();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        User_DAO dao = new User_DAO();
        dao.banComment(1, 1, null);
        System.out.println(dao.status);
    }
}
