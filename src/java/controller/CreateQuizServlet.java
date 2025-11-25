/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import util.DBConnection;

@WebServlet("/createQuiz")
public class CreateQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("createQuiz.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        if (title == null || description == null
                || title.trim().isEmpty() || description.trim().isEmpty()) {
            response.sendRedirect("createQuiz.jsp?error=missingfields");
            return;
        }

        title = title.trim();
        description = description.trim();

        int quizId = -1;

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "INSERT INTO quizzes (title, description) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, title);
            ps.setString(2, description);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    quizId = rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("createQuiz.jsp?error=db");
            return;
        }

        if (quizId != -1) {
            // ⭐ Redirect directly to add questions page with quizId
            response.sendRedirect("add-question.jsp?quizId=" + quizId + "&success=quizCreated");
        } else {
            response.sendRedirect("createQuiz.jsp?error=failed");
        }
    }
}
