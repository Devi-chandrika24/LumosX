# 🚀 Vercel Deployment Guide for LumosX LMS

This guide will help you deploy your Learning Management System to Vercel with both frontend and backend.

## 📋 Prerequisites

- [ ] MongoDB Atlas account and database
- [ ] GitHub repository with your code
- [ ] Vercel account (free tier available)

## 🔧 Step 1: Prepare Your Repository

### 1.1 Environment Variables Setup

Create a `.env.local` file in your project root (don't commit this to Git):

```env
# Backend Environment Variables
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/lms_db
JWT_SECRET=your_super_secret_jwt_key_min_32_characters
NODE_ENV=production

# Frontend Environment Variables
VITE_API_URL=https://your-project-name.vercel.app/api
```

### 1.2 Generate JWT Secret

Run this command to generate a secure JWT secret:

```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

## 🚀 Step 2: Deploy to Vercel

### 2.1 Connect Repository

1. Go to [Vercel Dashboard](https://vercel.com/dashboard)
2. Click **"Add New Project"**
3. Import your GitHub repository
4. Select the repository containing your LMS project

### 2.2 Configure Project Settings

**Root Directory:** Leave empty (uses project root)

**Build and Output Settings:**
- **Framework Preset:** Other
- **Build Command:** `cd frontend && npm install && npm run build`
- **Output Directory:** `frontend/dist`

### 2.3 Add Environment Variables

In the Vercel dashboard, go to **Settings** → **Environment Variables** and add:

```
MONGODB_URI = mongodb+srv://username:password@cluster.mongodb.net/lms_db
JWT_SECRET = your_generated_jwt_secret_here
NODE_ENV = production
VITE_API_URL = https://your-project-name.vercel.app/api
```

### 2.4 Deploy

1. Click **"Deploy"**
2. Wait for the deployment to complete
3. Note your deployment URL (e.g., `https://lms-project.vercel.app`)

## 🔄 Step 3: Update API URLs

After deployment, update the `VITE_API_URL` environment variable in Vercel:

1. Go to your project in Vercel dashboard
2. Go to **Settings** → **Environment Variables**
3. Update `VITE_API_URL` to: `https://your-actual-vercel-url.vercel.app/api`
4. Redeploy the project

## 🧪 Step 4: Test Your Deployment

### 4.1 Test Backend API

```bash
# Health check
curl https://your-project.vercel.app/api/health

# Test registration
curl -X POST https://your-project.vercel.app/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Test User","email":"test@example.com","password":"test123","role":"student"}'
```

### 4.2 Test Frontend

1. Open your Vercel deployment URL
2. Test user registration
3. Test user login
4. Test all major features

## 🐛 Troubleshooting

### Common Issues

#### 1. Build Fails
**Problem:** Frontend build fails
**Solution:** 
- Check that all dependencies are in `package.json`
- Ensure build command is correct
- Check build logs in Vercel dashboard

#### 2. API Routes Not Working
**Problem:** `/api/*` routes return 404
**Solution:**
- Verify `vercel.json` configuration
- Check that backend routes are properly configured
- Ensure environment variables are set

#### 3. CORS Errors
**Problem:** Frontend can't connect to backend
**Solution:**
- Update CORS configuration in `backend/server.js`
- Add your Vercel domain to allowed origins

#### 4. Environment Variables Not Working
**Problem:** App can't read environment variables
**Solution:**
- Restart deployment after adding variables
- Check variable names (no typos)
- For Vite, variables must start with `VITE_`

#### 5. MongoDB Connection Failed
**Problem:** Backend can't connect to MongoDB
**Solution:**
- Check MongoDB Atlas connection string
- Verify IP whitelist includes 0.0.0.0/0
- Check username/password in connection string

## 📊 Monitoring

### Vercel Analytics
- Go to **Analytics** tab in your Vercel dashboard
- Monitor Core Web Vitals
- Check deployment logs

### Backend Monitoring
- Check **Functions** tab for serverless function logs
- Monitor API response times
- Set up error tracking

## 🔄 Continuous Deployment

Vercel automatically deploys when you push to your main branch:

1. **Auto-Deploy:** Every push to `main` triggers deployment
2. **Preview Deployments:** Pull requests create preview deployments
3. **Manual Deploy:** You can trigger manual deployments

## 📝 Deployment Checklist

- [ ] MongoDB Atlas configured and accessible
- [ ] Environment variables set in Vercel
- [ ] Repository connected to Vercel
- [ ] Build configuration correct
- [ ] API routes working (`/api/health` responds)
- [ ] Frontend loads correctly
- [ ] User registration works
- [ ] User login works
- [ ] All major features tested

## 🎉 Success!

Your LMS is now live on Vercel!

**Frontend URL:** https://your-project.vercel.app
**Backend API:** https://your-project.vercel.app/api

## 🔐 Security Best Practices

1. **Never commit `.env` files** to GitHub
2. **Use strong JWT secrets** (minimum 32 characters)
3. **Rotate secrets periodically**
4. **Enable two-factor authentication** on Vercel
5. **Keep dependencies updated** regularly
6. **Monitor for security vulnerabilities**

## 💰 Cost Considerations

Vercel offers generous free tier:
- **Personal projects:** Unlimited
- **Bandwidth:** 100GB/month free
- **Serverless functions:** 100GB-hours/month free
- **Custom domains:** Free

For production use, consider upgrading to Pro plan for:
- Better performance
- Higher limits
- Priority support
- Advanced analytics

---

**Happy Deploying! 🚀**



