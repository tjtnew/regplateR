test_that("current_reg correctly identifies current registration plates", {
    plates <- c("BD51 SMR", "Zippy", "Bungle55", "BD51 SMR")
    test_case <- current_reg(plates)
    target <- c(1L, 4L)
    expect_identical(test_case, target)
})

test_that("test prefix_reg correctly identifies prefix registration plates", {
    plates <- c("P888 PPE", "BD51 SMR", "Bungle55", "P888 PPE")
    test_case <- prefix_reg(plates)
    target <- c(1L, 4L)
    expect_identical(test_case, target)
})

test_that("test suffix_reg correctly identifies prefix registration plates", {
    plates <- c("P888 PPE", "BD51 SMR", "FVL 144M", "P888 PPE")
    test_case <- suffix_reg(plates)
    target <- 3L
    expect_identical(test_case, target)
})

test_that("test dateless_reg correctly identifies dateless registration plates", {
    plates <- c("P888 PPE", "BD51 SMR", "FVL 144M", "P888 PPE", "112 DFH", "MLP 6")
    test_case <- dateless_reg(plates)
    target <- c(5L, 6L)
    expect_identical(test_case, target)
})

test_that("test_that valid_reg correctly validates plates", {
    plates <- c("BD63 SMR", "BD15 SMR", "BD50 SMR",
                "test", "test",
                "P888 PPE", "FVL 144M", "112 DFH", "MLP 6")
    test_case <- valid_reg(plates)
    target <- c(1L, 2L, 3L, 6L, 7L, 8L, 9L)
    expect_identical(test_case, target)
})

test_that("test reg_date correctly dates plates", {
    plates <- c("BD63 SMR", "BD15 SMR", "BD50 SMR",
                "P888 PPE",
                "FVL 144M",
                "112 DFH", "MLP 6")
    test_case <- regplateR:::reg_date(plates)
    target <- as.Date(c("2013-09-01", "2015-03-01", "2050-03-01",
                        "1996-08-01",
                        "1973-08-01",
                        NA, NA))
    expect_identical(test_case, target)
})


