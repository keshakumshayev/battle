feature 'tseting infrastructure working' do

  scenario 'homepage content matching' do
    visit '/'
    expect(page).to have_content 'Testing infrastructure working!'
  end

end
