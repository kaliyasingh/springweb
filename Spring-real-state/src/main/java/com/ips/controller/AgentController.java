package com.ips.controller;

import com.ips.dao.AgentDao;
import com.ips.pojo.Agent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

public class AgentController {

    @Autowired
    private AgentDao agentDao;

    // List all agents
    @GetMapping({"", "/list"})
    public String listAgents(Model model) {
        List<Agent> agents = agentDao.getAllAgents();
        model.addAttribute("agents", agents);
        return "agent-list"; // resolves to /WEB-INF/views/agent-list.jsp
    }

    // Show add agent form
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("agent", new Agent());
        return "agent-add";
    }

    // Save agent
    @PostMapping("/save")
    public String saveAgent(@ModelAttribute("agent") Agent agent, Model model) {
        boolean success = agentDao.saveAgent(agent);
        if (success) {
            return "redirect:/agent/list";
        } else {
            model.addAttribute("errorMessage", "Failed to save agent");
            return "agent-add";
        }
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Agent agent = agentDao.getAgentById(id);
        model.addAttribute("agent", agent);
        return "agent-edit";
    }

    // Update agent
    @PostMapping("/update")
    public String updateAgent(@ModelAttribute("agent") Agent agent, Model model) {
        boolean success = agentDao.updateAgent(agent);
        if (success) {
            return "redirect:/agent/list";
        } else {
            model.addAttribute("errorMessage", "Failed to update agent");
            return "agent-edit";
        }
    }

    // Soft delete agent
    @GetMapping("/delete/{id}")
    public String deleteAgent(@PathVariable("id") int id) {
        agentDao.deleteAgent(id);
        return "redirect:/agent/list";
    }

    // View agent details
    @GetMapping("/view/{id}")
    public String viewAgent(@PathVariable("id") int id, Model model) {
        Agent agent = agentDao.getAgentById(id);
        model.addAttribute("agent", agent);
        return "agent-view";
    }
}
