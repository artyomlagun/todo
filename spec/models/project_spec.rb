require 'rails_helper'
require 'spec_helper'

RSpec.describe Project, type: :model do
  describe 'creation' do
    context 'valid attributes' do
      it 'should be valid' do
        project = FactoryGirl.build(:project)
        expect(project).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'should be invalid title' do
        project = FactoryGirl.build(:project, title: '')
        expect(project).not_to be_valid
      end
      it 'should be invalid description' do
        project = FactoryGirl.build(:project, description: '')
        expect(project).not_to be_valid
      end
      it 'should be invalid short description' do
        project = FactoryGirl.build(:project, short_desc: '')
        expect(project).not_to be_valid
      end
      it 'should be uniqeness title' do
        project = FactoryGirl.create(:project)
        project_dup = project.dup
        expect(project_dup).not_to be_valid
      end
    end
  end
end
