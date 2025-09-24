# Railway GitHub Auto-Deployment Guide

## 🎉 Repository Ready!

Your MetaMCP migration package is now available on GitHub:
**[https://github.com/klogins-hash/metamcp-railway-backup](https://github.com/klogins-hash/metamcp-railway-backup)**

## 🚀 Deploy to Railway with Auto-Updates

### Step 1: Create Railway Account
1. Go to [railway.app](https://railway.app)
2. Sign up or log in with your GitHub account

### Step 2: Deploy from GitHub
1. Click **"New Project"** in Railway dashboard
2. Select **"Deploy from GitHub repo"**
3. Choose **"klogins-hash/metamcp-railway-backup"**
4. Railway will automatically detect the `railway.json` and `Dockerfile`

### Step 3: Add PostgreSQL Database
1. In your Railway project dashboard
2. Click **"+ New"** → **"Database"** → **"Add PostgreSQL"**
3. Railway will automatically create database environment variables

### Step 4: Configure Environment Variables
In your Railway project settings, add these variables:

```bash
# Application URLs (replace with your Railway app URL)
APP_URL=https://your-app-name.railway.app
NEXT_PUBLIC_APP_URL=https://your-app-name.railway.app

# Authentication (generate a new secret!)
BETTER_AUTH_SECRET=your-super-secret-key-change-this-in-production

# Node.js Configuration
NODE_ENV=production
NODE_OPTIONS=--max-old-space-size=8192

# MCP Settings
MCP_SESSION_TIMEOUT=300000
MCP_MAX_SESSIONS=10
```

**Note**: Database variables (`DATABASE_URL`, `POSTGRES_HOST`, etc.) are automatically set by Railway's PostgreSQL service.

### Step 5: Deploy & Monitor
1. Railway will automatically build and deploy your application
2. Monitor the deployment logs for any issues
3. Once deployed, visit your app URL to verify it's working
4. Check the health endpoint: `https://your-app-name.railway.app/health`

## 🔄 Auto-Updates Enabled

With GitHub integration, Railway will automatically:
- **Redeploy** when you push changes to the `main` branch
- **Build** using the same Dockerfile and configuration
- **Maintain** your database and environment variables
- **Notify** you of deployment status

## 📊 What's Included

Your deployment includes:
- ✅ **Complete Database Backup** (sanitized for security)
- ✅ **Automatic Database Restoration** on first run
- ✅ **Health Monitoring** with built-in checks
- ✅ **Resource Optimization** for Railway infrastructure
- ✅ **Security Best Practices** with sanitized credentials

## 🔧 Post-Deployment Setup

After successful deployment:

1. **Access MetaMCP Dashboard** at your Railway app URL
2. **Reconfigure API Keys** (see `SECURITY_NOTE.md`)
3. **Test MCP Connections** to ensure services work
4. **Monitor Resource Usage** in Railway dashboard

## 🔒 Security Notes

- **API Keys Sanitized**: All sensitive credentials have been removed from the backup
- **Reconfiguration Required**: You'll need to re-enter your API keys in the MetaMCP dashboard
- **Environment Variables**: Use Railway's secure environment variable system
- **Regular Updates**: Keep your deployment updated by pushing to GitHub

## 🆘 Troubleshooting

### Database Issues
- Check PostgreSQL service is healthy in Railway dashboard
- Verify `DATABASE_URL` is properly set
- Review deployment logs for database initialization errors

### Application Startup Issues
- Ensure all required environment variables are set
- Check that the health endpoint responds
- Monitor memory usage (Railway provides generous limits)

### API Key Configuration
- Access your deployed MetaMCP dashboard
- Navigate to MCP Servers section
- Re-enter your API keys for each service
- Test connections to verify functionality

## 📈 Monitoring & Maintenance

Railway provides:
- **Real-time Logs** for debugging
- **Resource Metrics** (CPU, memory, network)
- **Deployment History** with rollback capability
- **Custom Domains** for production use
- **Automatic SSL** certificates

## 🎯 Next Steps

1. **Deploy Now**: Use the GitHub repository to deploy to Railway
2. **Configure API Keys**: Set up your service integrations
3. **Test Functionality**: Verify all features work as expected
4. **Set Up Monitoring**: Configure alerts and monitoring
5. **Go Live**: Update DNS and start using your new deployment

---

**Repository**: [https://github.com/klogins-hash/metamcp-railway-backup](https://github.com/klogins-hash/metamcp-railway-backup)
**Railway**: [https://railway.app](https://railway.app)
**Support**: See README.md for detailed documentation
