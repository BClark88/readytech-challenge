# frozen_string_literal: true

# Represents a skill match between a job and a job seeker

require_relative './job_seeker'
require_relative './job'

class JobMatch
  attr_reader :job_seeker, :job

  def initialize(job_seeker:, job:)
    @job_seeker = job_seeker
    @job = job
  end

  def matching_skill_count
    @matching_skill_count ||= job.required_skills.count { |required_skill| job_seeker.skills.include?(required_skill) }
  end

  def matching_skill_percent
    @matching_skill_percent ||= (matching_skill_count.fdiv(job.required_skills.count) * 100).round(1)
  end
end
