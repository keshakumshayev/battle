feature 'tseting infrastructure working' do

  scenario 'homepage content matching' do
    visit '/'
    expect(page).to have_content 'Testing infrastructure working!'
  end
end

feature 'entering player names' do

  scenario 'player 1' do
    visit '/'
    fill_in('p1', with: 'Jimmy')
    fill_in('p2', with: 'Lemonade')
    click_button("Battle!")
    expect(page).to have_content("Jimmy VS Lemonade")
  end
end
