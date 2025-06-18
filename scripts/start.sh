#!/bin/bash

# Navigate to app directory
cd /home/ec2-user/flask-app

# Set up virtual environment if not exists
if [ ! -d ".venv" ]; then
  python3 -m venv .venv
fi

# Activate virtual environment
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Kill anything running on port 8000 (or 5000 if you're using that)
fuser -k 8000/tcp || true

# Start the app in the background
nohup python run.py > app.log 2>&1 &
