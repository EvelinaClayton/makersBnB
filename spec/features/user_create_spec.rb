require 'pg'
require 'spec_helper'

feature 'check if user exists' do
  scenario 'raise error if user exists' do
    visit('/user/new')
    fill_in('email', with: 'newemail@')
    fill_in('password', with: '123')
    click_button('Sign up')
    visit('/user/new')
    fill_in('email', with: 'newemail@')
    fill_in('password', with: '123')
    click_button('Sign up')
    expect(page).to raise_error('this email address is already taken')
end
end

