# frozen_string_literal: true

require './lib/services/job_matcher'
require './lib/services/output_printer'

RSpec.describe OutputPrinter do
  let(:job) do
    Job.new(id: 1, title: 'Ruby Developer', required_skills: ['Ruby', 'SQL', 'Problem Solving'])
  end

  let(:job_seeker) do
    JobSeeker.new(id: 1, name: 'Alice Seeker', skills: ['Ruby', 'SQL', 'Problem Solving'])
  end

  let(:matched_jobs) do
    [JobMatch.new(job:, job_seeker:)]
  end

  let(:expected_output) do
    <<~CSV
      jobseeker_id,jobseeker_name,job_id,job_title,matching_skill_count,matching_skill_percent
      1,Alice Seeker,1,Ruby Developer,3,100.0,
    CSV
  end

  subject(:output_printer) { described_class.new.call(matched_jobs:) }

  describe '#call' do
    it 'returns a StringIO object formatted like a csv' do
      expect(output_printer.string).to eq expected_output
    end
  end
end
