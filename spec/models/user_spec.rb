require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#confirm" do

    context "空の場合" do
      let(:user){User.new(name: "")} #nameが空文字のUserオブジェクトを生成
      #example '空の場合' do  
        it "エラーを返す" do
          user.valid? #バリデーションを実行
          expect(user.errors[:name]).to be_present #期待結果：エラーメッセージが存在する
        end
      #end  
    end

    context "Nullの場合" do
      let(:user){User.new(name: nil)} #nameがnilのUserオブジェクトを生成
      #example 'Nullの場合' do
        it "エラーを返す" do
          user.valid? #バリデーションを実行
          expect(user.errors[:name]).to be_present #期待結果：エラーメッセージが存在する
        end
      #end  
    end
    
    context "値が入っている場合" do
      let(:user){User.new(name: "お名前　あります")} #nameに値が入っているUserオブジェクトを生成
      #example '値が入っている場合' do
        it "エラーを返さない" do
          user.valid? #バリデーションを実行
          expect(user.errors[:name]).to be_blank #期待結果：エラーメッセージが存在しない
        end
      #end  
    end

  end
end