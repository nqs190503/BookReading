/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Book_DAO;
import DAO.User_DAO;
import Model.Book;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.List;

/**
 *
 * @author TTT
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class UpdateProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("Profile.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static final String UPLOAD_DIR = "images";

    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        //processRequest(request, response);
//        User_DAO dao = new User_DAO();
//        String uid = request.getParameter("userID");
//        String email = request.getParameter("email");
//        String phonenumber = request.getParameter("phone");
//        String address = request.getParameter("address");
//        //String avatar = request.getParameter("avatar");
//        String dbFileName = dao.getUserAvatarByID(uid);
//        Part part = request.getPart("file");
//        String fileName = extractFileName(part);
//        String applicationPath = getServletContext().getRealPath("");
//        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
//        System.out.println("applicationPath:" + applicationPath);
//        File fileUploadDirectory = new File(uploadPath);
//        if (!fileUploadDirectory.exists()) {
//            fileUploadDirectory.mkdirs();
//        }
//        String savePath = uploadPath + File.separator + fileName;
//        System.out.println("savePath: " + savePath);
//        String sRootPath = new File(savePath).getAbsolutePath();
//        System.out.println("sRootPath: " + sRootPath);
//        //part.write(savePath + File.separator);
//        File fileSaveDir1 = new File(savePath);
//        dbFileName = UPLOAD_DIR + File.separator + fileName;
//        //part.write(savePath + File.separator);
//        boolean updateprofile = dao.UpdateUser(uid, email, address, phonenumber, dbFileName);
//        if (updateprofile) {
//            User user = dao.getAccountByID(uid);
//            request.getSession().setAttribute("user", user);
//            response.sendRedirect("profile");
//            return;
//        } else {
//            // Trường hợp đổi mật khẩu không thành công
//            request.setAttribute("mess", "Failed to Update Profile. Please try again.");
//            request.getRequestDispatcher("Profile.jsp").forward(request, response);
//        }
//
//        request.getRequestDispatcher("Profile.jsp").forward(request, response);
//    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User_DAO dao = new User_DAO();
        String uid = request.getParameter("userID");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phone");
        String address = request.getParameter("address");

        // Kiểm tra xem người dùng đã chọn tệp tin mới hay không
        Part part = request.getPart("file");
        String dbFileName = "";
        if (part.getSize() > 0) { // Nếu người dùng đã chọn tệp tin mới
            String fileName = extractFileName(part);
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath = uploadPath + File.separator + fileName;
            part.write(savePath + File.separator);
            dbFileName = UPLOAD_DIR + File.separator + fileName;
        } else { // Nếu không có tệp tin mới, sử dụng ảnh hiện có từ cơ sở dữ liệu
            dbFileName = dao.getUserAvatarByID(uid);
        }

        // Tiến hành cập nhật thông tin người dùng
        boolean updateprofile = dao.UpdateUser(uid, email, address, phonenumber, dbFileName);
        if (updateprofile) {
            User user = dao.getAccountByID(Integer.parseInt(uid));
            request.getSession().setAttribute("user", user);
            response.sendRedirect("profile");
            return;
        } else {
            // Trường hợp cập nhật không thành công
            request.setAttribute("mess", "Failed to Update Profile. Please try again.");
            request.getRequestDispatcher("Profile.jsp").forward(request, response);
        }
    }

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
