Rails.application.routes.draw do
  get 'deputies/index'
  get 'deputies/show'
  root 'parliamentary_spending#upload'
  post '/', to: 'parliamentary_spending#import', as: 'import'
end
