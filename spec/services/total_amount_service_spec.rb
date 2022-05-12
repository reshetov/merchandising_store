require 'rails_helper'

describe TotalAmountService, type: :service do
  describe 'total amount calculation' do
    let!(:mug) { create(:product) }
    let!(:tshirt) { create(:product, :tshirt) }
    let!(:hoodie) { create(:product, :hoodie) }

    subject { described_class.new(params: request_params).call }

    context 'without discount' do
      let(:request_params) { { discount: nil, items: } }

      context 'Items: 1 MUG, 1 TSHIRT, 1 HOODIE' do
        let(:items) { { mug.id => 1, tshirt.id => 1, hoodie.id => 1 } }

        it { is_expected.to eq(41.00) }
      end

      context 'Items: 2 MUG, 1 TSHIRT' do
        let(:items) { { mug.id => 2, tshirt.id => 1 } }

        it { is_expected.to eq(27.00) }
      end

      context 'Items: 3 MUG, 1 TSHIRT' do
        let(:items) { { mug.id => 3, tshirt.id => 1 } }

        it { is_expected.to eq(33.00) }
      end

      context 'Items: 2 MUG, 4 TSHIRT, 1 HOODIE' do
        let(:items) { { mug.id => 2, tshirt.id => 4, hoodie.id => 1 } }

        it { is_expected.to eq(92.00) }
      end
    end

    context 'with discount' do
      let(:request_params) { { discount: 1, items: } }

      context 'Items: 1 MUG, 1 TSHIRT, 1 HOODIE' do
        let(:items) { { mug.id => 1, tshirt.id => 1, hoodie.id => 1 } }

        it { is_expected.to eq(41.00) }
      end

      context 'Items: 9 MUG, 1 TSHIRT' do
        let(:items) { { mug.id => 9, tshirt.id => 1 } }

        it { is_expected.to eq(69.00) }
      end

      context 'Items: 45 MUG, 3 TSHIRT' do
        let(:items) { { mug.id => 45, tshirt.id => 3 } }

        it { is_expected.to eq(279.90) }
      end

      context 'Items: 200 MUG, 4 TSHIRT, 1 HOODIE' do
        let(:items) { { mug.id => 200, tshirt.id => 4, hoodie.id => 1 } }

        it { is_expected.to eq(902.00) }
      end
    end
  end
end
