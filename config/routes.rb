Rails.application.routes.draw do
  get 'deputies', to: 'deputies#index', as: 'deputies_index'
  get 'deputies/:id', to: 'deputies#show', as: "deputies_show"
  root 'parliamentary_spending#upload'
  post '/', to: 'parliamentary_spending#import', as: 'import'
end
