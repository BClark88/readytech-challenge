# frozen_string_literal: true

class OutputPrinter
  HEADERS = 'jobseeker_id,jobseeker_name,job_id,job_title,matching_skill_count,matching_skill_percent'
  def call(matched_jobs:)
    output = StringIO.new
    output.puts(HEADERS)

    matched_jobs.each do |matched_job|
      line = "#{matched_job.job_seeker_id},"
      line += "#{matched_job.job_seeker_name},"
      line += "#{matched_job.job_id},"
      line += "#{matched_job.job_title},"
      line += "#{matched_job.matching_skill_count},"
      line += "#{matched_job.matching_skill_percent},"

      output.puts(line)
    end

    output
  end
end
