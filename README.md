# EE577B Project Phase 1 — 4×4 Cardinal Mesh Router

**University of Southern California | EE577B Spring 2026 | Group 14**

---

## Overview

This repository contains the RTL design and verification of a Cardinal Router and a 4×4 Mesh Network-on-Chip (NoC), implemented in synthesizable Verilog. Each router supports 5 bidirectional ports (North, South, East, West, and Processor/NIC), credit-based flow control, and XY dimension-order routing. The 16 routers are connected in a 4×4 mesh topology.

A Cardinal Network Interface Component (NIC) is also implemented to handle communication between each processor and the NoC.

---

## Key Design Features

- **Cardinal Router** — 5-port router with credit-based flow control and round-robin arbitration
- **XY Dimension-Order Routing** — packets route in the X direction first, then Y, guaranteeing deadlock-free delivery
- **4×4 Mesh** — 16 routers instantiated and wired in a mesh topology (`gold_mesh.v`)
- **Cardinal NIC** — bridges the processor-side interface to the router network side
- Synthesizable Verilog coding style throughout

---

## File Structure

```
Phase_1/
├── router/
│   ├── gold_router.v          # Top-level router design
│   └── [supporting modules]   # Input buffers, arbiter, crossbar, etc.
├── gold_mesh.v                # 4×4 mesh interconnect
├── nic/
│   └── cardinal_nic.v         # Network Interface Component
├── tb/
│   ├── tb_gold_router.v       # Router-level testbench
│   └── tb_gold_mesh.v         # Mesh-level testbench
└── sim/
    └── [simulation logs]
```

---

## Tools

- **Simulation:** Cadence NC-Sim
- **HDL:** Verilog (synthesizable style)

---

## Git Guide for Collaborators

### Initial One-Time Setup

1. Generate SSH Key (on Viterbi server)
```bash
ssh-keygen -t ed25519 -C "your_usc_email@usc.edu"
```
Press Enter for all prompts

2. Print out key in terminal and add to GitHub
```bash
cat ~/.ssh/id_ed25519.pub
```
Copy the output → GitHub → Settings → SSH Keys → New SSH Key → Paste

3. Verify connection
```bash
ssh -T git@github.com
```
Should say: `Hi username! You've successfully authenticated`

4. Clone the Repo
```bash
cd ~/EE577B
git clone git@github.com:takerunishimura/EE577B_Project_Phase_1.git
cd EE577B_Project_Phase_1
```

---

### Daily Workflow

Always pull first before starting work
```bash
git pull
```

Check what files you've changed
```bash
git status
```

Save and upload your work to GitHub
```bash
git add .
git commit -m "your message here"
git push
```

To stage a specific file instead:
```bash
git add router/design/gold_router.v
```

---

### Branching

> A branch is your own personal copy of the project — changes you make won't affect your partner's work until you both agree to merge them together.

Create and switch to a new branch
```bash
git checkout -b branch_name
```

Push your branch and changes to GitHub
```bash
git add .
git commit -m "your message here"
git push origin branch_name
```

Switch to main branch
```bash
git checkout main
```

Switch to your branch
```bash
git checkout branch_name
```

Merge your branch into main (after work is done)
1. Go to GitHub repo page after pushing your branch
2. Click "Compare & pull request"
3. Add a short description of what you did
4. Click "Create pull request"
5. Click "Merge pull request"
