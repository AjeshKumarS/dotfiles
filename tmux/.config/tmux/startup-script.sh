#!/bin/bash

# 1. Check for Command Line Argument ($1)
#    - If $1 is provided, use it for SESSION_NAME.
#    - If $1 is NOT provided (empty), use 'ghostty' as the default.
SESSION_NAME="${1:-ghostty}"

# 2. Check if the tmux session already exists
#    The '2>/dev/null' suppresses the "session not found" error message
tmux has-session -t "$SESSION_NAME" 2>/dev/null

# 3. If the exit code ($?) is not 0 (meaning the session does NOT exist)
if [ $? != 0 ]; then
  # Create a new detached session
  tmux new-session -s "$SESSION_NAME" -d

  # Optional: Send an initial command to the first window/pane
  tmux send-keys -t "$SESSION_NAME" "echo 'New session created: $SESSION_NAME'" C-m
fi

# 4. Attach to the session (either the new one or the existing one)
tmux attach-session -t "$SESSION_NAME"
