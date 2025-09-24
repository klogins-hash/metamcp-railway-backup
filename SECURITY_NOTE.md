# Security Notice

## Database Backup Sanitization

The `metamcp_backup.sql` file has been sanitized for security:

- **API Keys Redacted**: All API keys and tokens have been replaced with placeholder values
- **Original Data Preserved**: The database structure and non-sensitive data remain intact
- **Restoration Process**: During Railway deployment, you'll need to reconfigure your API keys

## API Keys That Need Reconfiguration

After deploying to Railway, you'll need to set up these API keys in your MetaMCP dashboard:

1. **OpenAI API Key** - For AI/LLM functionality
2. **GitHub Token** - For GitHub integrations
3. **Cartesia API Key** - For voice/audio services
4. **OpenRouter API Key** - For additional AI models
5. **Tavily API Key** - For web search capabilities
6. **OpenMemory API Key** - For memory services
7. **Other Service Keys** - As needed for your specific integrations

## How to Reconfigure

1. Deploy the application to Railway
2. Access your MetaMCP dashboard
3. Navigate to MCP Servers configuration
4. Re-enter your API keys for each service
5. Test the connections to ensure they work

## Security Best Practices

- Never commit real API keys to version control
- Use Railway's environment variables for sensitive data
- Regularly rotate your API keys
- Monitor API key usage for unusual activity

---

**Note**: This sanitization ensures your sensitive credentials are not exposed in the public repository while preserving all the structural data needed for a successful migration.
