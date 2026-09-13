# ============================================================================
# ANOVA (analysis of variance) of Mariana Trench factors (R, car).
# This produced figures in the peer-reviewed article:
#   Lemenkova, P. (2019). An Empirical Study of R Applications for Data Analysis
#   in Marine Geology. Marine Science and Technology Bulletin, 8(1), 1-9.
#   DOI: https://doi.org/10.33714/masteb.486678
#   figshare: https://doi.org/10.6084/m9.figshare.7358201
#   HAL: https://hal.science/hal-02068709  Zenodo: https://zenodo.org/record/2594673
# Author: Polina Lemenkova | ORCID: 0000-0002-5759-1089
# ============================================================================

# ANOVA (Analysis of Variance)
# ЧАСТЬ-1. готовим датафрейм. 
	# шаг-1. вчитываем таблицу с данными. делаем из нее исходный датафрейм.
MDepths <- read.csv("Morphology.csv", header=TRUE, sep = ",")
MDF <- na.omit(MDepths) 
row.has.na <- apply(MDF, 1, function(x){any(is.na(x))}) 
sum(row.has.na) 
head(MDF)

MDTt = melt(setDT(MDF), measure = patterns("^plate"), value.name = c("tectonics"))
head(MDTt)


# шаг-2 Compute one-way ANOVA test. We want to know if there is any significant difference between the average values of angles in the 4 tectonic plates. The R function aov() can be used to answer to this question. The function summary.aov() is used to summarize the analysis of variance model.

# Compute the analysis of variance
res.aov <- aov(tectonics ~ variable, data = MDTt)
# Summary of the analysis
summary(res.aov)

#  Interpret the result of one-way ANOVA tests:  As the p-value is less than the significance level 0.05, we can conclude that there are significant differences between the groups highlighted with “*" in the model summary.

# шаг-3 Tukey multiple pairwise-comparisonsю As the ANOVA test is significant, we can compute Tukey HSD (Tukey Honest Significant Differences, R function: TukeyHSD()) for performing multiple pairwise-comparison between the means of groups. The function TukeyHD() takes the fitted ANOVA as an argument.

TukeyHSD(res.aov)

# diff: difference between means of the two groups
# lwr, upr: the lower and the upper end point of the confidence interval at 95% (default)
# p adj: p-value after adjustment for the multiple comparisons.

# It can be seen from the output, that only the difference between plate Mariana and plate Pacific is significant (=24.12) with an adjusted p-value of 0.8601221.

# 2 вариант - через пакетclibrary(multcomp) Pairewise t-test. The function pairewise.t.test() can be also used to calculate pairwise comparisons between group levels with corrections for multiple testing.

pairwise.t.test(MDTt$tectonics, MDTt$variable, p.adjust.method = "BH")

# Plot Homogeneity of variances

plot(res.aov, 1)

# It’s also possible to use Bartlett’s test or Levene’s test to check the homogeneity of variances.  We recommend Levene’s test, which is less sensitive to departures from normal distribution. The function leveneTest() [in car package] will be used:

library(car)
leveneTest(tectonics ~ variable, data = MDTt)

# Welch one-way test. An alternative procedure (i.e.: Welch one-way test), that does not require that assumption have been implemented in the function oneway.test(). ANOVA test with no assumption of equal variances

oneway.test(tectonics ~ variable, data = MDTt)

# Shapiro test
aov_residuals <- residuals(object = res.aov )
shapiro.test(x = aov_residuals )

# non-parametric alternative to one-way ANOVA is Kruskal-Wallis rank sum test,
kruskal.test(tectonics ~ variable, data = MDTt)


