/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author dharm
 */
package dao;

import model.Quiz;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {

    private Connection conn;

    public QuizDAO() {
        conn = DBConnection.getConnection();
    }

    // ADD QUIZ
    public boolean addQuiz(Quiz quiz) {
        String sql = "INSERT INTO quizzes (title, duration, created_by) VALUES (?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, quiz.getTitle());
            ps.setInt(2, quiz.getDuration());
            ps.setInt(3, quiz.getCreatedBy());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // GET ALL QUIZZES
    public List<Quiz> getAllQuizzes() {
        List<Quiz> list = new ArrayList<>();

        String sql = "SELECT * FROM quizzes";

        try (Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Quiz q = new Quiz(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getInt("duration"),
                        rs.getInt("created_by")
                );
                list.add(q);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // GET QUIZ BY ID
    public Quiz getQuizById(int id) {
        String sql = "SELECT * FROM quizzes WHERE id=?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Quiz(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getInt("duration"),
                        rs.getInt("created_by")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // DELETE QUIZ
    public boolean deleteQuiz(int id) {
        String sql = "DELETE FROM quizzes WHERE id=?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}

