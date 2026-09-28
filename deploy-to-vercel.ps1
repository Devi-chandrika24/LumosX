# 🚀 LumosX LMS - Vercel Deployment Script (PowerShell)
# This script helps prepare your project for Vercel deployment

Write-Host "🚀 Preparing LumosX LMS for Vercel deployment..." -ForegroundColor Green

# Check if we're in the right directory
if (-not (Test-Path "package.json") -or -not (Test-Path "frontend") -or -not (Test-Path "backend")) {
    Write-Host "❌ Error: Please run this script from the project root directory" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Project structure verified" -ForegroundColor Green

# Check if frontend dependencies are installed
if (-not (Test-Path "frontend/node_modules")) {
    Write-Host "📦 Installing frontend dependencies..." -ForegroundColor Yellow
    Set-Location frontend
    npm install
    Set-Location ..
    Write-Host "✅ Frontend dependencies installed" -ForegroundColor Green
} else {
    Write-Host "✅ Frontend dependencies already installed" -ForegroundColor Green
}

# Check if backend dependencies are installed
if (-not (Test-Path "backend/node_modules")) {
    Write-Host "📦 Installing backend dependencies..." -ForegroundColor Yellow
    Set-Location backend
    npm install
    Set-Location ..
    Write-Host "✅ Backend dependencies installed" -ForegroundColor Green
} else {
    Write-Host "✅ Backend dependencies already installed" -ForegroundColor Green
}

# Test frontend build
Write-Host "🔨 Testing frontend build..." -ForegroundColor Yellow
Set-Location frontend
try {
    npm run build
    Write-Host "✅ Frontend build successful" -ForegroundColor Green
} catch {
    Write-Host "❌ Frontend build failed. Please check the errors above." -ForegroundColor Red
    Set-Location ..
    exit 1
}
Set-Location ..

# Check if .env files exist
if (-not (Test-Path ".env") -and -not (Test-Path ".env.local")) {
    Write-Host "⚠️  Warning: No .env file found. You'll need to set environment variables in Vercel dashboard." -ForegroundColor Yellow
    Write-Host "   Required variables:" -ForegroundColor Yellow
    Write-Host "   - MONGODB_URI" -ForegroundColor Yellow
    Write-Host "   - JWT_SECRET" -ForegroundColor Yellow
    Write-Host "   - NODE_ENV=production" -ForegroundColor Yellow
    Write-Host "   - VITE_API_URL" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 Project is ready for Vercel deployment!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Cyan
Write-Host "1. Push your code to GitHub" -ForegroundColor White
Write-Host "2. Go to https://vercel.com/dashboard" -ForegroundColor White
Write-Host "3. Click 'Add New Project'" -ForegroundColor White
Write-Host "4. Import your GitHub repository" -ForegroundColor White
Write-Host "5. Configure build settings:" -ForegroundColor White
Write-Host "   - Build Command: cd frontend && npm install && npm run build" -ForegroundColor White
Write-Host "   - Output Directory: frontend/dist" -ForegroundColor White
Write-Host "6. Add environment variables in Vercel dashboard" -ForegroundColor White
Write-Host "7. Deploy!" -ForegroundColor White
Write-Host ""
Write-Host "📖 For detailed instructions, see VERCEL_DEPLOYMENT_GUIDE.md" -ForegroundColor Cyan



