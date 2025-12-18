#!/bin/bash

# GitHub Deployment Helper Script
# This script helps push your Neo-Swiss site to GitHub

echo "🚀 Neo-Swiss GitHub Deployment Helper"
echo "======================================"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git not initialized. Initializing..."
    git init
    git add .
    git commit -m "Initial commit: Neo-Swiss design system"
else
    echo "✅ Git repository found"
fi

echo ""
echo "Enter your GitHub username:"
read USERNAME

echo ""
echo "Enter your repository name (e.g., NeoSwiss):"
read REPO_NAME

echo ""
echo "Setting up remote..."

# Remove existing remote if it exists
git remote remove origin 2>/dev/null

# Add new remote with SSH (more reliable than HTTPS)
git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git

echo ""
echo "Pushing to GitHub..."
echo "Note: You may be prompted to authenticate with GitHub"
echo ""

# Ensure we're on main branch
git branch -M main

# Try to push
if git push -u origin main; then
    echo ""
    echo "✅ Success! Your site is being deployed."
    echo ""
    echo "🌐 Your site will be available at:"
    echo "   https://${USERNAME}.github.io/${REPO_NAME}/"
    echo ""
    echo "📊 Check deployment status at:"
    echo "   https://github.com/${USERNAME}/${REPO_NAME}/actions"
    echo ""
    echo "⏱️  Deployment typically takes 1-2 minutes"
else
    echo ""
    echo "❌ Push failed. Possible solutions:"
    echo ""
    echo "1. If it's an authentication error:"
    echo "   - Go to https://github.com/settings/tokens"
    echo "   - Create a Personal Access Token (PAT)"
    echo "   - When prompted, paste the token as your password"
    echo ""
    echo "2. Or use SSH instead:"
    echo "   git remote remove origin"
    echo "   git remote add origin git@github.com:${USERNAME}/${REPO_NAME}.git"
    echo "   git push -u origin main"
    echo ""
    echo "3. Make sure the repository exists on GitHub first:"
    echo "   https://github.com/new"
fi
