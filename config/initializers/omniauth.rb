Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'IO0mSObd1KnbSOkZXBvGchomD', 'JiCrmSCOp0AR2m0zIjoY8Cq1STTbcjEPupMdpOkEihmHViQ5Lh', provider_ignores_state: true
  provider :facebook, '1492339931014967', '7ae094df0f071a1972ed7c7354943f9a', { scope: 'email,publish_actions', provider_ignores_state: true }
end