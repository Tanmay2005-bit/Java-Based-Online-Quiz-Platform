/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import util.DBConnection;

@WebServlet("/manageUsers")
public class ManageUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT id, name, email, role, status FROM users";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.id = rs.getInt("id");
                u.name = rs.getString("name");
                u.email = rs.getString("email");
                u.role = rs.getString("role");
                u.status = rs.getString("status");
                users.add(u);
            }

            request.setAttribute("users", users);
            request.getRequestDispatcher("manage-users.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage-users.jsp?error=1");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        String action = request.getParameter("action");

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "UPDATE users SET status=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            if ("block".equals(action)) ps.setString(1, "BLOCKED");
            else ps.setString(1, "ACTIVE");

            ps.setInt(2, userId);
            ps.executeUpdate();

            response.sendRedirect("manageUsers?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageUsers?error=1");
        }
    }

    public static class User {
        public int id;
        public String name, email, role, status;
    }
}
