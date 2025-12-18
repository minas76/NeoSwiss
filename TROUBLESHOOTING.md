# 🔧 Neo-Swiss Site Troubleshooting & Local Testing

## ✅ Your Site Files Are Intact

All files are present and ready:
- `index.html` (7.3 KB)
- `styleguide.html` (14.3 KB)
- `history-*.html` (4 files, 3.3-3.8 KB each)
- `styles.css` (23.6 KB)

## 🧪 Test Locally First

### Option 1: Simple Python Server (Recommended)
```bash
cd /Users/minas_76/Project
python3 -m http.server 8000
```

Then open: **http://localhost:8000**

The server is already running on port 8000!

### Option 2: Using Node.js
```bash
npm install -g http-server
http-server
```

### Option 3: Using Ruby
```bash
ruby -run -ehttpd . -p8000
```

---

## 📤 GitHub Deployment (Fix Git Error 128)

Error 128 means authentication failed. Here are solutions:

### Solution 1: Using Personal Access Token (PAT) - Easiest
```bash
cd /Users/minas_76/Project

# Create PAT at: https://github.com/settings/tokens
# - Click "Generate new token" → "Generate new token (classic)"
# - Give it "repo" scope
# - Copy the token (you won't see it again!)

# Then push with PAT:
git push -u origin main

# When asked for password, paste the PAT (not your GitHub password!)
```

### Solution 2: Using SSH (More Secure)
```bash
# First, check if you have SSH keys
ls -la ~/.ssh/id_rsa

# If not, create one:
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""

# Add to GitHub: https://github.com/settings/keys
# Click "New SSH key" and paste contents of ~/.ssh/id_rsa.pub

# Then use SSH for git:
cd /Users/minas_76/Project
git remote remove origin
git remote add origin git@github.com:minas76/NeoSwiss.git
git push -u origin main
```

### Solution 3: Using GitHub CLI (Automated)
```bash
# Install GitHub CLI
brew install gh

# Authenticate
gh auth login
# Follow prompts (choose HTTPS, generate token when asked)

# Create and push repo
gh repo create NeoSwiss --public --source=/Users/minas_76/Project --remote=origin --push
```

### Solution 4: Manual File Upload (Quick Backup)
1. Go to: https://github.com/new
2. Create repository `NeoSwiss`
3. In "…or upload an existing file from your computer"
4. Drag and drop all `.html`, `.css`, and `.nojekyll` files
5. Commit

---

## ✅ Verify After Deployment

Once pushed to GitHub:

1. **Check Actions Tab**
   - Go to: `https://github.com/minas76/NeoSwiss/actions`
   - Wait for workflow to complete (green checkmark)

2. **Enable GitHub Pages**
   - Settings → Pages
   - Source: GitHub Actions
   - Wait 1-2 minutes

3. **Visit Your Site**
   - `https://minas76.github.io/NeoSwiss/`

---

## 🔍 Common Issues & Fixes

### Issue: "fatal: could not read Username"
**Fix:** Use Personal Access Token instead of password
- Generate at: https://github.com/settings/tokens
- Use as password when prompted

### Issue: "remote: Repository not found"
**Fix:** Create repository first at https://github.com/new

### Issue: "Permission denied (publickey)"
**Fix:** Set up SSH keys (see Solution 2 above)

### Issue: Site loads but no styling
**Fix:**
1. Check browser cache (Ctrl+Shift+Delete)
2. Hard refresh (Ctrl+Shift+R)
3. Verify `styles.css` was uploaded to GitHub
4. Check that styles.css path in HTML is relative

### Issue: Links don't work
**Fix:**
1. Verify all links are relative (no leading `/`)
2. Check file names match exactly (case-sensitive)
3. Ensure all `.html` files are uploaded

---

## 📋 Step-by-Step Deploy Checklist

- [ ] Site works locally at http://localhost:8000
- [ ] All `.html` and `.css` files are in `/Users/minas_76/Project`
- [ ] All links use relative paths (href="styleguide.html" not href="/styleguide.html")
- [ ] `.nojekyll` file exists in root
- [ ] `.github/workflows/deploy.yml` exists in root
- [ ] Git repository initialized: `git init`
- [ ] All files committed: `git add . && git commit -m "msg"`
- [ ] Remote added: `git remote add origin https://github.com/minas76/NeoSwiss.git`
- [ ] Pushed to main: `git push -u origin main`
- [ ] GitHub Pages enabled in Settings → Pages
- [ ] Actions workflow shows green checkmark
- [ ] Site is live at `https://minas76.github.io/NeoSwiss/`

---

## 🆘 Need More Help?

Resources:
- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [GitHub CLI Docs](https://cli.github.com/manual)
- [Git Authentication](https://docs.github.com/en/authentication)

**Your site is fully functional locally. The issue is just getting it to GitHub!**
