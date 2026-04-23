#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────
# Poiesis installer — installs the skill, agents, and references
# for Claude Code at project or user level.
# ─────────────────────────────────────────────────────────────────────────────

POIESIS_DIR="$(cd "$(dirname "$0")" && pwd)"

bold='\033[1m'
dim='\033[2m'
green='\033[0;32m'
cyan='\033[0;36m'
red='\033[0;31m'
reset='\033[0m'

info()  { printf "${cyan}[poiesis]${reset} %s\n" "$1"; }
ok()    { printf "${green}[poiesis]${reset} %s\n" "$1"; }
err()   { printf "${red}[poiesis]${reset} %s\n" "$1" >&2; }

check_source_files() {
    local missing=0
    for f in \
        "$POIESIS_DIR/new-skills/poiesis/SKILL.md" \
        "$POIESIS_DIR/agents/research-director.md" \
        "$POIESIS_DIR/agents/strategy-director.md" \
        "$POIESIS_DIR/agents/gtm-director.md" \
        "$POIESIS_DIR/agents/references/gates.md"; do
        if [ ! -f "$f" ]; then
            err "Missing source file: $f"
            missing=1
        fi
    done
    if [ "$missing" -eq 1 ]; then
        err "Source files missing. Run from the poiesis repo root."
        exit 1
    fi
}

install_project() {
    local target="$1"
    info "Installing for Claude Code (project) into: $target"

    mkdir -p "$target/.claude/skills/poiesis"
    cp "$POIESIS_DIR/new-skills/poiesis/SKILL.md" "$target/.claude/skills/poiesis/SKILL.md"
    info "Copied skill: SKILL.md"

    mkdir -p "$target/.claude/agents/references"
    for agent in research-director strategy-director gtm-director; do
        cp "$POIESIS_DIR/agents/${agent}.md" "$target/.claude/agents/${agent}.md"
        info "Copied agent: ${agent}.md"
    done
    cp "$POIESIS_DIR/agents/references/gates.md" "$target/.claude/agents/references/gates.md"
    info "Copied reference: gates.md"

    ok "Project installation complete."
}

install_user() {
    local home_claude="$HOME/.claude"
    info "Installing for Claude Code (user) into: $home_claude"

    mkdir -p "$home_claude/skills/poiesis"
    cp "$POIESIS_DIR/new-skills/poiesis/SKILL.md" "$home_claude/skills/poiesis/SKILL.md"
    info "Copied skill: SKILL.md"

    mkdir -p "$home_claude/agents/references"
    for agent in research-director strategy-director gtm-director; do
        cp "$POIESIS_DIR/agents/${agent}.md" "$home_claude/agents/${agent}.md"
        info "Copied agent: ${agent}.md"
    done
    cp "$POIESIS_DIR/agents/references/gates.md" "$home_claude/agents/references/gates.md"
    info "Copied reference: gates.md"

    ok "User installation complete. Poiesis available in all sessions."
}

main() {
    printf "\n"
    printf "${bold}  Poiesis Installer${reset}\n"
    printf "${dim}  Idea → Research → Strategy → GTM harness${reset}\n"
    printf "\n"

    check_source_files

    printf "  Install scope:\n\n"
    printf "    ${bold}p)${reset} Project  ${dim}— install into a specific project directory${reset}\n"
    printf "    ${bold}u)${reset} User     ${dim}— install globally${reset}\n"
    printf "\n  Choose ${dim}[p/u]${reset}: "
    read -r scope_choice
    printf "\n"

    case "$scope_choice" in
        p|P|project)
            printf "  Target directory ${dim}(default: current)${reset}: "
            read -r target_input
            local target
            if [ -z "$target_input" ]; then
                target="$(pwd)"
            else
                target="$(cd "$target_input" && pwd)"
            fi
            install_project "$target"
            ;;
        u|U|user)
            install_user
            ;;
        *)
            err "Invalid choice: $scope_choice"
            exit 1
            ;;
    esac

    printf "\n"
    ok "Done! Start a session and say:"
    printf "    ${bold}/poiesis${reset}\n\n"
}

main "$@"
