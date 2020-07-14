require "spec_helper"

RSpec.describe "プロフィールページ", type: :request do
  let!(:user) { create(:user) }

  it "レスポンスが正常に表示される事" do
    get user_path(user)
    expect(response).to render_template('users/show')
  end
end
