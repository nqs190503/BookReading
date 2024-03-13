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
import java.util.List;

/**
 *
 * @author admin
 */
public class Addchapter extends HttpServlet {

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
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        request.setAttribute("bookID", bookID);
        Chapter numbernewchap = dao.Getnumbernewchap(bookID);
        request.setAttribute("numbernewchap", numbernewchap);
        request.getRequestDispatcher("Addchapter.jsp").forward(request, response);

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
        int numberchapter = Integer.parseInt(request.getParameter("numberchapter"));
            request.setAttribute("bookID", bookID);
        if (dao.checknumberchap(numberchapter,bookID)) {
            String namechapter = request.getParameter("namechapter");
            String content = request.getParameter("content");
            request.setAttribute("namechapter", namechapter);
            request.setAttribute("content", content);
            request.setAttribute("mess1", "Chương " + numberchapter + " đã có rồi.");            
            request.getRequestDispatcher("Addchapter.jsp").forward(request, response);
        } else {
            Chapter numbernewchap = dao.Getnumbernewchap(bookID);
            request.setAttribute("numbernewchap", numbernewchap);
            String namechapter = request.getParameter("namechapter");
            String content = request.getParameter("content");            
            dao.Addchapter(bookID, numberchapter, namechapter, content);
        response.sendRedirect("addchapter?bookID="+bookID);
        }

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
