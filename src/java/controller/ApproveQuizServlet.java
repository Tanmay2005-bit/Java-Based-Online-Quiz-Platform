/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;

@WebServlet("/approve-quiz")
public class ApproveQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect("approve-quizzes.jsp?error=missingId");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE quizzes SET approved = 1 WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));

            int updated = ps.executeUpdate();

            if (updated > 0) {
                response.sendRedirect("approve-quizzes.jsp?success=1");
            } else {
                response.sendRedirect("approve-quizzes.jsp?error=notfound");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("approve-quizzes.jsp?error=db");
        }
    }
}
