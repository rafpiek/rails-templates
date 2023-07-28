def copy_views
  directory '../lib/files/views/pages', 'app/views/pages', force: true
  directory '../lib/files/images', 'app/assets/images', force: true
  directory '../lib/files/views', 'app/views', force: true
end
