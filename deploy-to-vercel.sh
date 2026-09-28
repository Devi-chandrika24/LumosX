#!/bin/bash

# 🚀 LumosX LMS - Vercel Deployment Script
# This script helps prepare your project for Vercel deployment

echo "🚀 Preparing LumosX LMS for Vercel deployment..."

# Check if we're in the right directory
if [ ! -f "package.json" ] || [ ! -d "frontend" ] || [ ! -d "backend" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

echo "✅ Project structure verified"

# Check if frontend dependencies are installed
if [ ! -d "frontend/node_modules" ]; then
    echo "📦 Installing frontend dependencies..."
    cd frontend
    npm install
    cd ..
    echo "✅ Frontend dependencies installed"
else
    echo "✅ Frontend dependencies already installed"
fi

# Check if backend dependencies are installed
if [ ! -d "backend/node_modules" ]; then
    echo "📦 Installing backend dependencies..."
    cd backend
    npm install
    cd ..
    echo "✅ Backend dependencies installed"
else
    echo "✅ Backend dependencies already installed"
fi

# Test frontend build
echo "🔨 Testing frontend build..."
cd frontend
if npm run build; then
    echo "✅ Frontend build successful"
else
    echo "❌ Frontend build failed. Please check the errors above."
    exit 1
fi
cd ..

# Check if .env files exist
if [ ! -f ".env" ] && [ ! -f ".env.local" ]; then
    echo "⚠️  Warning: No .env file found. You'll need to set environment variables in Vercel dashboard."
    echo "   Required variables:"
    echo "   - MONGODB_URI"
    echo "   - JWT_SECRET"
    echo "   - NODE_ENV=production"
    echo "   - VITE_API_URL"
fi

echo ""
echo "🎉 Project is ready for Vercel deployment!"
echo ""
echo "📋 Next steps:"
echo "1. Push your code to GitHub"
echo "2. Go to https://vercel.com/dashboard"
echo "3. Click 'Add New Project'"
echo "4. Import your GitHub repository"
echo "5. Configure build settings:"
echo "   - Build Command: cd frontend && npm install && npm run build"
echo "   - Output Directory: frontend/dist"
echo "6. Add environment variables in Vercel dashboard"
echo "7. Deploy!"
echo ""
echo "📖 For detailed instructions, see VERCEL_DEPLOYMENT_GUIDE.md"



