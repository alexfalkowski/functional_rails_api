Rails.application.routes.draw do
  api vendor_string: 'rfunk', default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :persons, only: [:create]
      end
    end
  end
end
