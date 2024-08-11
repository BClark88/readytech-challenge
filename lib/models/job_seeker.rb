# frozen_string_literal: true

# `jobseekers.csv`: This file contains information about jobseekers. Each row represents a jobseeker and has the following columns:
#
# * `id`: A unique identifier for the jobseeker.
# * `name`: The name of the jobseeker.
# * `skills`: A comma-separated list of the jobseeker's skills.
#
class JobSeeker
  attr_reader :id, :name, :skills

  def initialize(id:, name:, skills:)
    @id = id
    @name = name
    @skills = skills
  end
end
