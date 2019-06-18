context("test-connect_to_database")

test_that("unmatched database throws error", {
  expect_error(connect_to_database("BLANKDATABASE"), "No config variables available for database: BLANKDATABASE")
})
