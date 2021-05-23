Rails.application.routes.draw do
  root 'parliamentary_spending#upload'
  post '/', to: 'parliamentary_spending#import', as: 'import'
end
