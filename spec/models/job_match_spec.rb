# frozen_string_literal: true

require './lib/models/job_match'

RSpec.describe JobMatch do
  let(:name) { 'Jackie Daytona' }
  let(:skills) { ['C#', 'Ruby', 'Javascript'] }

  let(:job_seeker) { JobSeeker.new(id: 42, name: 'Jackie Daytone', skills: ['C#', 'Ruby']) }
  let(:job) { Job.new(id: 1337, title: 'Code Overlord', required_skills: ['C#', 'Ruby', 'Javascript']) }
  subject(:job_match) { JobMatch.new(job_seeker:, job:) }

  describe '#matching_skill_percent' do
    it "returns the percentage of a JobSeeker's skills that match the Job's required skills" do
      expect(job_match.matching_skill_percent).to eq(66.7)
    end
  end
end
