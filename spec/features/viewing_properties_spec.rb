require 'pg'
require 'spec_helper'

feature 'Viewing properties' do
    scenario 'A user can navigate to property page' do
      visit('/properties')
      expect(page).to have_content("Welcome")
    end
  end

  