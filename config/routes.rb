Rails.application.routes.draw do
  get('/forex', {:controller => 'currencies', :action => 'first_currency'})
  get('/forex/:from_currency', {:controller => 'currencies', :action => 'second_currency'})
  get('/forex/:from_currency/:to_currency', {:controller => 'currencies', :action => 'conversion'})
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
