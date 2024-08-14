# frozen_string_literal: true

class JobSeeker
  attr_reader :id, :name, :skills

  def initialize(id:, name:, skills:)
    @id = id
    @name = name
    @skills = skills
  end
end
