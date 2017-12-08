require 'pry'

feature 'entering player names' do

  scenario 'players enter names' do
    sign_in_and_play
    expect(page).to have_content("Jimmy VS Lemonade")
  end
end

feature 'viewing HP values' do
  scenario 'player 1 HP value visible' do
    sign_in_and_play
    expect(page).to have_content("Jimmy's HP: 100")
  end
  scenario 'player 2 HP value visible' do
    sign_in_and_play
    expect(page).to have_content("Lemonade's HP: 100")
  end
  scenario 'player 1 HP value lowers after being attacked' do
    sign_in_and_play
    click_button("Attack")
    click_button("Attack")
    expect(page).to have_content("Jimmy's HP: 90")
  end
  scenario 'player 2 HP value lowers after being attacked' do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Lemonade's HP: 90")
  end

end

feature 'attack' do
  scenario 'player 1 can attack player 2' do
    sign_in_and_play
    expect(page).to have_selector("input[type='submit'][value='Attack']")
  end

  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Lemonade's HP: 90")
  end
end


feature 'turn player' do
  scenario 'it is player 1\'s turn initially' do
    sign_in_and_play
    expect($game.turn_player).to eq $game.p1
  end
  scenario 'it is player 2\'s turn after player 1 attacks' do
    sign_in_and_play
    click_button("Attack")
    expect($game.turn_player).to eq $game.p2
  end
  scenario 'it is player 1\'s turn after player 2 attacks' do
    sign_in_and_play
    click_button("Attack")
    click_button("Attack")
    expect($game.turn_player).to eq $game.p1
  end
end
