# frozen_string_literal: true

require_relative 'services/job_builder'
require_relative 'services/job_seeker_builder'
require_relative 'services/job_matcher'
require_relative 'services/output_printer'

class CLI
  def run(jobs_csv_path:, job_seekers_csv_path:)
    jobs = JobBuilder.new.call(CSV.open(jobs_csv_path, headers: true))
    job_seekers = JobSeekerBuilder.new.call(CSV.open(job_seekers_csv_path, headers: true))
    matched_jobs = JobMatcher.new(jobs:, job_seekers:).call

    OutputPrinter.new.call(matched_jobs:)
  end
end
