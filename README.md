# Bash Scripting

A collection of bash script snippets and utilities for DevOps and system administration.

## Scripts

### [env-variable-loader](env-variable-loader/)

Loads environment-specific variables from a single `.env` file. Filters variables by environment prefix and exports them without the prefix.

**Use case:** Manage multiple environments (staging, production, development) in one configuration file.

### [systemd-ping-monitor](systemd-ping-monitor/)

A systemd service that monitors network connectivity by pinging a target IP address. Logs state changes and uses systemd watchdog for health monitoring.

**Use case:** Monitor network availability and automatically restart on connectivity issues.
