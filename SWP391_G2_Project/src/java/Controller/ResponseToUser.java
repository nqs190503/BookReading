/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Admin_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class ResponseToUser extends HttpServlet {

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
            out.println("<title>Servlet ResponseToUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResponseToUser at " + request.getContextPath() + "</h1>");
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
        int userId = Integer.parseInt(request.getParameter("userID"));
        String report = request.getParameter("report");
        String feedback = request.getParameter("feedback");
        request.setAttribute("userID", userId);
        if (feedback != null&&report==null) {
            request.setAttribute("feedback", Integer.parseInt(feedback));
            request.getRequestDispatcher("Response.jsp").forward(request, response);
        }
        else if (report!=null&&feedback==null){
            request.setAttribute("report", Integer.parseInt(report));
            request.getRequestDispatcher("Response.jsp").forward(request, response);
        }
        else{
            request.getRequestDispatcher("Response.jsp").forward(request, response);
        }
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
        Admin_DAO dao = new Admin_DAO();
        int userID = Integer.parseInt(request.getParameter("userID"));
        String report = request.getParameter("report");
        String feedback = request.getParameter("feedback");

        String title = request.getParameter("title");
        String detail = request.getParameter("detail");
        if (report == null&& feedback==null) {
            if (detail.isEmpty() || title.isEmpty()) {
                request.setAttribute("userID", userID);
                request.setAttribute("mess", "Vui lòng nhập toàn bộ thông tin");
                request.getRequestDispatcher("Response.jsp").forward(request, response);

            } else {
                dao.sendResponse(userID, title, detail);
                response.sendRedirect("viewreport");
            }
        } else {
            if (detail.isEmpty() || title.isEmpty()) {
                request.setAttribute("report", report);
                request.setAttribute("feedback", feedback);
                request.setAttribute("userID", userID);
                request.setAttribute("mess", "Vui lòng nhập toàn bộ thông tin");
                request.getRequestDispatcher("Response.jsp").forward(request, response);

            } else {
                if (report!=null) {

                    dao.sendResponse(userID, title, detail);
                    dao.deleteAfterResponse("Report", "ReportId", Integer.parseInt(report));
                    response.sendRedirect("viewreport");
                }
                else if (feedback!=null){

                    dao.sendResponse(userID, title, detail);
                    dao.deleteAfterResponse("Feedback", "FeedbackId", Integer.parseInt(feedback));
                    response.sendRedirect("viewfeedback");
                }
                
                
            }
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
