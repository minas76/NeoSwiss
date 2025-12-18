# GitHub Pages Deployment Guide

## Quick Setup

### Step 1: Create a Git Repository
```bash
cd /Users/minas_76/Project
git init
git add .
git commit -m "Initial Neo-Swiss design system"
```

### Step 2: Push to GitHub
```bash
# Create a new repository on GitHub (don't initialize with README)
# Then run these commands:

git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
git branch -M main
git push -u origin main
```

### Step 3: Enable GitHub Pages
1. Go to your repository on GitHub
2. Click **Settings** (top right)
3. Scroll down to **Pages** section (left sidebar)
4. Under "Build and deployment":
   - **Source**: Select "GitHub Actions"
   - The workflow will automatically deploy from the main branch

### Step 4: Wait for Deployment
- GitHub Actions will automatically build and deploy
- Check the **Actions** tab to see deployment status
- Your site will be live at: `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME`

## Files Included for Deployment

- `.nojekyll` — Tells GitHub Pages to skip Jekyll processing
- `.github/workflows/deploy.yml` — Automatic deployment workflow
- All HTML, CSS, and supporting files are ready to deploy

## Troubleshooting

### Deployment Fails
1. Check the **Actions** tab in your GitHub repository
2. Click on the failed workflow to see error details
3. Common issues:
   - Branch name is not `main` or `master` — update in `.github/workflows/deploy.yml`
   - Repository is private — make it public or use GitHub Pro
   - Files not committed — run `git add .` and `git commit`

### Site Shows 404 Errors
1. Verify file paths are relative (no leading `/`)
   - ✅ Correct: `href="index.html"`
   - ❌ Wrong: `href="/index.html"`
2. Ensure all HTML, CSS files are committed to git
3. Wait 2-3 minutes after push — GitHub needs time to build

### Custom Domain
1. In GitHub settings → Pages, add your custom domain
2. Create a `CNAME` file in the repo root:
   ```
   yourdomain.com
   ```

## Local Testing Before Deploy

```bash
# Start a local server to test
cd /Users/minas_76/Project
python3 -m http.server 8000

# Open http://localhost:8000 in your browser
```

## After Deployment

Your Neo-Swiss design system is now live! Share your site:
- GitHub Pages URL: `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME`
- Direct link to homepage: `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/index.html`
- Design system guide: `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/styleguide.html`

## Need Help?

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Troubleshooting Guide](https://docs.github.com/en/pages/getting-started-with-github-pages/troubleshooting-common-issues-with-github-pages)
