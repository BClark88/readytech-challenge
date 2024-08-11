# frozen_string_literal: true

require './lib/models/job_seeker'

RSpec.describe JobSeeker do
  let(:id) { 42 }
  let(:name) { 'Jackie Daytona' }
  let(:skills) { ['C#', 'Ruby', 'Javascript'] }

  subject(:job_seeker) { JobSeeker.new(id:, name:, skills:) }

  describe 'attributes' do
    it 'has an id' do
      expect(job_seeker.id).to eq(id)
    end

    it 'has a name' do
      expect(job_seeker.name).to eq(name)
    end

    it 'has skills' do
      expect(job_seeker.skills).to eq(skills)
    end
  end
end
