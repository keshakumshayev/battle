require 'pry'

feature 'tseting infrastructure working' do

  scenario 'homepage content matching' do
    visit '/first_test'
    expect(page).to have_content 'Testing infrastructure working!'
  end
end

feature 'entering player names' do

  scenario 'players enter names' do
    visit '/'
    fill_in('p1', with: 'Jimmy')
    fill_in('p2', with: 'Lemonade')
    click_button("Battle!")
    expect(page).to have_content("Jimmy VS Lemonade")
  end
end

feature 'viewing HP values' do
  scenario 'player 1 sees player 2\'s HP' do
    visit '/battle'
    #binding.pry
    expect(page).to have_content("P2's HP: 100")
  end
end
