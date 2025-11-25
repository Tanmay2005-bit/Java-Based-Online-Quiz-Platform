/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package servlets;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException; // updated import
import jakarta.servlet.http.*; // updated import
import jakarta.servlet.annotation.WebServlet; // updated import

@WebServlet("/LoginServlet") // updated annotation
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(email, password);

        if (user == null) {
            response.sendRedirect("login.jsp?error=1");
            return;
        }

        // SUCCESS → store session
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        // role-based redirect
        switch (user.getRole()) {
            case "ADMIN":
                response.sendRedirect("admin-dashboard.jsp");
                break;

            case "QUIZ_CREATOR":
                response.sendRedirect("creator-dashboard.jsp");
                break;

            case "PARTICIPANT":
                response.sendRedirect("participant-home.jsp");
                break;

            default:
                response.sendRedirect("login.jsp?error=1");
        }
    }
}
