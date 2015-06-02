require 'rails_helper'

describe "Creating todo lists" do
  it "redirects to the todo lists index page on success" do
    visit "/lists"
    click_link "New List"
    expect(page).to have_content("New List")

    fill_in "Title", with: "My Todo List"
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create List"

    expect(page).to have_content("My Todo List")

  end

  it "displays an error when the todo list has no title" do

    expect(List.count).to eq(0)

    visit "/lists"
    click_link "New List"
    expect(page).to have_content("New List")

    fill_in "Title", with: ""
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create List"
  
    expect(page).to have_content("error")
    expect(List.count).to eq(0)

    visit "/lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the todo list has a title less than 3 characters" do

    expect(List.count).to eq(0)

    visit "/lists"
    click_link "New List"
    expect(page).to have_content("New List")

    fill_in "Title", with: "Hi"
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create List"
  
    expect(page).to have_content("error")
    expect(List.count).to eq(0)

    visit "/lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the todo list has no description" do

    expect(List.count).to eq(0)

    visit "/lists"
    click_link "New List"
    expect(page).to have_content("New List")

    fill_in "Title", with: "Grocery list"
    fill_in "Description", with: ""
    click_button "Create List"
  
    expect(page).to have_content("error")
    expect(List.count).to eq(0)

    visit "/lists"
    expect(page).to_not have_content("Grocery list")
  end

  it "displays an error when the todo list has no description" do

    expect(List.count).to eq(0)

    visit "/lists"
    click_link "New List"
    expect(page).to have_content("New List")

    fill_in "Title", with: "Grocery list"
    fill_in "Description", with: "Food"
    click_button "Create List"
  
    expect(page).to have_content("error")
    expect(List.count).to eq(0)

    visit "/lists"
    expect(page).to_not have_content("Grocery list")
  end
end