
feature 'Viewing properties' do
    scenario 'A user can see properties' do
      visit('/properties')
      expect(page).to have_content "2 bedroom flat in Greenwich"
    end
  end