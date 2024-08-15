# frozen_string_literal: true

require './lib/services/job_matcher'

RSpec.describe JobMatcher do
  let(:ruby_job) do
    Job.new(id: 1, title: 'Ruby Developer', required_skills: ['Ruby', 'SQL', 'Problem Solving'])
  end

  let(:front_end_job) do
    Job.new(id: 2, title: 'Frontend Developer', required_skills: ['JavaScript', 'HTML/CSS', 'React', 'Teamwork'])
  end

  let(:jobs) do
    array_of_jobs = [ruby_job, front_end_job]

    array_of_jobs.sort_by(&:id).reverse
  end

  let(:job_seeker_alice) do
    JobSeeker.new(id: 1, name: 'Alice Seeker', skills: ['Ruby', 'SQL', 'Problem Solving'])
  end

  let(:job_seeker_bob) do
    JobSeeker.new(id: 2, name: 'Bob Applicant', skills: ['JavaScript', 'HTML/CSS', 'Teamwork'])
  end

  let(:job_seekers) do
    array_of_seekers = [job_seeker_alice, job_seeker_bob]

    array_of_seekers.sort_by(&:id).reverse
  end

  subject(:job_matcher) { described_class.new(jobs:, job_seekers:).call }

  describe '#call' do
    it 'returns an array of JobSeeker objects, sorted by Jobseeker.id and suitability' do
      expect(job_matcher[0].job_seeker_id).to eq(job_seeker_alice.id)
      expect(job_matcher[0].job_id).to eq(ruby_job.id)

      expect(job_matcher[1].job_seeker_id).to eq(job_seeker_alice.id)
      expect(job_matcher[1].job_id).to eq(front_end_job.id)

      expect(job_matcher[2].job_seeker_id).to eq(job_seeker_bob.id)
      expect(job_matcher[2].job_id).to eq(front_end_job.id)

      expect(job_matcher[3].job_seeker_id).to eq(job_seeker_bob.id)
      expect(job_matcher[3].job_id).to eq(ruby_job.id)
    end
  end
end
