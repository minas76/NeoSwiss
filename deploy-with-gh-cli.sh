#!/bin/bash

# Alternative: Use GitHub CLI for deployment
# This is more reliable than manual git commands

echo "🚀 Neo-Swiss GitHub Deployment (GitHub CLI)"
echo "============================================"
echo ""
echo "Prerequisites:"
echo "1. Install GitHub CLI: brew install gh"
echo "2. Authenticate: gh auth login"
echo ""

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI not found. Install with:"
    echo "   brew install gh"
    echo ""
    echo "Then run: gh auth login"
    exit 1
fi

echo "✅ GitHub CLI found"
echo ""

# Check if user is authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated. Run: gh auth login"
    exit 1
fi

echo "✅ Authentication successful"
echo ""

# Get username
USERNAME=$(gh api user --jq '.login')
echo "Logged in as: $USERNAME"
echo ""

echo "Enter repository name (e.g., NeoSwiss):"
read REPO_NAME

echo ""
echo "Creating repository..."

# Create repository
gh repo create "$REPO_NAME" \
    --public \
    --source=/Users/minas_76/Project \
    --remote=origin \
    --push

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Repository created and pushed!"
    echo ""
    echo "🌐 Your site will be available at:"
    echo "   https://${USERNAME}.github.io/${REPO_NAME}/"
    echo ""
    echo "📊 Check deployment status:"
    echo "   https://github.com/${USERNAME}/${REPO_NAME}/actions"
else
    echo "❌ Failed to create repository"
    echo ""
    echo "Try creating manually at: https://github.com/new"
    echo "Then run: git push -u origin main"
fi
