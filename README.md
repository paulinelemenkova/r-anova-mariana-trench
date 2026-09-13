# R ANOVA — Analysis of Variance of Mariana Trench Factors

R script performing an analysis of variance (ANOVA) on the geomorphic factors of the Mariana Trench and checking the model assumptions (normality of residuals, residuals-versus-fitted homoscedasticity).

## Related publication

This script produced figures in the article, whose abstract explicitly lists the R library {car} for ANOVA:

Lemenkova, P. An Empirical Study of R Applications for Data Analysis in Marine Geology. Marine Science and Technology Bulletin 2019, 8(1), 1-9.

- DOI: https://doi.org/10.33714/masteb.486678
- figshare: https://doi.org/10.6084/m9.figshare.7358201
- HAL: https://hal.science/hal-02068709
- Zenodo: https://zenodo.org/record/2594673
- SSRN: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3353073
- ISSN: 2147-9666 (Web of Science)

## Script

- ANOVA.R: reads Morphology.csv, fits a linear/ANOVA model of a response factor against grouping factors (car / stats aov), and produces the diagnostic plots - residuals versus fitted and a normal Q-Q check of the normality assumption.

## Methods

- Analysis of variance (ANOVA) with model-assumption diagnostics (normality, homoscedasticity).

## Data

- Morphology.csv: per-profile morphometric/geological factors of the Mariana Trench.

## Requirements

- R (>= 3.5); packages: car, stats

## Author and citation

Polina Lemenkova — ORCID https://orcid.org/0000-0002-5759-1089

Cite: Lemenkova, P. An Empirical Study of R Applications for Data Analysis in Marine Geology. Marine Science and Technology Bulletin 2019, 8(1), 1-9. https://doi.org/10.33714/masteb.486678

## License

MIT — see LICENSE (Copyright Polina Lemenkova).
