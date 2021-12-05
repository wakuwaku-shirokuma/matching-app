require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#confirm" do

    context "空の場合" do
      let(:user){User.new(name: "")}
      it "エラーを返す" do
        user.valid?
        expect(user.errors[:name]).to be_present
      end
    end

    context "Nullの場合" do
      let(:user){User.new(name: nil)}
      it "エラーを返す" do
        user.valid?
        expect(user.errors[:name]).to be_present
      end
    end
    
    context "値が入っている場合" do
      let(:user){User.new(name: "お名前　あります")}
      it "エラーを返さない" do
        user.valid?
        expect(user.errors[:name]).to be_blank
      end
    end

  end
end