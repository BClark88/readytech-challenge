# frozen_string_literal: true

require_relative 'lib/cli'
require 'optparse'

Options = Struct.new(:jobs_csv_path, :job_seekers_csv_path)
args = Options.new

parser = OptionParser.new do |act|
  act.on('--jobs-csv FILE_PATH', 'path to the csv file containing the list of jobs') do |arg|
    args.jobs_csv_path = arg
  end

  act.on('--job-seekers-csv FILE_PATH', 'path to the csv file containing the list of job seekers') do |arg|
    args.job_seekers_csv_path = arg
  end
end

parser.parse!

cli_output = CLI.new.run(jobs_csv_path: args.jobs_csv_path, job_seekers_csv_path: args.job_seekers_csv_path)

puts cli_output.string
