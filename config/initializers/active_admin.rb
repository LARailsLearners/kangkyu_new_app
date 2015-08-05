ActiveAdmin.setup do |config|
  config.site_title = "New App"
  config.authentication_method = :authenticate_admin_user!
  # config.logout_link_path = :destroy_admin_user_session_path
  config.comments = false
  config.batch_actions = true
end
