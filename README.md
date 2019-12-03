TSA Firearms Discoveries
========================

In various blog posts from the TSA, [example here](https://www.tsa.gov/blog/2019/02/07/tsa-year-review-record-setting-2018), they have shown year-over-year
increases in the number of firearms discovered in carry-on bags, have an infographic about the "top 10 airports
for firearm discoveries". Though these infographics appear to be accurate, they do not tell the whole story.
What happens to this list when you control for number of passengers? What happens when you aggregate data by
state or metro area? TSA reports that the total number has gone up, but are some airports increasing at a faster rate than others? These and others are the questions to be answered here.

This package is a framework for helping deal with TSA's data. They only appear to be available as links on their blog, and in PDF format. Most of what this package deals with is handling of these files and aggregating to a database that can be analyzed.

To install
----------
1. The PDF extracting tools require libpoppler, you'll need to install that first
2. Install other dependencies (`readr`, `pdftools`)
3. You may need to do something to set up the database, but that's very much in-progress

TODO
----
- `pdfDataToTbl` fails if a "page" has one row- fix by going through a temp file?
