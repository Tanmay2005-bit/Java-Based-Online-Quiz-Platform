/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import util.DBConnection;

@WebServlet("/quizResults")
public class QuizResultsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int quizId = Integer.parseInt(request.getParameter("quizId"));
        int score = Integer.parseInt(request.getParameter("score"));

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");

        try (Connection conn = DBConnection.getConnection()) {

            // Fetch total questions
            String countSql = "SELECT COUNT(*) FROM questions WHERE quiz_id = ?";
            PreparedStatement ps = conn.prepareStatement(countSql);
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();

            int totalQuestions = 0;
            if (rs.next()) totalQuestions = rs.getInt(1);

            request.setAttribute("quizId", quizId);
            request.setAttribute("score", score);
            request.setAttribute("totalQuestions", totalQuestions);

            request.getRequestDispatcher("quiz-results.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("quiz-results.jsp?error=1");
        }
    }
}
