Rails.application.routes.draw do
#Модуль 7 Задание 1
resources :tests do
  resources :questions, shallow: true
end
#
root to: 'tests#index'
end
