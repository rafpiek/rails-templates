def add_root_path
  generate :controller, 'pages', 'home'
  route "root 'pages#home'"
end
