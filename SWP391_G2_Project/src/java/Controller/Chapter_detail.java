/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Book_DAO;
import DAO.User_DAO;
import Model.Book;
import Model.Category;
import Model.Chapter;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Chapter_detail extends HttpServlet {

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
            out.println("<title>Servlet Chapter</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Chapter at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        Book_DAO dao = new Book_DAO();
        int bookid = Integer.parseInt(request.getParameter("bookID"));
        int chapterid = Integer.parseInt(request.getParameter("chapterID"));
        Book b = dao.getBookDetailById(bookid);
        Chapter normalChapter = dao.getNormalChapterDetail(bookid, chapterid);
        List<Category> cate = dao.loadAllCategory();
        request.setAttribute("category", cate);
        request.setAttribute("book", b);

        User u = (User) request.getSession().getAttribute("user");

        if (normalChapter != null) {
            request.setAttribute("chapter", normalChapter);
//            request.getRequestDispatcher("Chapter.jsp").forward(request, response);
        } else {
            //xoa sau khi phan quyen
            if (u == null) {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            
            if (u.getRoldID() == 2 || u.getRoldID() == 0) {
                normalChapter = dao.vipAccount(bookid, chapterid);
                request.setAttribute("chapter", normalChapter);
            } else {
                Chapter vipChapter = dao.getPayedVipChapter(u.getUserID(), chapterid);
                if (vipChapter == null) {
                    request.setAttribute("vipChapterRequire_Chapter", chapterid);
                    request.setAttribute("vipChapterRequire_Book", bookid);
//                request.getRequestDispatcher("Chapter.jsp").forward(request, response);
                } else {
                    request.setAttribute("chapter", vipChapter);
//                request.getRequestDispatcher("Chapter.jsp").forward(request, response);
                }
            }
        }
        //Add view
        Cookie[] cookies = request.getCookies();
        Cookie c = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("addview".equals(cookie.getName())) {
                    c = cookie;
                    break;
                }
            }
        }

        // Nếu cookie không tồn tại hoặc đã hết hạn
        if (c == null || c.getMaxAge() == 0) {
            // Tăng giá trị view
            dao.AddView(bookid);
            // Tạo một cookie mới
            c = new Cookie("addview", "addview");
            // Thiết lập thời gian tồn tại của cookie là 5 giây
            c.setMaxAge(5);
            // Thêm cookie vào response
            response.addCookie(c);
        }
        //End Add View
        if (u != null) {
            User_DAO udao = new User_DAO();
            udao.addReading(u.getUserID(), bookid, chapterid);
        }
        request.getRequestDispatcher("Chapter.jsp").forward(request, response);
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
