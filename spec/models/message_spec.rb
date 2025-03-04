require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it 'contentとimageが存在していれば保存できる' do
        expect(@message).to be_valid
      end
      it 'contentが空でも保存できる' do
        @message.content = ''
        expect(@message).to be_valid
      end
      it 'imageが空でも保存できる' do
        @message.image = nill
        expect(@message).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'contentとimageが空では保存できない' do
        @message.content = ''
        @message.image = nill
        @message.valid?
        expect(@message.errors.full_messages).to include('User must exist')
      end
      it 'roomが紐付いていないと保存できない' do
        @message.room = nill
        @message.valid?
        expect(@message.errors.full_message).to include('Room must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @message.user = nill
        @message.valid?
        expect(@message.errors.full_messages).to include('User must exist')
      end
    end
  end
en