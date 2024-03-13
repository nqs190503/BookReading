/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.Book_DAO;
import DAO.User_DAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ReportBook extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReportBook</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportBook at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Book_DAO dao = new Book_DAO();
        User u = (User) request.getSession().getAttribute("user");
        List<Model.Category> cate = dao.loadAllCategory();
        int bookid = Integer.parseInt(request.getParameter("bookId"));
        request.setAttribute("bookid", bookid);
        if (u==null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        else{
            request.getRequestDispatcher("Report.jsp").forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        User_DAO dao = new User_DAO();
        int bookid = Integer.parseInt(request.getParameter("bookid"));
        request.setAttribute("bookid", bookid);
        String chapter =request.getParameter("chapter");
        int reportType = Integer.parseInt(request.getParameter("report"));
        //Kiem tra reportType va chapter 
        if (reportType==0||chapter.isEmpty()) {
            request.setAttribute("reportError", "Yêu cầu điền (chọn) đầy đủ thông tin");
            request.getRequestDispatcher("Report.jsp").forward(request, response);
        }
        User u = (User) request.getSession().getAttribute("user");
        if (reportType==5) {
            String detail = request.getParameter("detail");
            //kiem tra detail
            if (detail.isEmpty()) {
                request.removeAttribute("reportError");
                request.setAttribute("reportError", "Hãy nhập vấn đề của bạn");
                request.getRequestDispatcher("Report.jsp").forward(request, response);
            }
            else{
                dao.sendReport(u.getUserID(), bookid, reportType, Integer.parseInt(chapter), detail);
            }
        }else{
            dao.sendReport(u.getUserID(), bookid, reportType, Integer.parseInt(chapter), null);
        }
        response.sendRedirect("book?bookID="+bookid);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
