# env-variable-loader

A bash script that loads environment-specific variables from a single `.env` file. Filters variables by environment prefix and exports them without the prefix.

## Usage

```bash
./load-env.sh <ENV> <ENV_FILE>
```

**Example:**
```bash
./load-env.sh staging ./config.env
```

## Example

Variables prefixed with the environment name (uppercase) are exported without the prefix:

- File contains: `STAGING_DB_HOST=localhost` and `STAGING_DEBUG=true`
- Running: `./load-env.sh staging config.env`
- Result: Exports `DB_HOST=localhost` and `DEBUG=true`

## Environment File Format

```bash
# config.env

STAGING_DB_HOST=staging-db.example.com
STAGING_DB_PASSWORD=secret123
STAGING_DEBUG=true

PRODUCTION_DB_HOST=prod-db.example.com
PRODUCTION_DB_PASSWORD=super_secret
PRODUCTION_DEBUG=false
```

## Use in Scripts

```bash
#!/bin/bash
source ./load-env.sh staging ./config.env

echo "Database: $DB_HOST"
```

## Notes

- Environment prefix must be uppercase (e.g., `STAGING_`, not `staging_`)
- Add environment files to `.gitignore` if they contain sensitive data
- Script validates file existence and requires exactly 2 arguments
