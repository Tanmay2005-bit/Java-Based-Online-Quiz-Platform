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

@WebServlet("/systemSettings")
public class SystemSettingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT * FROM settings LIMIT 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("siteName", rs.getString("site_name"));
                request.setAttribute("maintenance", rs.getBoolean("maintenance"));
            }

            request.getRequestDispatcher("system-settings.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("system-settings.jsp?error=1");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String siteName = request.getParameter("siteName");
        boolean maintenance = request.getParameter("maintenance") != null;

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "UPDATE settings SET site_name=?, maintenance=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, siteName);
            ps.setBoolean(2, maintenance);
            ps.executeUpdate();

            response.sendRedirect("systemSettings?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("systemSettings?error=1");
        }
    }
}
