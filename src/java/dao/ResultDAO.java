/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author dharm
 */
package dao;

import model.Result;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResultDAO {

    private Connection getConnection() throws Exception {
        return DBConnection.getConnection();
    }

    // -------------------------------------------
    // SAVE RESULT
    // -------------------------------------------
    public boolean saveResult(int userId, int quizId, int score) {
        String sql = "INSERT INTO results (user_id, quiz_id, score, taken_on) VALUES (?, ?, ?, NOW())";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, quizId);
            ps.setInt(3, score);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // -------------------------------------------
    // GET ALL RESULTS (Joined with User + Quiz)
    // -------------------------------------------
    public List<Result> getAllResults() {
        List<Result> list = new ArrayList<>();

        String sql =
            "SELECT r.id, r.user_id, r.quiz_id, r.score, r.taken_on, " +
            "u.name AS participantName, q.title AS quizTitle " +
            "FROM results r " +
            "JOIN users u ON r.user_id = u.id " +
            "JOIN quizzes q ON r.quiz_id = q.id";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Result r = new Result();

                r.setId(rs.getInt("id"));
                r.setUserId(rs.getInt("user_id"));
                r.setQuizId(rs.getInt("quiz_id"));
                r.setScore(rs.getInt("score"));
                r.setTakenOn(rs.getTimestamp("taken_on"));

                // Joined fields
                r.setParticipantName(rs.getString("participantName"));
                r.setQuizTitle(rs.getString("quizTitle"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
