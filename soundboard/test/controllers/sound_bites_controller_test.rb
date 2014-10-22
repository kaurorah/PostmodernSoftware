require 'test_helper'

class SoundBitesControllerTest < ActionController::TestCase
  setup do
    @sound_bite = sound_bites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sound_bites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sound_bite" do
    assert_difference('SoundBite.count') do
      post :create, sound_bite: { audiofile: @sound_bite.audiofile, length: @sound_bite.length, recording_date: @sound_bite.recording_date, title: @sound_bite.title, transcript: @sound_bite.transcript }
    end

    assert_redirected_to sound_bite_path(assigns(:sound_bite))
  end

  test "should show sound_bite" do
    get :show, id: @sound_bite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sound_bite
    assert_response :success
  end

  test "should update sound_bite" do
    patch :update, id: @sound_bite, sound_bite: { audiofile: @sound_bite.audiofile, length: @sound_bite.length, recording_date: @sound_bite.recording_date, title: @sound_bite.title, transcript: @sound_bite.transcript }
    assert_redirected_to sound_bite_path(assigns(:sound_bite))
  end

  test "should destroy sound_bite" do
    assert_difference('SoundBite.count', -1) do
      delete :destroy, id: @sound_bite
    end

    assert_redirected_to sound_bites_path
  end
end
