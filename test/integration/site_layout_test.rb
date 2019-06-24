require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    # assert_templateでルートページが描画されているかを確かめている
    assert_template 'static_pages/home'
    # assert_selectは高度なオプションとして使用している
    # 今回は特定のリンクが存在するかどうかを aタグとhref属性のオプションを指定して調査
    # 	<a href="/">?</a> がマッチするHTMLとして調査される
    # ？部分に第二引数のパスが置換される
    # countはロゴとナビゲーションバーの2個のURLリンクのテストをすることを指定している
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    # リンク先が正しいページであるかをgetで確認している
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end