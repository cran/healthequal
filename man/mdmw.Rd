% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mdmw.R
\name{mdmw}
\alias{mdmw}
\title{Mean difference from mean (weighted) (MDMW)}
\usage{
mdmw(pop, est, se = NULL, scaleval, sim = NULL, seed = 123456, ...)
}
\arguments{
\item{pop}{The number of people within each subgroup.
Population size must be available for all subgroups.}

\item{est}{The subgroup estimate.
Estimates must be available for all subgroups.}

\item{se}{The standard error of the subgroup estimate.
If this is missing, 95\% confidence intervals of MDMW cannot be calculated.}

\item{scaleval}{The scale of the indicator. For example, the
scale of an indicator measured as a percentage is 100. The
scale of an indicator measured as a rate per 1000 population is 1000.}

\item{sim}{The number of simulations to estimate 95\% confidence intervals}

\item{seed}{The random number generator (RNG) state for the 95\% confidence
interval simulation}

\item{...}{Further arguments passed to or from other methods.}
}
\value{
The estimated MDMW value, corresponding estimated standard error,
and confidence interval as a \code{data.frame}.
}
\description{
The Mean Difference from Mean (MDM) is an absolute measure of inequality
that shows the mean difference between each subgroup and the setting
average. For the weighted version (MDMW), subgroups are weighted according
to their population share.
}
\details{
The weighted version (MDMW) is calculated as the weighted average of
absolute differences between the subgroup estimates and the setting average.
Absolute differences are weighted by each subgroup's population share. For
more information on this inequality measure see Schlotheuber, A., &
Hosseinpoor, A. R. (2022) below.

95\% confidence intervals are calculated using a methodology of simulated
estimates. The dataset is simulated a large number of times (e.g., 100)
and MDMW is calculated for each of the simulated samples. The 95\%
confidence intervals are based on the 2.5th and 97.5th percentiles of the
MDMW results.

\strong{Interpretation:} MDMW only has positive values, with larger values
indicating higher levels of inequality. MDMW is zero if there is no
inequality.

\strong{Type of summary measure:} Complex; absolute; weighted

\strong{Applicability:} Non-ordered; more than two subgroups
}
\examples{
# example code
data(NonorderedSample)
head(NonorderedSample)
with(NonorderedSample,
     mdmw(pop = population,
          est = estimate,
          se = se,
          scaleval = indicator_scale
         )
     )
}
\references{
Schlotheuber, A., & Hosseinpoor, A. R. (2022).
Summary measures of health inequality: A review of existing
measures and their application. International Journal of
Environmental Research and Public Health, 19 (6), 3697.
}
