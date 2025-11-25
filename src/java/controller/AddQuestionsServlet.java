/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import util.DBConnection;

@WebServlet("/addQuestion")
public class AddQuestionsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form fields
        String quizId = request.getParameter("quizId");
        String question = request.getParameter("question");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");

        // Basic validation
        if (quizId == null || question == null || correctOption == null ||
            question.trim().isEmpty() || correctOption.trim().isEmpty()) {

            response.sendRedirect("add-question.jsp?quizId=" + quizId + "&error=missingfields");
            return;
        }

        boolean inserted = false;

        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                String sql = "INSERT INTO questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?)";

                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setInt(1, Integer.parseInt(quizId));
                    ps.setString(2, question);
                    ps.setString(3, optionA);
                    ps.setString(4, optionB);
                    ps.setString(5, optionC);
                    ps.setString(6, optionD);
                    ps.setString(7, correctOption);

                    inserted = ps.executeUpdate() > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[QUESTION_INSERT_ERROR] " + e.getMessage());
        }

        if (inserted) {
            // Stay on same page so creator can add more questions
            response.sendRedirect("add-question.jsp?quizId=" + quizId + "&success=1");
        } else {
            response.sendRedirect("add-question.jsp?quizId=" + quizId + "&error=insertfail");
        }
    }
}
