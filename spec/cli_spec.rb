# frozen_string_literal: true

require 'byebug'
require './lib/cli'

RSpec.describe CLI do
  describe '#run' do
    let(:jobs_csv_path) { "#{RSPEC_ROOT}/fixtures/jobs.csv" }
    let(:job_seekers_csv_path) { "#{RSPEC_ROOT}/fixtures/job_seekers.csv" }

    let(:expected_output) do
      <<~CSV
        jobseeker_id,jobseeker_name,job_id,job_title,matching_skill_count,matching_skill_percent
        1,Alice Seeker,1,Ruby Developer,3,100.0,
        1,Alice Seeker,2,Frontend Developer,0,0.0,
        1,Alice Seeker,3,Backend Developer,2,50.0,
        1,Alice Seeker,4,Fullstack Developer,1,16.7,
        1,Alice Seeker,5,Machine Learning Engineer,0,0.0,
        1,Alice Seeker,6,Cloud Architect,0,0.0,
        1,Alice Seeker,7,Data Analyst,1,25.0,
        1,Alice Seeker,8,Web Developer,0,0.0,
        1,Alice Seeker,9,Python Developer,2,50.0,
        1,Alice Seeker,10,JavaScript Developer,0,0.0,
        2,Bob Applicant,1,Ruby Developer,0,0.0,
        2,Bob Applicant,2,Frontend Developer,3,75.0,
        2,Bob Applicant,3,Backend Developer,0,0.0,
        2,Bob Applicant,4,Fullstack Developer,2,33.3,
        2,Bob Applicant,5,Machine Learning Engineer,0,0.0,
        2,Bob Applicant,6,Cloud Architect,0,0.0,
        2,Bob Applicant,7,Data Analyst,0,0.0,
        2,Bob Applicant,8,Web Developer,1,25.0,
        2,Bob Applicant,9,Python Developer,0,0.0,
        2,Bob Applicant,10,JavaScript Developer,1,25.0,
      CSV
    end

    subject(:run) { described_class.new.run(jobs_csv_path:, job_seekers_csv_path:) }
    it 'parses the provided CSVs and returns the expected output' do
      res = run
      expect(res.string).to eq expected_output
    end
  end
end
