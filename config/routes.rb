Rails.application.routes.draw do
  root 'tweets#top'

  get 'search', to: 'tweets#search'
  get 'post', to: 'tweets#post'
  get 'time_post', to: 'tweets#time_post'
end
