# frozen_string_literal: true

require './lib/models/job'

RSpec.describe Job do
  let(:id) { 42 }
  let(:title) { 'Keyboard Warrior' }
  let(:required_skills) { ['C#', 'Ruby', 'Javascript'] }

  subject(:job) { Job.new(id:, title:, required_skills:) }

  describe 'attributes' do
    it 'has an id' do
      expect(job.id).to eq(id)
    end

    it 'has a title' do
      expect(job.title).to eq(title)
    end

    it 'has required_skills' do
      expect(job.required_skills).to eq(required_skills)
    end
  end
end
