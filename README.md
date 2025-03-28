# GitHub Actions Free Space

This repository contains a bash script to free up disk space on GitHub Actions runners.

## Purpose

GitHub Actions runners come with many pre-installed tools and packages that you may not need for your specific workflow. This script helps reclaim disk space by removing unnecessary components, which can be useful when:

- Your workflow requires additional disk space
- You're working with large artifacts or dependencies
- You need to prevent "no space left on device" errors

## Usage

### In a GitHub Actions workflow

Add this to your GitHub Actions workflow:

```yaml
- name: Free up disk space
  run: |
    curl -fsSL https://raw.githubusercontent.com/blatr/github-actions-free-space/main/free_space.sh | bash
```

## What it removes

- Various programming language runtimes and SDKs
- Cloud provider CLI tools
- Containerization and orchestration tools
- Web browsers
- Unused Docker images and build caches

## Credits

This script is a combination of techniques from:
- Apache Arrow GitHub Actions workflows
- Community-based solutions for GitHub Actions disk space optimization
