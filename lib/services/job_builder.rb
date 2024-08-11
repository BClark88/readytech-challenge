# frozen_string_literal: true

require 'csv'
require_relative '../models/job'

class JobBuilder
  def call(jobs_csv)
    jobs_csv.each do |row|
      parsed_skills = parse_skills(row['required_skills'])

      job = Job.new(id: row['id'], title: row['title'], required_skills: parsed_skills)

      jobs.push(job)
    end

    jobs
  end

  private

  def jobs
    @jobs ||= []
  end

  def parse_skills(skills)
    skills.split(',')
  end
end
