library(tidyverse)
library(gtsummary)

# Load and clean data
nlsy_cols <- c(
	"glasses", "eyesight", "sleep_wkdy", "sleep_wknd",
	"id", "nsibs", "samp", "race_eth", "sex", "region",
	"income", "res_1980", "res_2002", "age_bir"
)
nlsy <- read_csv(here::here("data", "raw", "nlsy.csv"),
								 na = c("-1", "-2", "-3", "-4", "-5", "-998"),
								 skip = 1, col_names = nlsy_cols
) |>
	mutate(
		region_cat = factor(region, labels = c("Northeast", "North Central", "South", "West")),
		sex_cat = factor(sex, labels = c("Male", "Female")),
		race_eth_cat = factor(race_eth, labels = c("Hispanic", "Black", "Non-Black, Non-Hispanic")),
		eyesight_cat = factor(eyesight, labels = c("Excellent", "Very good", "Good", "Fair", "Poor")),
		glasses_cat = factor(glasses, labels = c("No", "Yes"))
	)

# create basic table stratified by sex and use helper function to find sleep variables
#then label and get rid of missing
#then add p-values
tbl_summary(
	nlsy,

	by = sex_cat,

	include = c(
		race_eth_cat, region_cat, income, starts_with("sleep")
	),

	label = list(
		race_eth_cat ~ "Race/ethnicity",
		region_cat ~ "Region",
		sleep_wkdy ~ "Sleep on Weekdays",
		sleep_wknd ~ "Sleep on Weekends",
		income ~ "Income"
	),

	missing_text = "Missing",

	statistic = list(starts_with("sleep") ~ "min = {min}; max ~ {max}", income ~ "{p10} to {p90}"),

	digits = list(starts_with("sleep") ~ c (1,1), income ~ c(3,3))

) |>

	add_p(test = list(
		all_continuous() ~ "t.test",
		all_categorical() ~ "chisq.test"
	)) |>

add_overall(col_label = "**Total** N = {N}")
