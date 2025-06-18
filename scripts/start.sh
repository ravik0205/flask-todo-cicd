#!/bin/bash

cd /home/ec2-user/todo_app_project

# Create and activate virtual environment
if [ ! -d ".venv" ]; then
  python3 -m venv .venv
fi

source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Kill any process running on port 8000
fuser -k 8000/tcp || true

# Start the app
nohup python run.py > app.log 2>&1 &

