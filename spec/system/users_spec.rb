require 'spec_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }
  let!(:admin_user) { create(:user, :admin) }
  describe "ユーザー一覧ページ" do
    it "ページネーション、削除ボタンが表示される事" do
      create_list(:user,31)
      login_for_system(user)
      visit users_path
      expect(page).to have_css "div.pagination"
      User.paginate(page: 1).each do |u|
        expect(page).to have_link u.name, href: user_path(u)
        expect(page).to have_content "#{u.name} | 削除" unless u == admin_user
    end
  end
end
context "管理者ユーザー以外の場合" do
 it "ぺージネーション、自分のアカウントのみ削除ボタンが表示されること" do
   create_list(:user, 30)
   login_for_system(user)
   visit users_path
   expect(page).to have_css "div.pagination"
   User.paginate(page: 1).each do |u|
     expect(page).to have_link u.name, href: user_path(u)
     if u == user
       expect(page).to have_content "#{u.name} | 削除"
     else
       expect(page).not_to have_content "#{u.name} | 削除"
     end
   end
 end
end

  describe "ユーザー登録ページ" do
    before do
      visit signup_path
    end

    context "ページレイアウト" do
      it "「ユーザー登録」の文字列が存在することを確認" do
        expect(page).to have_content 'ユーザー登録'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title('ユーザー登録')
      end
    end

    context "ユーザー登録処理" do
      it "有効なユーザーでユーザー登録を行うとユーザー登録成功のフラッシュが表示されること" do
        fill_in "ユーザー名", with: "Example User"
        fill_in "メールアドレス", with: "user@example.com"
        fill_in "パスワード", with: "password"
        fill_in "パスワード(確認)", with: "password"
        click_button "登録する"
        expect(page).to have_content "クックログへようこそ！"
      end

      it "無効なユーザーでユーザー登録を行うとユーザー登録失敗のフラッシュが表示されること" do
        fill_in "ユーザー名", with: ""
        fill_in "メールアドレス", with: "user@example.com"
        fill_in "パスワード", with: "password"
        fill_in "パスワード(確認)", with: "pass"
        click_button "登録する"
        expect(page).to have_content "ユーザー名を入力してください"
        expect(page).to have_content "パスワード(確認)とパスワードの入力が一致しません"
      end
    end
  end

  describe "プロフィールページ" do
    context "ページレイアウト" do
      before do
        login_for_system(user)
        visit user_path(user)
      end

      it "「プロフィール」の文字列が存在することを確認" do
        expect(page).to have_content 'プロフィール'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title('プロフィール')
      end

      it "ユーザー情報が表示されることを確認" do
        expect(page).to have_content user.name
        expect(page).to have_content user.introduction
        expect(page).to have_content user.sex
      end
    end
  end

    describe "プロフィール編集ページ" do
    context "アカウント削除処理", js: true do
      it "正しく削除できること" do
        click_link "アカウントを削除する"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "自分のアカウントを削除しました"
      end
    end
  end
end
