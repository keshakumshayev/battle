def sign_in_and_play
  visit '/'
  fill_in('p1', with: 'Jimmy')
  fill_in('p2', with: 'Lemonade')
  click_button("Battle!")
end

def track_hp
  
end
