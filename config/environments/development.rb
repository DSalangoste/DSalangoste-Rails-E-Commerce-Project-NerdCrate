Rails.application.configure do
  # ... other configurations ...
  
  # Store files locally.
  config.active_storage.service = :local
  
  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.active_storage.variant_processor = :mini_magick
  
  # Ensure Active Storage routes are loaded
  config.active_storage.draw_routes = true
end 