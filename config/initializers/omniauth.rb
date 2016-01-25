Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1676774375936211', 'eab6eb887f0bda758b27f375961ce03e',
  	:scope => 'email,user_likes', :display => 'popup'
end
