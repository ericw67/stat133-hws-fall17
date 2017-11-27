# ================================================================
# title: tests
# description: assessing the accurancy of the created functions in the hw
# input(s): test case variables into functions
# output(s): whether functions passed each expectation
# ================================================================

install.packages("testthat")
library(testthat)

test_that("remove_missing works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec2 <- c(1,2,3,4,5,NA,NA)
  vec3 <- c(NA, 5)
  expect_equal(remove_missing(vec), c(1,3,7,10))
  expect_equal(remove_missing(vec1), c(10,7,3,1))
  expect_equal(remove_missing(vec2), c(1,2,3,4,5))
  expect_equal(remove_missing(vec3), c(5))
})

test_that("get_minimum works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec2 <- c(1,2,3,4,5,NA,NA)
  vec3 <- c(NA, 5)
  expect_equal(get_minimum(vec, na.rm = TRUE), c(1))
  expect_equal(get_minimum(vec1, na.rm = TRUE), c(1))
  expect_equal(get_minimum(vec2, na.rm = TRUE), c(1))
  expect_equal(get_minimum(vec3, na.rm = TRUE), c(5))
})

test_that("get_maximum works",{
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec2 <- c(1,2,3,4,5,NA,NA)
  vec3 <- c(NA, 5)
  expect_equal(get_maximum(vec, na.rm = TRUE), c(10))
  expect_equal(get_maximum(vec1, na.rm = TRUE), c(10))
  expect_equal(get_maximum(vec2, na.rm = TRUE), c(5))
  expect_equal(get_maximum(vec3, na.rm = TRUE), c(5))
})

test_that("get_range works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec2 <- c(1,2,3,4,5,NA,NA)
  vec3 <- c(NA, 5)
  expect_equal(get_range(vec, na.rm = TRUE), c(9))
  expect_equal(get_range(vec1, na.rm = TRUE), c(9))
  expect_equal(get_range(vec2, na.rm = TRUE), c(4))
  expect_equal(get_range(vec3, na.rm = TRUE), c(0))
})

test_that("get_percentile10 works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec2 <- c(1,2,3,4,5,NA,NA)
  vec3 <- c(NA, 5)
  expect_equal(get_percentile10(vec, na.rm = TRUE), c(1.6))
  expect_equal(get_percentile10(vec1, na.rm = TRUE), c(1.6))
  expect_equal(get_percentile10(vec2, na.rm = TRUE), c(1.4))
  expect_equal(get_percentile10(vec3, na.rm = TRUE), c(5))
})

test_that("get_percentile90 works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec2 <- c(1,2,3,4,5,NA,NA)
  vec3 <- c(NA, 5)
  expect_equal(get_percentile90(vec, na.rm = TRUE), c(9.1))
  expect_equal(get_percentile90(vec1, na.rm = TRUE), c(9.1))
  expect_equal(get_percentile90(vec2, na.rm = TRUE), c(4.6))
  expect_equal(get_percentile90(vec3, na.rm = TRUE), c(5))
})

test_that("get_quartile1 works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec2 <- c(1,2,3,4,5,NA,NA)
  vec3 <- c(NA, 5)
  expect_equal(get_quartile1(vec, na.rm = TRUE), c(2.5))
  expect_equal(get_quartile1(vec1, na.rm = TRUE), c(2.5))
  expect_equal(get_quartile1(vec2, na.rm = TRUE), c(2))
  expect_equal(get_quartile1(vec3, na.rm = TRUE), c(5))
})

test_that("get_quartile3 works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec2 <- c(1,2,3,4,5,NA,NA)
  vec3 <- c(NA, 5)
  expect_equal(get_quartile3(vec, na.rm = TRUE), c(7.75))
  expect_equal(get_quartile3(vec1, na.rm = TRUE), c(7.75))
  expect_equal(get_quartile3(vec2, na.rm = TRUE), c(4))
  expect_equal(get_quartile3(vec3, na.rm = TRUE), c(5))
})

test_that("get_median works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec2 <- c(1,2,3,4,5,NA,NA)
  vec4 <- c(8,15,17,3)
  expect_equal(get_median(vec, na.rm = TRUE), c(5))
  expect_equal(get_median(vec1, na.rm = TRUE), c(5))
  expect_equal(get_median(vec2, na.rm = TRUE), c(3))
  expect_equal(get_median(vec4, na.rm = FALSE), c(11.5))
})

test_that("get_average works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec5 <- c(NA,6,32,2,13,NA)
  vec4 <- c(8,15,17,3)
  expect_equal(get_average(vec, na.rm = TRUE), c(5.25))
  expect_equal(get_average(vec1, na.rm = TRUE), c(5.25))
  expect_equal(get_average(vec5, na.rm = TRUE), c(13.25))
  expect_equal(get_average(vec4, na.rm = FALSE), c(10.75))
})

test_that("get_stdev works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec5 <- c(NA,6,32,2,13,NA)
  vec4 <- c(8,15,17,3)
  expect_equal(get_stdev(vec, na.rm = TRUE), sd(vec, na.rm = TRUE))
  expect_equal(get_stdev(vec1, na.rm = TRUE), sd(vec1, na.rm = TRUE))
  expect_equal(get_stdev(vec5, na.rm = TRUE), sd(vec5, na.rm = TRUE))
  expect_equal(get_stdev(vec4, na.rm = FALSE), sd(vec4))
})

test_that("count_missing works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec5 <- c(NA,6,32,2,13,NA)
  vec4 <- c(8,15,17,3)
  expect_equal(count_missing(vec), c(1))
  expect_equal(count_missing(vec1), c(1))
  expect_equal(count_missing(vec5), c(2))
  expect_equal(count_missing(vec4), c(0))
})

test_that("summary_stats works", {
  vec <- c(1,3,7,NA,10)
  vec1 <- c(10,NA,7,3,1)
  vec5 <- c(NA,6,32,2,13,NA)
  vec4 <- c(8,15,17,3)
  expect_equal(summary_stats(vec, na.rm = TRUE), summary_stats(vec, na.rm = TRUE))
  expect_equal(summary_stats(vec1, na.rm = TRUE), summary_stats(vec, na.rm = TRUE))
  expect_equal(summary_stats(vec5, na.rm = TRUE), summary_stats(vec, na.rm = TRUE))
  expect_equal(summary_stats(vec4, na.rm = FALSE), summary_stats(vec, na.rm = TRUE))
})

#test_that("print_stats works", {
#  vec <- c(1,3,7,NA,10)
#  vec1 <- c(10,NA,7,3,1)
#  vec5 <- c(NA,6,32,2,13,NA)
#  vec4 <- c(8,15,17,3)
#  expect_equal(print_stats(vec, na.rm = TRUE), c(5.25))
#  expect_equal(print_stats(vec1, na.rm = TRUE), c(5.25))
#  expect_equal(print_stats(vec5, na.rm = TRUE), c(13.25))
#  expect_equal(print_stats(vec4, na.rm = FALSE), c(10.75))
#})

test_that("rescale100 works", {
  vec <- c(1,3,7,10)
  vec1 <- c(10,7,3,1)
  vec5 <- c(6,32,2,13)
  vec4 <- c(8,15,17,3)
  xmin = 0
  xmax = 20
  expect_equal(rescale100(vec, xmin, xmax), c(5,15,35,50))
  expect_equal(rescale100(vec1, xmin, xmax), c(50,35,15,5))
  expect_equal(rescale100(vec5, xmin, xmax), c(30,160,10,65))
  expect_equal(rescale100(vec4, xmin, xmax), c(40,75,85,15))
})

test_that("drop_lowest works", {
  vec <- c(1,3,7,10)
  vec1 <- c(10,7,3,1)
  vec5 <- c(6,32,2,13)
  vec4 <- c(8,15,17,3)
  expect_equal(drop_lowest(vec), c(3,7,10))
  expect_equal(drop_lowest(vec1), c(10,7,3))
  expect_equal(drop_lowest(vec5), c(6,32,13))
  expect_equal(drop_lowest(vec4), c(8,15,17))
})

test_that("score_homework works", {
  vec <- c(1,3,7,11)
  vec1 <- c(11,7,3,1)
  vec5 <- c(6,32,2,13)
  vec4 <- c(8,15,17,3)
  expect_equal(score_homework(vec, drop = TRUE), c(7))
  expect_equal(score_homework(vec1, drop = TRUE), c(7))
  expect_equal(score_homework(vec5, drop = FALSE), c(13.25))
  expect_equal(score_homework(vec4, drop = FALSE), c(10.75))
})

test_that("score_quiz works", {
  vec <- c(1,3,7,11)
  vec1 <- c(11,7,3,1)
  vec5 <- c(6,32,2,13)
  vec4 <- c(8,15,17,3)
  expect_equal(score_quiz(vec, drop = TRUE), c(7))
  expect_equal(score_quiz(vec1, drop = TRUE), c(7))
  expect_equal(score_quiz(vec5, drop = FALSE), c(13.25))
  expect_equal(score_quiz(vec4, drop = FALSE), c(10.75))
})

test_that("score_lab works", {
  attendance <- 12
  attendance2 <- 11
  attendance3 <- 3
  attendance4 <- 7
  expect_equal(score_lab(attendance), c(100))
  expect_equal(score_lab(attendance2), c(100))
  expect_equal(score_lab(attendance3), c(0))
  expect_equal(score_lab(attendance4), c(20))
})