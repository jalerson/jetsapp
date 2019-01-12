class WebhooksController < ApplicationController
  def github
    if GithubEvent.create secured_params(event)
      render json: { success: true }, status: 201
    else
      render json: { success: false }, status: 500
    end
  end

  private

  def secured_params(event)
    {
      github_id: event['headers']['X-GitHub-Delivery'],
      event: event['headers']['X-GitHub-Event'],
      payload: JSON.parse(event['body'])
    }
  end
end
