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

@WebServlet("/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int quizId = Integer.parseInt(request.getParameter("quizId"));
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");   // participant ID

        int score = 0;

        try (Connection conn = DBConnection.getConnection()) {

            // Get all questions for this quiz
            String qSql = "SELECT id, correct_option FROM questions WHERE quiz_id = ?";
            PreparedStatement ps = conn.prepareStatement(qSql);
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int questionId = rs.getInt("id");
                String correct = rs.getString("correct_option");

                // user's selected option
                String userAnswer = request.getParameter("q_" + questionId);

                if (userAnswer != null && userAnswer.equals(correct)) {
                    score++;
                }
            }

            // Insert result
            String insertSql = "INSERT INTO results (user_id, quiz_id, score) VALUES (?, ?, ?)";
            PreparedStatement insertPs = conn.prepareStatement(insertSql);
            insertPs.setInt(1, userId);
            insertPs.setInt(2, quizId);
            insertPs.setInt(3, score);
            insertPs.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("submit-quiz.jsp?error=1");
            return;
        }

        // Redirect to results page
        response.sendRedirect("quiz-results.jsp?quizId=" + quizId + "&score=" + score);
    }
}
