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

@WebServlet("/reports")
public class ReportsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<ReportData> reports = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {

            String sql =
                "SELECT q.title, r.quiz_id, COUNT(r.user_id) AS attempts, AVG(r.score) AS avgScore " +
                "FROM results r JOIN quizzes q ON r.quiz_id = q.id " +
                "GROUP BY r.quiz_id";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ReportData rd = new ReportData();
                rd.quizId = rs.getInt("quiz_id");
                rd.title = rs.getString("title");
                rd.attempts = rs.getInt("attempts");
                rd.avgScore = rs.getDouble("avgScore");
                reports.add(rd);
            }

            request.setAttribute("reports", reports);
            request.getRequestDispatcher("reports.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("reports.jsp?error=1");
        }
    }

    public static class ReportData {
        public int quizId;
        public String title;
        public int attempts;
        public double avgScore;
    }
}
