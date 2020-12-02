Rails.application.routes.draw do
  namespace :api do
    get "/questions" => "questions#index"
    post "/questions" => "questions#create"
    get "/questions/:id" => "questions#show"
  end

  namespace :api do
    get "/ug_questions" => "ug_questions#index"
    post "/ug_questions" => "ug_questions#create"
    get "/ug_questions/:id" => "questions#show"
  end
end