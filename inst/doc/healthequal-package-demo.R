## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      results = TRUE,
                      warning = FALSE,
                      message = FALSE,
                      comment = "",
                      collapse = FALSE,
                      class.source = "bg-success",
                      class.output="bg-warning"
                      )

## ----setup--------------------------------------------------------------------
library(healthequal)
require(dplyr)

## ----class.source="bg-success"------------------------------------------------
data(OrderedSample)
head(OrderedSample)

## ----class.source="bg-success"------------------------------------------------
data(NonorderedSample)
head(NonorderedSample)

## -----------------------------------------------------------------------------
data(OrderedSampleMultipleind)
head(OrderedSampleMultipleind)

## -----------------------------------------------------------------------------
data(NonorderedSampleMultipleind)
head(NonorderedSampleMultipleind)

## -----------------------------------------------------------------------------
?healthequal::OrderedSample
?healthequal::NonorderedSample
?healthequal::OrderedSampleMultipleind
?healthequal::NonorderedSampleMultipleind
?healthequal::IndividualSample

## -----------------------------------------------------------------------------
?aci

## -----------------------------------------------------------------------------
with(OrderedSample,
     aci(est = estimate,
         subgroup_order = subgroup_order,
         pop = population
         )
     )

## -----------------------------------------------------------------------------
?sii

## -----------------------------------------------------------------------------
with(IndividualSample,
     aci(est = sba,
         subgroup_order = subgroup_order,
         weight = weight,
         psu = psu,
         strata = strata
          )
     )

## -----------------------------------------------------------------------------
with(NonorderedSample,
     bgv(pop = population,
         est = estimate,
         se = se
         )
     )

## -----------------------------------------------------------------------------
head(NonorderedSampleMultipleind)
unique(NonorderedSampleMultipleind$indicator)

## -----------------------------------------------------------------------------
library(dplyr)
measures <- NonorderedSampleMultipleind %>%
  dplyr::group_by(indicator) %>%
  dplyr::summarize(covar(pop = population,
                   est = estimate,
                   scaleval = indicator_scale
                   )
  )

measures  


## -----------------------------------------------------------------------------
multiplemeasures <- NonorderedSampleMultipleind %>%
  dplyr::group_by(indicator,
                  dimension) %>%
  dplyr::summarize(
    covar = covar(pop = population,
                        est = estimate,
                        scaleval = indicator_scale),
    bgv = bgv(pop = population,
                    est = estimate,
                    se = se   
                    )
            ) 
  
multiplemeasures

# It is possible to extract the measures separetly
multiplemeasures$covar
multiplemeasures$bgv


