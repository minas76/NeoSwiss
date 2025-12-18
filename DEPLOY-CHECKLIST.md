# GitHub Pages Deployment Checklist ✅

## Pre-Deployment

- [x] All HTML files use relative paths (no leading `/`)
- [x] `.nojekyll` file created (tells GitHub to skip Jekyll)
- [x] GitHub Actions workflow created (`.github/workflows/deploy.yml`)
- [x] `.gitignore` configured
- [x] All CSS and HTML files are in the root directory
- [x] No build process needed (pure HTML/CSS)

## Deployment Steps

### 1. Initialize Git Repository
```bash
cd /Users/minas_76/Project
git init
git add .
git commit -m "Initial commit: Neo-Swiss design system"
```

### 2. Create GitHub Repository
1. Go to https://github.com/new
2. Name: `neo-swiss` (or your preferred name)
3. Description: "Neo-Swiss responsive design system"
4. **Do NOT** check "Initialize this repository with a README"
5. Click "Create repository"

### 3. Connect Local to GitHub
```bash
# Replace YOUR-USERNAME and YOUR-REPO-NAME with your actual values
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
git branch -M main
git push -u origin main
```

### 4. Enable GitHub Pages
1. Go to your repo: https://github.com/YOUR-USERNAME/YOUR-REPO-NAME
2. Click **Settings** (gear icon)
3. Click **Pages** in the left sidebar
4. Under "Build and deployment":
   - **Source**: Choose "GitHub Actions"
   - The workflow will auto-deploy to `gh-pages` branch

### 5. Wait & Verify
- Check the **Actions** tab for deployment status
- Wait 1-2 minutes for deployment to complete
- Your site is live at: `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME`

## Troubleshooting

### "Deployment failed" in Actions
1. Check the workflow run details
2. Common causes:
   - Repository is private (make public or upgrade)
   - Files weren't committed properly
   - Branch name mismatch

### Links don't work or CSS missing
1. Verify relative paths in HTML files ✅ (Already correct)
2. Check GitHub Pages URL is correct
3. Clear browser cache (Ctrl+Shift+Delete)
4. Try incognito mode

### 404 errors on pages
1. Make sure all `.html` files are committed
2. Verify file names in links match exactly (case-sensitive)
3. Try adding `index.html` to URLs if needed

## File Structure Ready for Deployment

```
Project/
├── .nojekyll              ← Tells GitHub to skip Jekyll
├── .github/
│   └── workflows/
│       └── deploy.yml     ← Auto-deployment workflow
├── index.html             ← Homepage
├── styleguide.html        ← Design system
├── history-*.html         ← History pages (4 files)
├── styles.css             ← All styles
└── README.md              ← Documentation
```

## Live Site Structure

Once deployed, your site will be accessible at:
- Homepage: `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/`
- Design System: `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/styleguide.html`
- History: `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/history-overview.html`

## Support

- [GitHub Pages Help](https://docs.github.com/en/pages)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Troubleshooting](https://docs.github.com/en/pages/getting-started-with-github-pages/troubleshooting-common-issues-with-github-pages)
