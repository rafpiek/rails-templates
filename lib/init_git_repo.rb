def init_git_repo
  # Initialize a new git repo and make an initial commit
  git :init
  append_to_file ".gitignore", ".idea"
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end
