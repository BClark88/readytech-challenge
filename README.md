## Requirements
* Ruby 3.3.4
* Bundler

## Testing
`bundle exec rake`

## How to run
`ruby app --jobs-csv path/to/csv --job-seekers-csv path/to/csv`
`ruby app --help` will also detail how to run the app


## Assumptions
A well-formed CSV will be parsed in
The `id` column for job-seekers and jobs will be an integer

## Handling large inputs
This should handle files with several hundred lines easily. As few iterations over arrays as possible are done
It will struggle with number in the thousands because of how many items need to be iterated over
If the requirement ended up being that many thousands of applicants need to be matched with many
thousands of jobs I would need to consider an approach using background jobs, so that the task can
eventually complete without causing a server to run out of available memory
