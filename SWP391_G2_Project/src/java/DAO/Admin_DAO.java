/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.Feedback;
import Model.Report;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Admin_DAO {

    private Connection con;
    private String status = "ok";
    PreparedStatement ps;
    ResultSet rs;

    public Admin_DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }
public void editRole(int roleID, int userId) {
        String query = "update [User]\n"
                + "set [roleID] = ?\n"
                + "where userID = ?";

        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, roleID);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Report> ViewAllReport() {
        List<Report> list = new ArrayList<>();
        String query = "select r.*,t.reportType, b.img,b.title, u.userName,c.NumberChapter,c.ChapterName,b.userID from Report r\n"
                + "join ReportType t\n"
                + "on t.reportId = r.problem\n"
                + "join Book b\n"
                + "on b.bookID = r.bookId\n"
                + "join [User] u\n"
                + "on u.userID = r.userID join Chapter c on c.ChapterID = r.chapter";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Report(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getString(12), rs.getInt(13)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Feedback> ViewAllFeedBack() {
        List<Feedback> list = new ArrayList<>();
        String query = "select f.*,rt.reportType,u.userName from Feedback f "
                + "left join [User] u on f.userID = u.userID "
                + "join ReportType rt on rt.reportId = f.problem";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
            status = "error at load feedback";
        }
        return list;
    }

    public void sendResponse(int userID, String title, String detail) {
        String sql = "insert into Response values (?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setString(2, title);
            ps.setString(3, detail);
            ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            ps.execute();
        } catch (Exception e) {
            status = "error at send response";
        }
    }

    public void deleteAfterResponse(String table, String column, int id) {
        String sql = "delete from " + table + " where " + column + " = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "error at delete" + table;
        }
    }

    public void restoreAccount(int userID) {
        String sql = "update [User] set roleID = 1 where userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.execute();
        } catch (Exception e) {
            status = "error at restore acc";
        }
        User_DAO dao = new User_DAO();
        dao.deleteDataDeletedAccount("DeletedUser", userID);
    }

    public static void main(String[] args) {
        Admin_DAO dao = new Admin_DAO();
        dao.deleteAfterResponse("Report", "ReportId", 4);
//System.out.println(dao.ViewAllFeedBack());
        System.out.println(dao.status);
    }
}
