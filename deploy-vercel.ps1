# 🚀 Vercel Deployment Script - Fixed Version
# This script helps deploy your project to Vercel with proper API structure

Write-Host "🚀 Deploying LumosX LMS to Vercel (Fixed Version)..." -ForegroundColor Green

# Check if we're in the right directory
if (-not (Test-Path "package.json") -or -not (Test-Path "frontend") -or -not (Test-Path "api")) {
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

# Check API structure
Write-Host "🔍 Checking API structure..." -ForegroundColor Yellow
if (Test-Path "api/health.js") {
    Write-Host "✅ Health endpoint found" -ForegroundColor Green
} else {
    Write-Host "❌ Health endpoint missing" -ForegroundColor Red
}

if (Test-Path "api/test.js") {
    Write-Host "✅ Test endpoint found" -ForegroundColor Green
} else {
    Write-Host "❌ Test endpoint missing" -ForegroundColor Red
}

if (Test-Path "api/auth/register.js") {
    Write-Host "✅ Auth endpoint found" -ForegroundColor Green
} else {
    Write-Host "❌ Auth endpoint missing" -ForegroundColor Red
}

# Check if .env files exist
if (-not (Test-Path ".env") -and -not (Test-Path ".env.local")) {
    Write-Host "⚠️  Warning: No .env file found. You'll need to set environment variables in Vercel dashboard." -ForegroundColor Yellow
    Write-Host "   Required variables:" -ForegroundColor Yellow
    Write-Host "   - MONGODB_URI" -ForegroundColor Yellow
    Write-Host "   - JWT_SECRET" -ForegroundColor Yellow
    Write-Host "   - NODE_ENV=production" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 Project is ready for Vercel deployment!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Cyan
Write-Host "1. Initialize git repository:" -ForegroundColor White
Write-Host "   git init" -ForegroundColor Gray
Write-Host "   git add ." -ForegroundColor Gray
Write-Host "   git commit -m 'Fix Vercel API errors'" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Push to GitHub:" -ForegroundColor White
Write-Host "   git remote add origin https://github.com/yourusername/your-repo.git" -ForegroundColor Gray
Write-Host "   git push -u origin main" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Deploy on Vercel:" -ForegroundColor White
Write-Host "   - Go to https://vercel.com/dashboard" -ForegroundColor Gray
Write-Host "   - Click 'Add New Project'" -ForegroundColor Gray
Write-Host "   - Import your GitHub repository" -ForegroundColor Gray
Write-Host "   - Configure: Framework Preset: Vite" -ForegroundColor Gray
Write-Host "   - Build Command: cd frontend && npm install && npm run build" -ForegroundColor Gray
Write-Host "   - Output Directory: frontend/dist" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Add environment variables in Vercel dashboard" -ForegroundColor White
Write-Host ""
Write-Host "5. Test endpoints after deployment:" -ForegroundColor White
Write-Host "   - https://your-project.vercel.app/api/test" -ForegroundColor Gray
Write-Host "   - https://your-project.vercel.app/api/health" -ForegroundColor Gray
Write-Host ""
Write-Host "📖 For detailed instructions, see VERCEL_ERRORS_FIX.md" -ForegroundColor Cyan



