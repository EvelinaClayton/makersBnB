
feature 'Viewing properties' do
    scenario 'A user can navigate to property page' do
      visit('/properties')
      expect(page).to have_content("hello")
    end
  end

  