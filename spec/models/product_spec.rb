require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validators' do
    subject { described_class.new(attributes).tap(&:validate) }

    context 'without code' do
      let(:attributes) { { code: nil, name: 'Test tshirt', price: 9.99 } }

      it { is_expected.to be_invalid }
    end

    context 'without name' do
      let(:attributes) { { code: 'TSHIRT', name: nil, price: 9.99 } }

      it { is_expected.to be_invalid }
    end

    context 'without price' do
      let(:attributes) { { code: 'TSHIRT', name: 'Test tshirt', price: nil } }

      it { is_expected.to be_invalid }
    end

    context 'with negative price' do
      let(:attributes) { { code: 'TSHIRT', name: 'Test tshirt', price: -1.0 } }

      it { is_expected.to be_invalid }
    end

    context 'with correct attributes' do
      let(:attributes) { { code: 'TSHIRT', name: 'Test tshirt', price: 9.99 } }

      it { is_expected.to be_valid }
    end
  end
end
