# encoding: utf-8
require 'rails_helper'

RSpec.describe UserDetail, type: :model do
  
  ##let!(:target_ip) { "127.0.0.1" }
  let!(:future) { "ここにはテキストが入ります" }
  ##inquiry_ip_addresses = create_list(:inquiry_ip_address, 100).count

  #before do
    let!(:user) { User.create(name: 'spec', gender: 1, note: 'テキスト', email: 'abc@gmail.com', tel: '080-5505-7408' ) }
    #user = double(User)
    #allow(User).to receive(:create).and_return(user)
    let!(:INQUIRY_MONITORIG_PERIOD) { 10 }
  #end
  let!(:user_detail) { create(:user_detail, user_id: user.id, future: "将来") }
  let!(:many_user_details) { create_list(:user_detail, 100, user_id: user.id, future: "将来") }

  #describe 'within_predetermined_count?' do
  describe 'within_predetermined_future?' do

    ##所定の回数
    ##Settings.MAX_RECENT_INQUIRY_IP_COUNT = 30
    MAX_RECENT_INQUIRY_IP_COUNT = 10

    ##所定の時間（単位「分」）
    ##INQUIRY_MONITORING_PERIOD = 10
    #所定の時間（単位「分」）
    INQUIRY_MONITORING_PERIOD = 10

    #describe 'inquiry_per_monitoring_period' do
      #let!(!inquiry_ip_address) { create :inquiry_ip_address }
      #subject { InquiryIpAddress.inquiry_per_monitoring_period("127.0.0.1") }
      #it { is_expected.to include inquiry_ip_address }
    #end

    describe 'user_detail_period' do

      #user = User.create(name: 'spec', gender: 1, note: 'テキスト', email: 'abc@gmail.com', tel: '080-5505-7408' )
      #user_detail2 = UserDetail.new(future: "目指すもの１")
      #user_detail2.user = user
      #user_detail2.save

      #let(:user_detail) { UserDetail.create(future: "目指すもの１") }
      #subject(:user_detail)  { UserDetail.user_detail_period("目指すもの１") }
      #let!(:user_detail)  { UserDetail.user_detail_period("目指すもの１") }
      #it { is_expected.to include user_detail }

      #expect(UserDetail.where(future: "目指すもの１").to exist

      #let!(:user) { create(:user) }
      #let!(:user) { create(:user, name: 'spec', gender: 1, note: 'テキスト', email: 'abc@gmail.com', tel: '080-5505-7408' ) }
      #let!(:INQUIRY_MONITORIG_PERIOD) { 1000 }
      #let!(:user_detail) { create(:user_detail, user_id: user.id, future: "目指すもの１") }
      #subject(:user_detail)  { UserDetail.user_detail_period("目指すもの１") }

      #let!(:target_ip) { "127.0.0.1" }
      #let!(:future) { "ここにはテキストが入ります" }

      before do
        subject {UserDetail.user_detail_period("将来")}
        it { is_expected.to include user_detail }  
      end
     
    end

    ##context 'within_predetermined_count?がtrueの場合' do
    ##  it 'trueを返す' do
    ##    expect(controller.send(:within_predetermined_count?)).to be true
    ##  end  
    ##end
    
    context 'within_predetermined_future?がtrueの場合' do
      #let!(:MAX_RECENT_INQUIRY_IP_COUNT) { 10 }
      before do
        subject { UserDetail.within_predetermined_future?("将来") }
        it { is_expected.to eq true }  
      end
       
    end

    ##context 'within_predetermined_count?がfalseの場合' do
    ##  it 'falseを返す' do
    ##    expect(controller.send(:within_predetermined_count?)).to be false
    ##  end  
    ##end

    context 'within_predetermined_future?がfalseの場合' do
      #let!(:MAX_RECENT_INQUIRY_IP_COUNT) { 10 }
      before do
        subject { UserDetail.within_predetermined_future?("目指すものでないもの") }
        it { is_expected.to eq false }  
      end
       
    end

  #end
  end

end
