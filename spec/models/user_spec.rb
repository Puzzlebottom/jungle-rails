require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should not throw any errors when all fields are valid' do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'test@test.test',
        password: 'testtest',
        password_confirmation: 'testtest'
      )
      @user.save!

      expect(@user.id).to be_present
    end

    describe 'password' do
      it 'should throw an error if password is missing' do
        @user = User.new(
          first_name: 'test',
          last_name: 'test',
          email: 'test@test.test',
          password: nil,
          password_confirmation: 'testtest'
        )
        @user.save

        expect(@user.errors.full_messages)
          .to eq ["Password can't be blank", 'Password is too short (minimum is 8 characters)']
      end

      it 'should throw an error if password_confimation is missing' do
        @user = User.new(
          first_name: 'test',
          last_name: 'test',
          email: 'test@test.test',
          password: 'testtest',
          password_confirmation: nil
        )
        @user.save

        expect(@user.errors.full_messages)
          .to eq ["Password confirmation can't be blank"]
      end

      it 'should throw an error if password does not match password_confirmation' do
        @user = User.new(
          first_name: 'test',
          last_name: 'test',
          email: 'test@test.test',
          password: 'testtest',
          password_confirmation: 'nomatch'
        )
        @user.save

        expect(@user.errors.full_messages)
          .to eq ["Password confirmation doesn't match Password"]
      end

      it 'should throw an error if password is less than 8 characters' do
        @user = User.new(
          first_name: 'test',
          last_name: 'test',
          email: 'test@test.test',
          password: 'short',
          password_confirmation: 'short'
        )
        @user.save

        expect(@user.errors.full_messages)
          .to eq ['Password is too short (minimum is 8 characters)']
      end
    end

    describe 'email' do
      it 'should throw an error if email is missing' do
        @user = User.new(
          first_name: 'test',
          last_name: 'test',
          email: nil,
          password: 'testtest',
          password_confirmation: 'testtest'
        )
        @user.save

        expect(@user.errors.full_messages)
          .to eq ["Email can't be blank"]
      end

      it 'should throw an error if email already exists' do
        @user1 = User.new(
          first_name: 'test',
          last_name: 'test',
          email: 'test@test.test',
          password: 'testtest',
          password_confirmation: 'testtest'
        )
        @user1.save

        @user2 = User.new(
          first_name: 'test',
          last_name: 'test',
          email: 'test@test.test',
          password: 'testtest',
          password_confirmation: 'testtest'
        )
        @user2.save

        expect(@user2.errors.full_messages)
          .to eq ['Email has already been taken']
      end

      it 'should validate email uniqueness case-insensitively' do
        @user1 = User.new(
          first_name: 'test',
          last_name: 'test',
          email: 'test@test.test',
          password: 'testtest',
          password_confirmation: 'testtest'
        )
        @user1.save

        @user2 = User.new(
          first_name: 'test',
          last_name: 'test',
          email: 'TEST@TEST.TEST',
          password: 'testtest',
          password_confirmation: 'testtest'
        )
        @user2.save

        expect(@user2.errors.full_messages)
          .to eq ['Email has already been taken']
      end
    end

    describe 'name' do
      it 'should throw an error if first_name is missing' do
        @user = User.new(
          first_name: nil,
          last_name: 'test',
          email: 'test@test.test',
          password: 'testtest',
          password_confirmation: 'testtest'
        )
        @user.save

        expect(@user.errors.full_messages)
          .to eq ["First name can't be blank"]
      end

      it 'should throw an error if last_name is missing' do
        @user = User.new(
          first_name: 'test',
          last_name: nil,
          email: 'test@test.test',
          password: 'testtest',
          password_confirmation: 'testtest'
        )
        @user.save

        expect(@user.errors.full_messages)
          .to eq ["Last name can't be blank"]
      end
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return a user object if the credentials are valid' do
      @user = User.new(
        first_name: 'Albus',
        last_name: 'Dumbleedoo',
        email: 'headmaster@hogwarts.wiz',
        password: 'grindelwald',
        password_confirmation: 'grindelwald'
      )
      @user.save

      @authenticated_user = User.authenticate_with_credentials('headmaster@hogwarts.wiz', 'grindelwald')

      expect(@authenticated_user).to be_a User
    end

    it 'should return nil if the user does not exist' do
      @authenticated_user = User.authenticate_with_credentials('halfblood.prince@yahoo.com', 'lilyevans')

      expect(@authenticated_user).to be_nil
    end

    it 'should return nil if the password is incorrect' do
      @user = User.new(
        first_name: 'Albus',
        last_name: 'Dumbleedoo',
        email: 'headmaster@hogwarts.wiz',
        password: 'grindelwald',
        password_confirmation: 'grindelwald'
      )
      @user.save

      @authenticated_user = User.authenticate_with_credentials('headmaster@hogwarts.wiz', 'dancelikenobodyswatching')

      expect(@authenticated_user).to be_nil
    end

    it 'should trim whitespace from email' do
      @user = User.new(
        first_name: 'Albus',
        last_name: 'Dumbleedoo',
        email: 'headmaster@hogwarts.wiz',
        password: 'grindelwald',
        password_confirmation: 'grindelwald'
      )
      @user.save

      @authenticated_user = User.authenticate_with_credentials('   headmaster@hogwarts.wiz   ', 'grindelwald')

      expect(@authenticated_user).to be_a User
    end

    it 'should validate email case insensitively' do
      @user = User.new(
        first_name: 'Albus',
        last_name: 'Dumbleedoo',
        email: 'Headmaster@hogwarts.wiz',
        password: 'grindelwald',
        password_confirmation: 'grindelwald'
      )
      @user.save

      @authenticated_user = User.authenticate_with_credentials('HEADMASTER@HOGWARTS.WIZ', 'grindelwald')

      expect(@authenticated_user).to be_a User
    end
  end
end
