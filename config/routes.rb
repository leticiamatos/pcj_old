Pcj::Application.routes.draw do
  
  get "privacy"     => "privacy#index"
  get "terms"       => "terms#index"
  get "about_us"    => "about_us#index"
  get "contact_us"  => "contact_us#index"
  get "/banner/:id" => "application#increment_hits_banner", :as => :increment_hits_banner
  get "/download/:id" => "application#increment_hits_download", :as => :increment_hits_download

  get "/infografico" => "home#infografico"
  get "/dicasdeestudo" => "home#infografico"
  get "/dicas-de-estudo" => "home#dicas_de_estudo", :as => :dicas_de_estudo

  resources :careers, only: ["index", "show"]
  
  get "blogs" => "blog/blog#blogs", as: :blogs_index
  get 'blog' => "blog/blog#index"
  get "blog/:teacher_id" => "blog/blog#index", as: :teacher_blog 

  #search routes
  post "/course/search" => "cers/courses#search", as: :cers_courses_search
  get "/course/search" => "cers/courses#search", as: :cers_courses_search

  scope :module => :cms do
    get "download" => "download#index"
    get "download/:id" => "download#download", as: :download_file
    get "news/all" => "news#all"
    resources :news, only: ["index", "show"]
  end

  get "/testecarga" => "home#teste_carga"

  scope :module => :cers do
    resources :teachers, only: ["index", "show"]
    resources :courses, only: ["index"]
  end

  scope :module => :bookstore do
    resources :books, only: ["index"]
  end

  root :to => "home#index"
  resources :search

end

ActionDispatch::Routing::Translator.translate_from_file("config/locales/routes.yml", { :no_prefixes => true })