# ================================================================
# title: tester-script
# description: script to test written functions
# input(s): functions.R
# output(s): test-reporter.txt
# ================================================================

# test script
library(testthat)

# source in functions to be tested
source('./stat133/stat133-hws-fall17/hw04/code/functions.R')

sink('./stat133/stat133-hws-fall17/hw04/output/test-reporter.txt')
test_file('./stat133/stat133-hws-fall17/hw04/code/tests.R')
sink()