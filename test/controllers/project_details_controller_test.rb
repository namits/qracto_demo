require 'test_helper'

class ProjectDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_detail = project_details(:one)
  end

  test "should get index" do
    get project_details_url
    assert_response :success
  end

  test "should get new" do
    get new_project_detail_url
    assert_response :success
  end

  test "should create project_detail" do
    assert_difference('ProjectDetail.count') do
      post project_details_url, params: { project_detail: { contact_no: @project_detail.contact_no, country: @project_detail.country, description: @project_detail.description, email: @project_detail.email, name: @project_detail.name } }
    end

    assert_redirected_to project_detail_url(ProjectDetail.last)
  end

  test "should show project_detail" do
    get project_detail_url(@project_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_detail_url(@project_detail)
    assert_response :success
  end

  test "should update project_detail" do
    patch project_detail_url(@project_detail), params: { project_detail: { contact_no: @project_detail.contact_no, country: @project_detail.country, description: @project_detail.description, email: @project_detail.email, name: @project_detail.name } }
    assert_redirected_to project_detail_url(@project_detail)
  end

  test "should destroy project_detail" do
    assert_difference('ProjectDetail.count', -1) do
      delete project_detail_url(@project_detail)
    end

    assert_redirected_to project_details_url
  end
end
