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

## GTM Gates

1. gtm/design/prototype/index.html exists and renders correctly when opened in a browser
2. gtm/design/screenshots/ contains at least one PNG file
3. gtm/video/promo.mp4 exists, is non-empty, and `ffprobe` reports duration > 0
4. gtm/video/frames/ contains at least 3 sampled frames
5. gtm/marketing/ contains: copywriting.md, social-content.md, launch-strategy.md, sales-enablement.md, cold-email.md, icp-detailed.md, channels.md, search-queries.md
6. FINAL_REPORT.md exists with summary, links to each artifact, and 3 concrete next steps
7. All content is in the expected language (en or es)
