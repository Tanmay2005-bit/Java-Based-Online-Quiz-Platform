/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author dharm
 */
package model;

import java.sql.Timestamp;

public class Result {

    private int id;
    private int participantId;   // FIXED (previously missing)
    private int quizId;
    private int score;
    private Timestamp takenOn;

    private String participantName;  
    private String quizTitle;

    public Result() {}

    public Result(int id, int participantId, int quizId, int score, Timestamp takenOn) {
        this.id = id;
        this.participantId = participantId;
        this.quizId = quizId;
        this.score = score;
        this.takenOn = takenOn;
    }

    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    }

    public int getParticipantId() { 
        return participantId; 
    }
    public void setParticipantId(int participantId) { 
        this.participantId = participantId; 
    }

    public int getQuizId() { 
        return quizId; 
    }
    public void setQuizId(int quizId) { 
        this.quizId = quizId; 
    }

    public int getScore() { 
        return score; 
    }
    public void setScore(int score) { 
        this.score = score; 
    }

    public Timestamp getTakenOn() { 
        return takenOn; 
    }
    public void setTakenOn(Timestamp takenOn) { 
        this.takenOn = takenOn; 
    }

    public String getParticipantName() {
        return participantName;
    }
    public void setParticipantName(String participantName) {
        this.participantName = participantName;
    }

    public String getQuizTitle() {
        return quizTitle;
    }
    public void setQuizTitle(String quizTitle) {
        this.quizTitle = quizTitle;
    }

    public void setUserId(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
