require 'test_helper'

class GalleryCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gallery_comment = gallery_comments(:one)
  end

  test "should get index" do
    get gallery_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_gallery_comment_url
    assert_response :success
  end

  test "should create gallery_comment" do
    assert_difference('GalleryComment.count') do
      post gallery_comments_url, params: { gallery_comment: { comment_entry: @gallery_comment.comment_entry, gallery_id: @gallery_comment.gallery_id, user_id: @gallery_comment.user_id } }
    end

    assert_redirected_to gallery_comment_url(GalleryComment.last)
  end

  test "should show gallery_comment" do
    get gallery_comment_url(@gallery_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_gallery_comment_url(@gallery_comment)
    assert_response :success
  end

  test "should update gallery_comment" do
    patch gallery_comment_url(@gallery_comment), params: { gallery_comment: { comment_entry: @gallery_comment.comment_entry, gallery_id: @gallery_comment.gallery_id, user_id: @gallery_comment.user_id } }
    assert_redirected_to gallery_comment_url(@gallery_comment)
  end

  test "should destroy gallery_comment" do
    assert_difference('GalleryComment.count', -1) do
      delete gallery_comment_url(@gallery_comment)
    end

    assert_redirected_to gallery_comments_url
  end
end
