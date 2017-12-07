require 'pry'

feature 'entering player names' do

  scenario 'players enter names' do
    sign_in_and_play
    expect(page).to have_content("Jimmy VS Lemonade")
  end
end

feature 'viewing HP values' do
  scenario 'player 1 sees player 2\'s HP' do
    visit '/battle'
    expect(page).to have_content("Lemonade's HP: 100")
  end
end

feature 'attack' do
  scenario 'player 1 can attack player 2' do
    visit '/battle'
    expect(page).to have_selector("input[type='submit'][value='Attack']")
  end

  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Jimmy attacked Lemonade")
  end

  scenario 'player 2 loses 10 HP after attack' do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Lemonade's HP lowered to 90")
  end


end
