require 'rails_helper'

RSpec.describe User, type: :model do
  valid_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postCount: 1)
  invalid_name_user = User.new(name: nil, photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                               postCount: 2)
  invalid_post_type_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                    bio: 'Teacher from Mexico.', postCount: 'string')
  invalid_negative_post_count_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                              bio: 'Teacher from Mexico.', postCount: -1)
  context 'test valid users' do
    it 'validate true for valid user' do
      expect(valid_user).to be_valid
    end
  end
  context 'test invalid users' do
    it 'validate true for valid user' do
      expect(valid_user).to be_valid
    end
    it 'invalidate user with no name' do
      expect(invalid_name_user).not_to be_valid
    end
    it 'invalidate user with string post count' do
      expect(invalid_post_type_user).not_to be_valid
    end
    it 'invalidate user with negative post count' do
      expect(invalid_negative_post_count_user).not_to be_valid
    end
  end

  context 'save and retrive valid user' do
    it 'save valid user and retirive it from database' do
      valid_user.save
      expect(User.find(valid_user.id)).to be_an_instance_of(User)
    end
  end

  context 'fail to save hence should not retrive invalid user' do
    it 'fail to save invalid user' do
      expect(invalid_name_user.save).to eq false
    end
  end
end
