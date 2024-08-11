# frozen_string_literal: true

# * `id`: A unique identifier for the job.
# * `title`: The title of the job.
# * `required_skills`: A comma-separated list of skills required for the job.

class Job
  attr_reader :id, :title, :required_skills

  def initialize(id:, title:, required_skills:)
    @id = id
    @title = title
    @required_skills = required_skills
  end
end
