/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Book_DAO;
import DAO.User_DAO;
import Model.Book;
import Model.Chapter;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import static org.apache.coyote.http11.Constants.a;

/**
 *
 * @author admin
 */
public class Comment extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Book</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Book at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        HttpSession ses = request.getSession();

        //System.out.println("check session "+ses.getAttribute("bookid"));
//        System.out.println("check boook od in comment"+request.getParameter("bookID"));
        int bookid = Integer.parseInt(request.getParameter("bookID").toString());

//        int bookid = Integer.parseInt(request.getParameter("bookID"));
        User abc = (User) ses.getAttribute("user");
  
        if (abc != null) {
            int userid = abc.getUserID();
            String comment = request.getParameter("txt");
            if(comment == null || comment.trim().isEmpty()){
                 request.setAttribute("space", "Khong duoc de trong text");
                 ses.setAttribute("bookid", bookid);
                 request.getRequestDispatcher("book").forward(request, response);
            }else{
                 dao.addComment(bookid, userid, comment);
                 ses.setAttribute("bookid", bookid);
                  response.sendRedirect("book");
            }

           
        } else {
            request.setAttribute("mess", "Ban can phai dang nhap de binh luan");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }

//  System.out.println("check bookid" + bookid);
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
 processRequest(request, response);

//       String username = abc.getUserName();
//       String avatar = abc.getAvatar();
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
