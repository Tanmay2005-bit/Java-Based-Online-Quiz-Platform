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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String pass = request.getParameter("password").trim();
        String role = request.getParameter("role").trim().toUpperCase();

        System.out.println("Registration Attempt: ");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Role: " + role);

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(pass);

        // Make sure that only valid roles are set, since ENUM is case-sensitive in MySQL
        if (role.equals("ADMIN") || role.equals("QUIZ_CREATOR") || role.equals("PARTICIPANT")) {
            user.setRole(role);
        } else {
            System.out.println("Invalid role provided: " + role);
            response.sendRedirect("register.jsp?error=invalidrole");
            return;
        }

        UserDAO dao = new UserDAO();

        boolean added = dao.addUser(user);
        System.out.println("Add user returned: " + added);

        if (added) {
            response.sendRedirect("login.jsp?success=1");
        } else {
            response.sendRedirect("register.jsp?error=1");
        }
    }
}
