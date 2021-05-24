Rails.application.routes.draw do
  get 'deputies/index'
  get 'deputies/show/:id', to: 'deputies#show', as: "deputies_show"
  root 'parliamentary_spending#upload'
  post '/', to: 'parliamentary_spending#import', as: 'import'
end
