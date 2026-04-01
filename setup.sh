#!/bin/bash
set -e

KIT_DIR="$HOME/ai-linkedin-kit"

# ===================================================================
# ai-linkedin-kit setup script
# Creates the full LinkedIn writing assistant workspace
# ===================================================================

# Backup existing installation
if [ -d "$KIT_DIR" ]; then
  BACKUP_DIR="$HOME/ai-linkedin-kit-backup-$(date +%Y%m%d-%H%M%S)"
  echo "Existing ai-linkedin-kit found. Backing up to: $BACKUP_DIR"
  mv "$KIT_DIR" "$BACKUP_DIR"
fi

echo "Creating ai-linkedin-kit workspace..."

# -------------------------------------------------------------------
# Create directory structure
# -------------------------------------------------------------------
mkdir -p "$KIT_DIR/.claude/skills/digest-brand"
mkdir -p "$KIT_DIR/.claude/skills/style-capture"
mkdir -p "$KIT_DIR/.claude/skills/add-source"
mkdir -p "$KIT_DIR/.claude/skills/study-creator"
mkdir -p "$KIT_DIR/.claude/skills/linkedin-post/templates"
mkdir -p "$KIT_DIR/.claude/skills/batch-create"
mkdir -p "$KIT_DIR/.claude/skills/hook-workshop"
mkdir -p "$KIT_DIR/.claude/agents"
mkdir -p "$KIT_DIR/identity/writing-samples"
mkdir -p "$KIT_DIR/identity/brand-document-original"
mkdir -p "$KIT_DIR/identity/creator-studies"
mkdir -p "$KIT_DIR/content-strategy"
mkdir -p "$KIT_DIR/posts/drafts"
mkdir -p "$KIT_DIR/posts/published"
mkdir -p "$KIT_DIR/posts/batches"

# -------------------------------------------------------------------
# Create empty identity files (onboarding mode detection)
# -------------------------------------------------------------------
touch "$KIT_DIR/identity/brand-profile.md"
touch "$KIT_DIR/identity/style-profile.md"

# -------------------------------------------------------------------
# Note: In the full version, all skill files, templates, agents,
# and supporting content would be created inline via heredocs here.
# For the full content, clone the repository instead:
#   git clone https://github.com/[owner]/ai-linkedin-kit.git ~/ai-linkedin-kit
# -------------------------------------------------------------------

echo ""
echo "================================================"
echo "  ai-linkedin-kit workspace created!"
echo "  Location: $KIT_DIR"
echo ""
echo "  Next steps:"
echo "  1. Open Claude Code"
echo "  2. Navigate to $KIT_DIR"
echo "  3. Claude will walk you through setup"
echo "================================================"
