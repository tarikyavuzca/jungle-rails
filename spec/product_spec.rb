require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:category) {
    Category.new(name: "testCategory")
  }
  subject {
    category.products.new(
      name: "Product",
      description: "test product",
      image: "testImage",
      price_cents: 1500,
      quantity: 7,
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq "Name can't be blank"
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Quantity can't be blank"
    end
  end
end