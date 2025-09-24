#!/bin/bash

echo "🔍 MetaMCP Railway Backup Verification"
echo "======================================"

# Check if backup file exists and has content
if [ -f "metamcp_backup.sql" ]; then
    BACKUP_SIZE=$(ls -lh metamcp_backup.sql | awk '{print $5}')
    BACKUP_LINES=$(wc -l < metamcp_backup.sql)
    echo "✅ Database backup found: $BACKUP_SIZE ($BACKUP_LINES lines)"
else
    echo "❌ Database backup not found!"
    exit 1
fi

# Check for required files
REQUIRED_FILES=("Dockerfile" "railway.json" "init-db.sh" ".env.example" "README.md")

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file found"
    else
        echo "❌ $file missing!"
        exit 1
    fi
done

# Check backup content
echo ""
echo "📊 Database Backup Analysis:"
echo "----------------------------"

# Count tables in backup
TABLE_COUNT=$(grep -c "CREATE TABLE" metamcp_backup.sql)
echo "Tables: $TABLE_COUNT"

# Count data inserts
INSERT_COUNT=$(grep -c "INSERT INTO" metamcp_backup.sql)
echo "Data inserts: $INSERT_COUNT"

# Check for key tables
KEY_TABLES=("users" "sessions" "connections" "tools")
echo ""
echo "Key tables found:"
for table in "${KEY_TABLES[@]}"; do
    if grep -q "CREATE TABLE.*$table" metamcp_backup.sql; then
        echo "✅ $table"
    else
        echo "⚠️  $table (may not exist or have different name)"
    fi
done

echo ""
echo "🎉 Backup verification completed!"
echo ""
echo "Next steps:"
echo "1. Install Railway CLI: npm install -g @railway/cli"
echo "2. Login to Railway: railway login"
echo "3. Create new project: railway new"
echo "4. Add PostgreSQL: railway add postgresql"
echo "5. Deploy: railway up"
echo ""
echo "📖 See README.md for detailed instructions"
