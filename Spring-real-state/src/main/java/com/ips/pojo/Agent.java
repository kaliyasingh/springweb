package com.ips.pojo;
import java.sql.Timestamp;

public class Agent {

    private int agentId;
    
    // Personal Information
    private String fullName;
    private String email;
    private String phoneNumber;
    private String profilePhoto;
    private String status; // Active or Inactive
    
    // Professional Information
    private String licenseNumber;
    private int experienceYears;
    private String specialization; // Residential Sales, Commercial Sales, etc.
    private double commissionRate;
    
    // Territory/Area Assignment
    private String territoryArea;
    
    // Additional Information
    private String notes;
    
    // System Fields
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Constructors
    public Agent() {
    }

    public Agent(int agentId, String fullName, String email, String phoneNumber, String profilePhoto,
                 String status, String licenseNumber, int experienceYears, String specialization,
                 double commissionRate, String territoryArea, String notes,
                 Timestamp createdAt, Timestamp updatedAt) {
        this.agentId = agentId;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.profilePhoto = profilePhoto;
        this.status = status;
        this.licenseNumber = licenseNumber;
        this.experienceYears = experienceYears;
        this.specialization = specialization;
        this.commissionRate = commissionRate;
        this.territoryArea = territoryArea;
        this.notes = notes;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters
    public int getAgentId() { return agentId; }
    public void setAgentId(int agentId) { this.agentId = agentId; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getProfilePhoto() { return profilePhoto; }
    public void setProfilePhoto(String profilePhoto) { this.profilePhoto = profilePhoto; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }

    public int getExperienceYears() { return experienceYears; }
    public void setExperienceYears(int experienceYears) { this.experienceYears = experienceYears; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }

    public double getCommissionRate() { return commissionRate; }
    public void setCommissionRate(double commissionRate) { this.commissionRate = commissionRate; }

    public String getTerritoryArea() { return territoryArea; }
    public void setTerritoryArea(String territoryArea) { this.territoryArea = territoryArea; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }

    @Override
    public String toString() {
        return "Agent{" +
                "agentId=" + agentId +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", profilePhoto='" + profilePhoto + '\'' +
                ", status='" + status + '\'' +
                ", licenseNumber='" + licenseNumber + '\'' +
                ", experienceYears=" + experienceYears +
                ", specialization='" + specialization + '\'' +
                ", commissionRate=" + commissionRate +
                ", territoryArea='" + territoryArea + '\'' +
                ", notes='" + notes + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}
