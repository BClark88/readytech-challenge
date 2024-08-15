# frozen_string_literal: true

require_relative '../models/job_match'

class JobMatcher
  def initialize(jobs:, job_seekers:)
    @jobs = jobs
    @job_seekers = job_seekers
  end

  def call
    @job_seekers.each do |job_seeker|
      matched_jobs = @jobs.map { |job| JobMatch.new(job_seeker:, job:) }

      job_matches.push(matched_jobs)
    end

    job_matches.flatten!

    sort_matches!

    job_matches
  end

  private

  def job_matches
    @job_matches ||= []
  end

  def sort_matches!
    # sort_by! sorts by the lowest value, so make matching_skill_percent a negative number
    # not the nicest approach, but it avoids hard to read comparisons, and additional iterations
    job_matches.sort_by! do |job_match|
      [job_match.job_seeker.id, -job_match.matching_skill_percent, job_match.job.id]
    end
  end
end
