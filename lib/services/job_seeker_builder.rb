# frozen_string_literal: true

require 'csv'
require_relative '../models/job_seeker'

class JobSeekerBuilder
  def call(job_seeker_csv)
    job_seeker_csv.each do |row|
      parsed_skills = parse_skills(row['skills'])

      job_seeker = JobSeeker.new(id: row['id'], name: row['name'], skills: parsed_skills)

      job_seekers.push(job_seeker)
    end
    job_seekers
  end

  private

  def job_seekers
    @job_seekers ||= []
  end

  def parse_skills(skills)
    skills.split(',')
  end
end
