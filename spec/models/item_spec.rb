require 'rails_helper'

describe Item do
<<<<<<< HEAD
=======

>>>>>>> dbc6b02f9d4df829d193a7f2c3fa5a6445cb4fa7
    #前処理
    before do
        @item = Item.new(name: "Example", age: "20", sex: "0", memo:"testメモ") 
    end
    
    #評価する値
    subject { @item }
    
    #存在チェック
    it { should respond_to(:name) }
    it { should respond_to(:age) }
    it { should respond_to(:sex) }
    it { should respond_to(:memo) }
    
    #値が有効かどうか判定
    it { should be_valid }
    
    describe "入力チェック" do
        #空文字を追加する。
        before { @item.name = " " }
        it { should_not be_valid }
    end
    
    describe "長さチェック" do
        #51文字の値を追加する。
        before { @item.name = "a" * 51 }
        it { should_not be_valid }
    end
    
    describe "数値チェック" do
        #数値を追加する。
        before { @item.age = "a"}
        it { should_not be_valid }
    end
    
    describe "重複チェック" do
        before do
          #同じ値のitemを生成する。
          item_with_same_name = @item.dup
          #保存する。
          item_with_same_name.save
        end
        it { should_not be_valid }
    end
end