require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should not throw any errors when all fields are valid' do
      @category = Category.new(name: 'test-category')
      @category.save
      @product = Product.new(name: 'test_product', price_cents: 1, quantity: 1, category_id: @category.id)
      @product.save!

      expect(@product.id).to be_present
    end

    describe '#name' do
      it 'should throw an error if name is missing' do
        @category = Category.new(name: 'test-category')
        @category.save
        @product = Product.new(name: nil, price_cents: 1, quantity: 1, category_id: @category.id)
        @product.save

        expect(@product.errors.full_messages).to eq ["Name can't be blank"]
      end
    end

    describe '#name' do
      it 'should throw an error if price is missing' do
        @category = Category.new(name: 'test-category')
        @category.save
        @product = Product.new(name: 'test_product', price_cents: nil, quantity: 1, category_id: @category.id)
        @product.save

        expect(@product.errors.full_messages).to eq ['Price cents is not a number', 'Price is not a number',
                                                     "Price can't be blank"]
      end
    end

    describe '#name' do
      it 'should throw an error if quantity is missing' do
        @category = Category.new(name: 'test-category')
        @category.save
        @product = Product.new(name: 'test_product', price_cents: 1, quantity: nil, category_id: @category.id)
        @product.save

        expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
      end
    end

    describe '#name' do
      it 'should throw an error if category is missing' do
        @category = Category.new(name: 'test-category')
        @category.save
        @product = Product.new(name: 'test_product', price_cents: 1, quantity: 1, category_id: nil)
        @product.save

        expect(@product.errors.full_messages).to eq ['Category must exist', "Category can't be blank"]
      end
    end
  end
end
