def add_root_path
  generate :controller, 'pages', 'home'
  route "root 'pages#home'"
end

def add_api_root_path
  generate :controller, 'root', 'index'
  route "root 'root#index'"
end
