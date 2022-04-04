require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    @diary = FactoryBot.build(:diary)
  end

  describe '日記投稿' do
    context '日記投稿できる場合' do
      it 'diary_dateとtitleが存在していれば投稿できる' do
        expect(@diary).to be_valid
      end

      it 'textが空でも投稿できる' do
        @diary.text = ''
        expect(@diary).to be_valid
      end

      it 'imagesが空でも投稿できる' do
        @diary.images = nil
        expect(@diary).to be_valid
      end
    end

    context '日記投稿できない場合' do
      it 'diary_dateが空では投稿できない' do
        @diary.diary_date = ''
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Diary date can't be blank")
      end

      it 'titleが空では投稿できない' do
        @diary.title = ''
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Title can't be blank")
      end

      it 'titleが14文字以上では投稿できない' do
        @diary.title = 'testtesttesttest'
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Title is too long (maximum is 14 characters)")
      end

      it 'imagesがpng,jpg,jpeg以外では投稿できない' do
        @diary.images.attach(io: File.open('public/images/ojigi_man.gif'), filename: 'ojigi_man.gif')
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Images has an invalid content type")
      end

      it 'imagesが4つ以上では投稿できない' do
        @diary.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        @diary.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        @diary.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        @diary.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Images は3つまでです")
      end

      it 'userが紐づいていないと投稿できない' do
        @diary.user = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("User must exist")
      end
    end

  end
end