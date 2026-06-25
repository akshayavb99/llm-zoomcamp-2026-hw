#!/bin/bash
set -e

read -p "Enter GEMINI API KEY: " GEMINI_API_KEY
read -p "Enter OPENAI API KEY: " OPENAI_API_KEY
read -p "Enter TAVILY API KEY: " TAVILY_API_KEY

# Pre-calculate the base64 values safely using printf
SECRET_GEMINI=$(printf "%s" "$GEMINI_API_KEY" | base64)
SECRET_OPENAI=$(printf "%s" "$OPENAI_API_KEY" | base64)
SECRET_TAVILY=$(printf "%s" "$TAVILY_API_KEY" | base64)

# Write to the .env file
cat > .env <<EOF
GEMINI_API_KEY=$GEMINI_API_KEY
SECRET_GEMINI_API_KEY=$SECRET_GEMINI
SECRET_OPENAI_API_KEY=$SECRET_OPENAI
SECRET_TAVILY_API_KEY=$SECRET_TAVILY
EOF

echo ".env generated safely."