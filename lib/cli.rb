# frozen_string_literal: true

require_relative 'services/job_builder'
require_relative 'services/job_seeker_builder'
require_relative 'services/job_matcher'

class CLI
  def run(jobs_csv_path:, job_seekers_csv_path:)
    # byebug
    jobs = JobBuilder.new.call(CSV.open(jobs_csv_path, headers: true))
    job_seekers = JobSeekerBuilder.new.call(CSV.open(job_seekers_csv_path, headers: true))
    matched_jobs = JobMatcher.new(jobs:, job_seekers:).call

    print_output(matched_jobs)
  end

  private

  HEADERS = 'jobseeker_id,jobseeker_name,job_id,job_title,matching_skill_count,matching_skill_percent'

  def print_output(matched_jobs)
    output = StringIO.new
    output.puts(HEADERS)

    matched_jobs.each do |matched_job|
      line = "#{matched_job.job_seeker.id},"
      line += "#{matched_job.job_seeker.name},"
      line += "#{matched_job.job.id},"
      line += "#{matched_job.job.title},"
      line += "#{matched_job.matching_skill_count},"
      line += "#{matched_job.matching_skill_percent},"

      output.puts(line)
    end

    output
  end
end
