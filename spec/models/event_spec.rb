require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe '予定投稿' do
    context '予定が投稿できる場合' do
      it 'titleとstart_timeが存在していれば保存できる' do
        expect(@event).to be_valid
      end
      it 'contentが空でも保存できる' do
        @event.content = ''
        expect(@event).to be_valid
      end
    end

    context '予定が投稿できない場合' do
      it 'titleが空では保存できない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end
      it 'start_timeが空では保存できない' do
        @event.start_time = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Start time can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("User must exist")
      end
    end
  end
end