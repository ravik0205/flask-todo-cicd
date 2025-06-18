#!/bin/bash

cd /home/ec2-user/todo_app_project

#!/bin/bash

cd /home/ec2-user/flask-app

# Create and activate virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Kill any running Flask app on port 8000
fuser -k 8000/tcp || true

# Start the Flask app
nohup python run.py > app.log 2>&1 &


