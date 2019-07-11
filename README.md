
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->

# regplateR

`regplateR` provides functions that validate and, in some cases, date
registration plate formats that matches the common patterns of GB
registration plates. It was inspired by this
[gist](https://gist.github.com/harry-jones/755501192139820eeb65e030fe878f75).
and further information can be found on the corresponding [wikipedia
page](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom).

## Installation

``` r
# Development version from GitHub
devtools::install_github("tjtnew/regplateR")
```

## Example

``` r
library(regplateR)

# example plates
reg_plates <-   c("BD63 SMR", "BD15 SMR", "BD50 SMR", # current
                 "test", "test",                      # invalid
                 "P888 PPE",                          # prefix
                 "FVL 144M",                          # suffix
                 "112 DFH", "MLP 6")                  # dateless

# valid registrations
valid_idx <- valid_reg(reg_plates)
valid_plates <- reg_plates[valid_idx]
valid_plates
#> [1] "BD63 SMR" "BD15 SMR" "BD50 SMR" "P888 PPE" "FVL 144M" "112 DFH" 
#> [7] "MLP 6"

# earliest registration of plates
reg_plates_date <- reg_date(valid_plates)
reg_plates_date
#> [1] "2013-09-01" "2015-03-01" "2050-03-01" "1996-08-01" "1973-08-01"
#> [6] NA           NA
```

| Registrations | Date       |
| :------------ | :--------- |
| BD63 SMR      | 2013-09-01 |
| BD15 SMR      | 2015-03-01 |
| BD50 SMR      | 2050-03-01 |
| P888 PPE      | 1996-08-01 |
| FVL 144M      | 1973-08-01 |
| 112 DFH       | NA         |
| MLP 6         | NA         |

## Overview

For the moment `regplateR` is quite broad in what is accepted as a valid
plate, with four different formats currently accepted with no additional
rules
applied.

#### [Current GB format](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom#Current_system)

Current car registration plates (from 01 September 2001) must be of the
form:

  - 2 letters, 2 numbers, 3 letters (e.g. BD51
SMR)

#### [Prefix GB format](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom#1983_to_2001)

Between 01 August 1983 and 31 August 2001 registration plates had a one
letter prefix and were of the form:

  - 1 letter, 1 to 3 numbers, 3 letters (e.g. P888
PPE)

#### [Suffix GB format](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom#1963_to_1982)

Between February 1963 to 31 July 1983 registration plates had a one
letter suffix and were of the form:

  - 3 letters, 1 to 3 numbers, 1 letter (e.g. FVL
144M)

#### [Dateless format](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom#History)

Pre 1963 (I think) registration plates had one of the following forms:

  - 1 to 4 numbers, 1 to 2 letters
  - 1 to 3 numbers, 1 to 3 letters (e.g. 112 DFH)
  - 1 to 2 letters, 1 to 4 numbers
  - 1 to 3 letters, 1 to 3 numbers (e.g. MLP 6)

Confusingly these can also overlap with Northern Ireland (NI) plates
that take a similar form. At present the package makes no attempts to
identify NI plates.