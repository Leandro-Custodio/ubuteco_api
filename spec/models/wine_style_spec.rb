# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WineStyle, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations' do
    it { is_expected.to have_many(:wines) }
  end
end
