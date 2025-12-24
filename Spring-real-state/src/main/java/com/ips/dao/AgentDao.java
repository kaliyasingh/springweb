package com.ips.dao;

import java.util.List;

import com.ips.pojo.Agent;

public interface AgentDao {
  public boolean saveAgent(Agent agent);
   public boolean updateAgent(Agent agent);
    public boolean deleteAgent(int agentId);
   public Agent getAgentById(int agentId);
    public List<Agent> getAllAgents();
    public List<Agent> getActiveAgents();
    public List<Agent> getAgentsBySpecialization(String specialization);
}
