# frozen_string_literal: true

require './lib/services/job_builder'

RSpec.describe JobBuilder do
  let(:csv_data) do
    <<~CSV
      id,title,required_skills
      1,Ruby Developer,"Ruby, SQL, Problem Solving"
      2,Frontend Developer,"JavaScript, HTML/CSS, React, Teamwork"
    CSV
  end

  let(:input_csv) do
    CSV.new(csv_data, headers: true)
  end

  let(:expected_output) do
    [
      Job.new(id: 1, title: 'Ruby Developer', required_skills: ['Ruby', 'SQL', 'Problem Solving']),
      Job.new(id: 2, title: 'Frontend Developer', required_skills: ['JavaScript', 'HTML/CSS', 'React', 'Teamwork'])
    ]
  end

  subject(:job_builder) { described_class.new.call(input_csv) }

  describe '#call' do
    it 'returns an array of JobSeeker objects' do
      expect(job_builder[0].instance_variables).to eq(expected_output[0].instance_variables)
      expect(job_builder[1].instance_variables).to eq(expected_output[1].instance_variables)
    end
  end
end
