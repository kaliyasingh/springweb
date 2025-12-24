package com.ips.daoimpl;

import com.ips.dao.AgentDao;
import com.ips.pojo.Agent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class AgentDaoImpl implements AgentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper to map ResultSet → Agent
    private RowMapper<Agent> agentRowMapper = new RowMapper<Agent>() {
        @Override
        public Agent mapRow(ResultSet rs, int rowNum) throws SQLException {
            Agent agent = new Agent();
            agent.setAgentId(rs.getInt("agent_id"));
            agent.setFullName(rs.getString("full_name"));
            agent.setEmail(rs.getString("email"));
            agent.setPhoneNumber(rs.getString("phone_number"));
            agent.setProfilePhoto(rs.getString("profile_photo"));
            agent.setStatus(rs.getString("status"));
            agent.setLicenseNumber(rs.getString("license_number"));
            agent.setExperienceYears(rs.getInt("experience_years"));
            agent.setSpecialization(rs.getString("specialization"));
            agent.setCommissionRate(rs.getDouble("commission_rate"));
            agent.setTerritoryArea(rs.getString("territory_area"));
            agent.setNotes(rs.getString("notes"));
            agent.setCreatedAt(rs.getTimestamp("created_at"));
            agent.setUpdatedAt(rs.getTimestamp("updated_at"));
            return agent;
        }
    };

    // ============================================
    // SAVE AGENT
    // ============================================
    @Override
    public boolean saveAgent(Agent agent) {
        String sql = "INSERT INTO agents (full_name, email, phone_number, profile_photo, status, " +
                     "license_number, experience_years, specialization, commission_rate, " +
                     "territory_area, notes, created_at, updated_at) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())";

        int rows = jdbcTemplate.update(sql,
                agent.getFullName(),
                agent.getEmail(),
                agent.getPhoneNumber(),
                agent.getProfilePhoto(),
                agent.getStatus(),
                agent.getLicenseNumber(),
                agent.getExperienceYears(),
                agent.getSpecialization(),
                agent.getCommissionRate(),
                agent.getTerritoryArea(),
                agent.getNotes()
        );

        return rows > 0;
    }

    // ============================================
    // UPDATE AGENT
    // ============================================
    @Override
    public boolean updateAgent(Agent agent) {
        String sql = "UPDATE agents SET full_name=?, email=?, phone_number=?, profile_photo=?, status=?, " +
                     "license_number=?, experience_years=?, specialization=?, commission_rate=?, territory_area=?, " +
                     "notes=?, updated_at=NOW() WHERE agent_id=?";

        int rows = jdbcTemplate.update(sql,
                agent.getFullName(),
                agent.getEmail(),
                agent.getPhoneNumber(),
                agent.getProfilePhoto(),
                agent.getStatus(),
                agent.getLicenseNumber(),
                agent.getExperienceYears(),
                agent.getSpecialization(),
                agent.getCommissionRate(),
                agent.getTerritoryArea(),
                agent.getNotes(),
                agent.getAgentId()
        );

        return rows > 0;
    }

    // ============================================
    // DELETE AGENT (Soft delete)
    // ============================================
    @Override
    public boolean deleteAgent(int agentId) {
        String sql = "UPDATE agents SET status='Inactive', updated_at=NOW() WHERE agent_id=?";
        int rows = jdbcTemplate.update(sql, agentId);
        return rows > 0;
    }

    // ============================================
    // GET AGENT BY ID
    // ============================================
    @Override
    public Agent getAgentById(int agentId) {
        String sql = "SELECT * FROM agents WHERE agent_id=?";
        return jdbcTemplate.queryForObject(sql, agentRowMapper, agentId);
    }

    // ============================================
    // GET ALL AGENTS
    // ============================================
    @Override
    public List<Agent> getAllAgents() {
        String sql = "SELECT * FROM agents ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, agentRowMapper);
    }

    // ============================================
    // GET ACTIVE AGENTS
    // ============================================
    @Override
    public List<Agent> getActiveAgents() {
        String sql = "SELECT * FROM agents WHERE status='Active' ORDER BY full_name";
        return jdbcTemplate.query(sql, agentRowMapper);
    }

    // ============================================
    // GET AGENTS BY SPECIALIZATION
    // ============================================
    @Override
    public List<Agent> getAgentsBySpecialization(String specialization) {
        String sql = "SELECT * FROM agents WHERE specialization=? AND status='Active'";
        return jdbcTemplate.query(sql, agentRowMapper, specialization);
    }
}
