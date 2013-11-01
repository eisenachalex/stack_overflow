Rails.application.config.middleware.use OmniAuth::Builder do
	configure do |config|
    config.path_prefix = '/auth'
  end
  provider :facebook, '1427887747426339', '1e030fddfd788e389025f174a2cd979e'
  provider :twitter, 'atSomKFNMSJ6uUG5QLPMBw', 'CYEQ3V6E40uaaYA8fVMRuTUIxJrPjgXzplflWD5dWo'
end