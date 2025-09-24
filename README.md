# MetaMCP Railway Deployment

This package contains everything needed to deploy your MetaMCP instance to Railway with all current configuration and data preserved.

## 📦 Package Contents

- `metamcp_backup.sql` - Complete database backup with all your current data
- `Dockerfile` - Railway-compatible Docker configuration
- `railway.json` - Railway deployment configuration
- `init-db.sh` - Database initialization script
- `.env.example` - Environment variables template
- `docker-compose.railway.yml` - Local testing configuration

## 🚀 Railway Deployment Steps

### 1. Create Railway Account & Install CLI
```bash
# Install Railway CLI
npm install -g @railway/cli

# Login to Railway
railway login
```

### 2. Create New Railway Project
```bash
# Create new project
railway new

# Or link to existing project
railway link
```

### 3. Add PostgreSQL Database
```bash
# Add PostgreSQL service to your project
railway add postgresql
```

### 4. Deploy the Application

#### Option A: Deploy from Local Files
```bash
# Navigate to this directory
cd /root/CascadeProjects/metamcp-railway-backup

# Deploy to Railway
railway up
```

#### Option B: Deploy from GitHub
1. Push this directory to a GitHub repository
2. Connect the repository to Railway
3. Railway will automatically deploy

### 5. Configure Environment Variables

In your Railway dashboard, set these environment variables:

**Required Variables:**
```
NODE_ENV=production
APP_URL=https://your-app-name.railway.app
NEXT_PUBLIC_APP_URL=https://your-app-name.railway.app
BETTER_AUTH_SECRET=your-super-secret-key-change-this-in-production
NODE_OPTIONS=--max-old-space-size=8192
MCP_SESSION_TIMEOUT=300000
MCP_MAX_SESSIONS=10
```

**Database Variables (Auto-configured by Railway PostgreSQL):**
- `DATABASE_URL` - Automatically set by Railway
- `POSTGRES_HOST` - Automatically set by Railway
- `POSTGRES_PORT` - Automatically set by Railway
- `POSTGRES_USER` - Automatically set by Railway
- `POSTGRES_PASSWORD` - Automatically set by Railway
- `POSTGRES_DB` - Automatically set by Railway

### 6. Verify Deployment

1. Check deployment logs in Railway dashboard
2. Visit your app URL: `https://your-app-name.railway.app`
3. Verify health endpoint: `https://your-app-name.railway.app/health`

## 🧪 Local Testing (Optional)

Test the setup locally before deploying:

```bash
# Build and run locally
docker-compose -f docker-compose.railway.yml up --build

# Access at http://localhost:12008
```

## 📊 Current Configuration Preserved

Your deployment will include:

- **Database**: Complete backup of `metamcp_db` with all tables and data
- **Environment**: Production configuration from `mcp.hitsdifferent.ai`
- **Auth Secret**: Your current authentication configuration
- **MCP Settings**: Session timeout (5 minutes) and max sessions (10)
- **Resource Limits**: Optimized for Railway's infrastructure

## 🔧 Troubleshooting

### Database Connection Issues
- Ensure PostgreSQL service is healthy in Railway dashboard
- Check that `DATABASE_URL` is properly set
- Verify database initialization completed in logs

### Memory Issues
- Railway provides sufficient memory for the configured limits
- Monitor resource usage in Railway dashboard
- Adjust `NODE_OPTIONS` if needed

### Health Check Failures
- Check application logs for startup errors
- Verify port 12008 is accessible
- Ensure all environment variables are set

## 🔒 Security Notes

1. **Change the Auth Secret**: Generate a new `BETTER_AUTH_SECRET` for production
2. **Update App URLs**: Replace with your actual Railway app URL
3. **Database Security**: Railway PostgreSQL is automatically secured
4. **Environment Variables**: Never commit actual secrets to version control

## 📈 Monitoring

Railway provides built-in monitoring for:
- Application health and uptime
- Resource usage (CPU, memory, network)
- Database performance
- Deployment logs and metrics

## 🆘 Support

- **Railway Documentation**: https://docs.railway.app/
- **MetaMCP Issues**: https://github.com/metatool-ai/metamcp/issues
- **Railway Community**: https://railway.app/discord

---

**Deployment Date**: $(date)
**Original Instance**: mcp.hitsdifferent.ai
**Database Backup Size**: $(ls -lh metamcp_backup.sql | awk '{print $5}')
