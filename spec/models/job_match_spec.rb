# frozen_string_literal: true

require './lib/models/job_match'

RSpec.describe JobMatch do
  let(:name) { 'Jackie Daytona' }
  let(:skills) { ['C#', 'Ruby', 'Javascript'] }

  let(:job_seeker) { JobSeeker.new(id: 42, name: 'Jackie Daytona', skills: ['C#', 'Ruby']) }
  let(:job) { Job.new(id: 1337, title: 'Code Overlord', required_skills: ['C#', 'Ruby', 'Javascript']) }
  subject(:job_match) { described_class.new(job_seeker:, job:) }

  describe '#job_seeker_id' do
    it 'returns the id of the job_seeker' do
      expect(job_match.job_seeker_id).to eq(job_seeker.id)
    end
  end

  describe '#job_seeker_name' do
    it 'returns the name of the job_seeker' do
      expect(job_match.job_seeker_name).to eq(job_seeker.name)
    end
  end

  describe '#job_id' do
    it 'returns the id of the job_seeker' do
      expect(job_match.job_id).to eq(job.id)
    end
  end

  describe '#job_title' do
    it 'returns the title' do
      expect(job_match.job_title).to eq(job.title)
    end
  end

  describe '#matching_skill_count' do
    it "returns the count of a JobSeeker's skills that match the Job's required skills" do
      expect(job_match.matching_skill_count).to eq(2)
    end
  end

  describe '#matching_skill_percent' do
    it "returns the percentage of a JobSeeker's skills that match the Job's required skills" do
      expect(job_match.matching_skill_percent).to eq(66.7)
    end
  end
end
