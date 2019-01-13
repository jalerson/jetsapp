Jets.application.routes.draw do
  post 'webhooks/github', to: 'webhooks#github'
end
