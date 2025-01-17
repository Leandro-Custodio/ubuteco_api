require 'rails_helper'

RSpec.describe Abilities::CashRegisterAbility, type: :ability do
  describe "abilities" do

    before :all do
      @organization = create(:organization)
      @user = create(:user_cash_register, organization: @organization)
      @order = create(:order, :with_items, organization: @organization, user: @user)
      @table = create(:table, organization: @organization)
      @wine = create(:wine, organization: @organization)
      @beer = create(:beer, organization: @organization)
      @dish = create(:dish, organization: @organization)
      @drink = create(:drink, organization: @organization)
      @food = create(:food, organization: @organization)
      @maker = create(:maker, organization: @organization)
      @customer = create(:user_customer)
    end

    subject { described_class.new(user: @user, params: { order_id: @order.id }, controller_name: "Api::Kitchens") }

    context "when is an cash register" do
      context 'can' do
        it { is_expected.to be_able_to(:read, @dish) }
        it { is_expected.to be_able_to(:read, @beer) }
        it { is_expected.to be_able_to(:read, @wine) }
        it { is_expected.to be_able_to(:read, @drink) }
        it { is_expected.to be_able_to(:read, @food) }
        it { is_expected.to be_able_to(:create, @order) }
        it { is_expected.to be_able_to(:read, @order) }
        it { is_expected.to be_able_to(:update, @order) }
        it { is_expected.to be_able_to(:destroy, @order) }
        it { is_expected.to be_able_to(:read, @order.order_items.sample) }
        it { is_expected.to be_able_to(:create, @order.order_items.sample) }
        it { is_expected.to be_able_to(:update, @order.order_items.sample) }
        it { is_expected.to be_able_to(:destroy, @order.order_items.sample) }
        context 'in users controller' do
          subject { described_class.new(user: @user, params: { order_id: @order.id }, controller_name: "Api::Users") }
          it { is_expected.to be_able_to(:read, @user) }
          it { is_expected.to be_able_to(:update, @user) }
        end
        context 'in customers controller' do
          subject { described_class.new(user: @user, params: { order_id: @order.id }, controller_name: "Api::Customers") }
          it { is_expected.to be_able_to(:read, @customer) }
        end
      end
    end
  end
end
