require 'rails_helper'

RSpec.describe 'home page' do
  it 'works' do
    visit '/'
    expect(page).to have_content 'Welcome to Spotlight!'
  end
end
