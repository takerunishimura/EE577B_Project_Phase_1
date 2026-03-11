# EE577B_Project_Phase_1
4x4 Cardinal Mesh Router
# EE577B Project Phase 1 — Git Guide for Collaborators

#########################
## Initial One time Setup
#########################
1. Generate SSH Key (on Viterbi server)
  ssh-keygen -t ed25519 -C "your_usc_email@usc.edu"
  # Press Enter for all prompts
  
2. Prints out key in terminal
  cat ~/.ssh/id_ed25519.pub
  # Copy the output → GitHub → Settings → SSH Keys → New SSH Key → Paste
  
3. Verify connection
  ssh -T git@github.com
   # Should say: Hi username! You've successfully authenticated

4. Clone the Repo
  cd ~/EE577B
  git clone git@github.com:takerunishimura/EE577B_Project_Phase_1.git
  cd EE577B_Project_Phase_1

##################
## Daily Workflow
###################
### Pull latest changes before starting work (always do this first!)
git pull

### Check what files you've changed
git status

### Save and upload your work to Github
git add . (stage everything)  OR    git add router/design/gold_router.v (example if you want to stage a specific file)
git commit -m "your message here"
git push

#########################################################
## Branching (working on a feature without affecting main)
########################################################
Branch - your own personal copy of the project — changes you make won't affect your partner's work until you both agree to merge them together

### Create and switch to a new branch
git checkout -b branch_name

### after finishing up work in your branch and you want to push your branch and changes you made to github
git add .
git commit -m "your message here"
git push origin branch_name

### Switching to main branch
git checkout main

### Switch to branch you are working on
git checkout branch_name

### Merge your branch into main (after work is done)
1. Go to Github repository website page after git add ., commit, push
2. Click "Compare & pull request" (appears after you push your branch)
3. Add a short description of what you did
4. Click "Create pull request"
5. Click "Merge pull request"

