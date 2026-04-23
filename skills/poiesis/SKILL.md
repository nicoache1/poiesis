---
name: poiesis
description: >
  Automated product discovery harness. Takes a raw idea and runs it through
  Research → Strategy (go/no-go) → Technical Feasibility (feasible/not-feasible)
  → GTM (design + video + marketing) → Pre-sales (commercial proposal).
  Produces a knowledge base, viability report, feasibility assessment, working
  prototype, promo video, marketing kit, and client-ready proposal. Invoke as /poiesis.
---

# Poiesis Run

When invoked, you are the main orchestration agent. You receive an idea (title + description + language) and run it through three phases sequentially. Each phase produces artifacts in a run directory.

Do NOT run this skill in a subagent. Subagents are spawned from this context.

## Setup

1. Ask the user for: idea title, idea description, and language (en/es).
2. Create a run directory: `runs/run-YYYYMMDD-NNN/`.
3. All phase outputs go under this run directory.

## Phase 1: Research

Invoke @research-director with the idea context. It spawns 7 specialists in parallel and consolidates into `research/index.md`.

**Gate:** After research completes, verify using the binary checks in `agents/references/gates.md` (Research section). If any check fails, retry the phase (max 3 attempts). On retry, feed the failure reasons back to @research-director.

**Expected output:**
```
research/
  01-market.md
  02-legal-industry.md
  03-public-data.md
  04-pain-points.md
  05-competitors.md
  06-opportunities.md
  07-idea-variants.md
  index.md
```

## Phase 2: Strategy

Invoke @strategy-director with the idea context + all research output. It spawns 5 specialists and produces `strategy/viability-report.md` with a `VERDICT: GO` or `VERDICT: NO-GO`.

**Gate:** Verify using binary checks in `agents/references/gates.md` (Strategy section).

**On NO-GO:** Write `FINAL_REPORT.md` explaining why the idea is not viable, referencing the viability report. Stop the pipeline. Do not proceed to Phase 3.

**On GO:** Proceed to Phase 3.

**Expected output:**
```
strategy/
  01-competitors-deep-dive.md
  02-legal-country.md
  03-moat-barriers.md
  04-monetization.md
  05-icp-b2b-b2c.md
  viability-report.md
```

## Phase 3: Technical Feasibility

Invoke @technical-feasibility-director with the idea context + all research and strategy output. It spawns 4 specialists and produces `technical/feasibility-report.md` with a `VERDICT: FEASIBLE` or `VERDICT: NOT-FEASIBLE`.

**Gate:** Verify using binary checks in `agents/references/gates.md` (Technical Feasibility section).

**On NOT-FEASIBLE:** Write `FINAL_REPORT.md` explaining why the idea is not technically viable, referencing both the viability report (GO) and the feasibility report (NOT-FEASIBLE). Stop the pipeline. Do not proceed to Phase 4.

**On FEASIBLE:** Proceed to Phase 4.

**Expected output:**
```
technical/
  01-architecture-assessment.md
  02-effort-estimation.md
  03-third-party-dependencies.md
  04-technical-risks.md
  feasibility-report.md
```

## Phase 4: GTM

Invoke @gtm-director with the idea + research + strategy + technical context. It runs three sub-teams:

1. **Design** (first, blocks video): Two designers + consolidator → working Next.js prototype
2. **Video** (parallel with marketing): Remotion promo video → rendered mp4
3. **Marketing** (parallel with video): 5 specialists + 3 derived assets

The GTM Director consolidates everything into `FINAL_REPORT.md`.

**Gate:** Verify using binary checks in `agents/references/gates.md` (GTM section).

**Expected output:**
```
gtm/
  design/
    ui-ux-brief.md
    prototype/   (Next.js app)
    screenshots/ (Playwright or static capture)
  video/
    remotion-project/
    promo.mp4
    frames/
  marketing/
    copywriting.md
    social-content.md
    launch-strategy.md
    sales-enablement.md
    cold-email.md
    icp-detailed.md
    channels.md
    search-queries.md
FINAL_REPORT.md
```

## Phase 5: Pre-sales

Invoke @presales-director with the idea context + all prior phase output. It spawns 5 specialists and produces a complete commercial proposal package.

**Gate:** Verify using binary checks in `agents/references/gates.md` (Pre-sales section).

**Expected output:**
```
presales/
  01-commercial-proposal.md
  02-pricing-model.md
  03-technical-summary.md
  04-risk-mitigation-plan.md
  05-case-for-action.md
  proposal-package.md
```

## Phase 6: Done

Print summary: phases completed, verdict, artifacts produced, and total duration.

## Gate Verification

Each phase gate uses a two-step process:

1. **Self-check:** Verify the binary checks in `agents/references/gates.md` for the current phase.
2. **Codex adversarial review:** Run `/codex:adversarial-review --wait` against the phase output. Codex acts as an independent adversarial evaluator — it challenges the quality, completeness, and accuracy of the artifacts.

If either step fails:
1. Log which checks failed and why.
2. Re-invoke the phase director with the failure feedback.
3. Max 3 retries per phase. After 3 failures, halt and report to user.

## Dependencies

This harness assumes the following skills/plugins are installed:
- `aris` (research-lit)
- `marketingskills` (competitor-profiling, competitor-alternatives, pricing-strategy, customer-research, copywriting, social-content, launch-strategy, sales-enablement, cold-email)
- `ui-ux-pro-max`
- `frontend-design`
- `remotion-best-practices`
- `codex` plugin (`/codex:adversarial-review` for QA gates)

External tools: markitdown (`npm install -g markitdown`), Playwright (or Chromium), ffmpeg, ffprobe.

For web research, agents use Claude's built-in WebSearch/WebFetch tools. For extracting clean content from web pages, they use markitdown.
