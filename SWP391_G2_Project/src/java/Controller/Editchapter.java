/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Book_DAO;
import Model.Chapter;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class Editchapter extends HttpServlet {

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
        Book_DAO dao = new Book_DAO();
        int chapterid = Integer.parseInt(request.getParameter("chapterid"));
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        request.setAttribute("bookID", bookID);
        request.setAttribute("chapterid", chapterid);
        Chapter chapternumber = dao.getchapterbynumber(chapterid);
        request.setAttribute("chapternumber", chapternumber);
        request.getRequestDispatcher("Editchapter.jsp").forward(request, response);
    }
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Book_DAO dao = new Book_DAO();
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        int chapterid = Integer.parseInt(request.getParameter("chapterid"));
        int numberchapter = Integer.parseInt(request.getParameter("numberchapter"));
        String namechapter = request.getParameter("namechapter");
        String content = request.getParameter("content");
        Chapter chapternumber = dao.getchapterbynumber(chapterid);
        dao.editchapter(chapterid, bookID, numberchapter, namechapter, content);
        response.sendRedirect("listchapter?bookID="+bookID);
        
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
