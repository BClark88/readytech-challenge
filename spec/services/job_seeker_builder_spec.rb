# frozen_string_literal: true

require 'tempfile'
require './lib/services/job_seeker_builder'

RSpec.describe JobSeekerBuilder do
  let(:csv_data) do
    <<~CSV
      id,name,skills
      1,Alice Seeker,"Ruby, SQL, Problem Solving"
      2,Bob Applicant,"JavaScript, HTML/CSS, Teamwork"
    CSV
  end

  let(:input_csv) do
    CSV.new(csv_data, headers: true)
  end

  let(:expected_output) do
    [
      JobSeeker.new(id: 1, name: 'Alice Seeker', skills: ['Ruby', 'SQL', 'Problem Solving']),
      JobSeeker.new(id: 2, name: 'Bob Applicant', skills: ['JavaScript', 'HTML/CSS', 'Teamwork'])
    ]
  end

  subject(:job_seeker_builder) { described_class.new.call(input_csv) }
  describe '#call' do
    it 'returns an array of JobSeeker objects' do
      expect(job_seeker_builder[0].instance_variables).to eq(expected_output[0].instance_variables)
      expect(job_seeker_builder[1].instance_variables).to eq(expected_output[1].instance_variables)
    end
  end
end
