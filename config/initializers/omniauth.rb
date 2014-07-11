OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '259353650931620', 'bd74c29bb4bd20f7ac0a86f25aeb9ff8'
end