#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <branch-name> <repo-url>"
    exit 1
fi

# Assign the first and second arguments to variables
BRANCH_NAME=$1
REPO_URL=$2

# Initialize Git repository (if not already initialized)
git init

# Add all changes to the staging area
git add .

# Prompt for the commit message
echo "Enter commit message: "
read COMMIT_MESSAGE
git commit -m "$COMMIT_MESSAGE"

# Add the remote repository (only if it's not already added)
if git remote | grep -q 'origin'; then
    echo "Remote 'origin' already exists. Skipping adding remote."
else
    git remote add origin $REPO_URL
fi

# Push the changes to the remote repository
git push -u origin $BRANCH_NAME

echo "Code pushed to $REPO_URL on branch $BRANCH_NAME"
