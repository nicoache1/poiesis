# Binary Gates

All gates are pass/fail. The phase fails if any gate fails.

## Research Gates

1. All 7 files exist: 01-market.md, 02-legal-industry.md, 03-public-data.md, 04-pain-points.md, 05-competitors.md, 06-opportunities.md, 07-idea-variants.md
2. Each of the 7 files has at least 3 distinct URLs (http or https) that appear reachable (well-formed)
3. No fabricated statistics: numeric claims must be adjacent to a URL or an explicit "source unknown" caveat
4. 06-opportunities.md lists at least 3 distinct opportunities, each tied to a specific prior specialist output
5. 07-idea-variants.md contains at least 3 variants scored on fit, moat, monetization, and effort
6. 05-competitors.md has at least 3 competitors with both a name and a URL
7. index.md exists and references all 7 other files by filename
8. All content is in the expected language (en or es) as declared for the run

## Strategy Gates

1. All 5 specialist files exist: 01-competitors-deep-dive.md, 02-legal-country.md, 03-moat-barriers.md, 04-monetization.md, 05-icp-b2b-b2c.md
2. viability-report.md exists and contains a line matching exactly `VERDICT: GO` or `VERDICT: NO-GO` (uppercase)
3. viability-report.md quotes a winning variant by title (if VERDICT is GO)
4. viability-report.md names at least 3 distinct risks with a mitigation each
5. 02-legal-country.md addresses at least one specific target country with regulator citations
6. 04-monetization.md proposes at least 2 monetization models with unit-economics sketches
7. 05-icp-b2b-b2c.md classifies the idea explicitly on the B2B/B2C spectrum and names a primary ICP
8. All content is in the expected language (en or es)

## Technical Feasibility Gates

1. Both specialist files exist: 01-build-assessment.md, 02-risk-scan.md
2. feasibility-report.md exists and contains a line matching exactly `VERDICT: FEASIBLE` or `VERDICT: NOT-FEASIBLE` (uppercase)
3. feasibility-report.md includes estimated effort (person-weeks) and ballpark infrastructure cost
4. 01-build-assessment.md lists at least 3 MVP epics with T-shirt sizes
5. 02-risk-scan.md identifies at least 3 risks with severity and mitigation
6. All content is in the expected language (en or es)

## GTM Gates

1. gtm/design/prototype/index.html exists and renders correctly when opened in a browser
2. gtm/design/screenshots/ contains at least one PNG file
3. gtm/video/promo.mp4 exists, is non-empty, and `ffprobe` reports duration > 0
4. gtm/video/frames/ contains at least 3 sampled frames
5. gtm/marketing/ contains: copywriting.md, social-content.md, launch-strategy.md, sales-enablement.md, cold-email.md, icp-detailed.md, channels.md, search-queries.md
6. FINAL_REPORT.md exists with summary, links to each artifact, and 3 concrete next steps
7. All content is in the expected language (en or es)

## Pre-sales Gates

1. All 5 specialist files exist: 01-commercial-proposal.md, 02-pricing-model.md, 03-technical-summary.md, 04-risk-mitigation-plan.md, 05-case-for-action.md
2. proposal-package.md exists with table of contents, executive brief, and next steps
3. 01-commercial-proposal.md includes investment summary (not placeholder)
4. 02-pricing-model.md proposes at least 2 pricing options with rate assumptions and payment milestones
5. 03-technical-summary.md includes a simplified architecture diagram (mermaid)
6. 04-risk-mitigation-plan.md includes at least 5 risks with mitigations and a risk matrix
7. 05-case-for-action.md includes ROI timeline and cost of inaction
8. All content is in the expected language (en or es)
