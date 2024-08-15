# frozen_string_literal: true

# Represents a skill match between a job and a job seeker

require_relative 'job_seeker'
require_relative 'job'

class JobMatch
  def initialize(job_seeker:, job:)
    @job_seeker = job_seeker
    @job = job
  end

  def job_seeker_id
    job_seeker.id
  end

  def job_seeker_name
    job_seeker.name
  end

  def job_id
    job.id
  end

  def job_title
    job.title
  end

  def matching_skill_count
    @matching_skill_count ||= job.required_skills.count { |required_skill| job_seeker.skills.include?(required_skill) }
  end

  def matching_skill_percent
    @matching_skill_percent ||= (matching_skill_count.fdiv(job.required_skills.count) * 100).round(1)
  end
end
