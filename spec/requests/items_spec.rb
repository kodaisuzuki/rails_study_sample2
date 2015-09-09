require 'rails_helper'

RSpec.describe "Items", :type => :request do
  subject { page }

  describe "一覧画面のviewテスト" do
      #前処理
      before {visit items_path }
  
      it "メモが正しく表示されているか" do
         should have_content('メモ')
      end

      it "タイトルが正しく表示されているか" do
        should have_title("Sample1")
      end
  end
  
  describe "新規登録画面" do
    before { visit new_item_path }
    #テスト内で簡単にローカル変数を作成する
    let(:submit) { "登録する" }
    
    describe "新規登録できない場合" do
        it "空の場合作成することができない" do
            expect { click_button submit }.not_to change(Item, :count)
        end
    end
      
    describe "新規登録できる場合" do
      before do
        #値を設定
        fill_in "item_name", with: "suzuki"
        fill_in "item_age",  with: "20"
        choose "item_sex_0"
        fill_in "item_memo", with: "メモ"
      end
      
      it "作成されたか判定" do
        #正しいデータが入力された場合、カウントが一つ増加する
        expect { click_button submit }.to change(Item, :count).by(1)
      end
    end
  end
  
  describe "編集画面" do
    let(:item) { FactoryGirl.create(:item) }
    before { visit edit_item_path(item) }
    
    describe "編集画面のviewテスト" do
      it { should have_content("Editing Item") }
      it { should have_title("Sample1") }
      it { should have_link('Back', href: items_path) }
      it { should have_link('Show', href: item_path(item)) }
    end
    
    describe "ボタン押下時の振る舞い" do
      let(:new_name)  { "New Name" }
      let(:new_age) { 50 }
      let(:new_memo) { "新しいメモです。" }

      before do
        #値を設定
        fill_in "item_name", with: new_name
        fill_in "item_age",  with: new_age
        choose "item_sex_1"
        fill_in "item_memo", with: new_memo
        click_button "更新する"
      end
      
      #更新後遷移先にある文字列
      it { should have_content('Item was successfully updated.') }
      #変更が行われているか確認する。
      it { expect(item.reload.name).to  eq new_name }
      it { expect(item.reload.age).to eq new_age }
      it { expect(item.reload.memo).to eq new_memo }
    end
  end
end
