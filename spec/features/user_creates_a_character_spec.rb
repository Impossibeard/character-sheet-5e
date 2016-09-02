require 'rails_helper'

feature 'User creates a character' do
  scenario 'they see the character on the page' do
    create(:race)
    create(:hero_class)

    visit new_character_path

    fill_in 'Name', with: 'JD'
    fill_in 'Height in Inches', with: '72'
    fill_in 'Weight in Pounds', with: '150'
    fill_in 'Level', with: '1'
    fill_in 'Current XP', with: '0'
    fill_in 'Strength', with: '8'
    fill_in 'Dexterity', with: '8'
    fill_in 'Constitution', with: '8'
    fill_in 'Wisdom', with: '8'
    fill_in 'Intelligence', with: '8'
    fill_in 'Wealth', with: '20'
    fill_in 'Speed', with: '30'
    fill_in 'Current HP', with: '15'
    fill_in 'Max HP', with: '15'
    fill_in 'Temporary HP', with: '0'
    fill_in 'Proficiency Bonus', with: '2'
    choose 'Normal Vision'
    select 'Hill Dwarf', from: 'Race'
    select 'Barbarian', from: 'Class'

    click_button 'Save'

    expect(page).to have_css '.notice', 'Character was saved successfully.'
  end
end