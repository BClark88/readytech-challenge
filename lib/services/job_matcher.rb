require_relative '../models/job_match'
require 'byebug'

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

    job_matches.flatten
  end

  private

  def job_matches
    @job_matches ||= []
  end
end
