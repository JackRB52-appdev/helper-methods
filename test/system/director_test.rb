require "application_system_test_case"

class DirectorsTest < ApplicationSystemTestCase
  test "directors header" do 
    visit directors_path
    assert_selector "h1", text: "List of all directors"
  end

  test "new director button" do
    visit directors_path
    click_on "Add a new director"

    assert_selector "h1", text: "New director"
  end

  test "creating a Director" do
    original_director_count = Director.count

    visit directors_path
    click_on "Add a new director"

    fill_in "Name", with: "A new director's name"
    fill_in "Dob", with: Date.new(2013, 3, 19)
    fill_in "Bio", with: "A new director's bio"
    click_on "Create Director"

    assert_text "Director created successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count + 1, ending_director_count
  end

  test "updating a Director" do
    @director = directors(:one)

    visit edit_director_path(@director)

    fill_in "Name", with: "Some other name"
    fill_in "Bio", with: "Some other bio"
    fill_in "Dob", with: Date.new(2022, 3, 19)

    click_on "Update Director"
    
    assert_text "Director updated successfully"

    @director.reload # Why do we need this?
    assert_equal "Some other name", @director.name
    assert_equal "Some other bio", @director.bio
    assert_equal Date.new(2022, 3, 19), @director.dob
  end

  test "destroying a Director" do
    @director = directors(:one)
    original_director_count = Director.count

    visit directors_path
    click_on "Show details", match: :first
    click_on "Delete director"

    assert_text "Director deleted successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count - 1, ending_director_count
  end

end
