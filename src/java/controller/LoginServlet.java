/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import model.User;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email);

        if (user != null && user.getPassword().equals(pass)) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect based on role
            switch (user.getRole()) {
                case "ADMIN":
                    response.sendRedirect("admin-dashboard.jsp");
                    break;
                case "QUIZ_CREATOR":
                    response.sendRedirect("creator-dashboard.jsp");
                    break;
                case "PARTICIPANT":
                    response.sendRedirect("participant-dashboard.jsp");
                    break;
            }

        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
