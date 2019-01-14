class WebhooksController < ApplicationController
  def github
    if GithubEvent.create github_event_params
      render json: { success: true }, status: 201
    else
      render json: { success: false }, status: 500
    end
  end

  private

  def github_event_params
    {
      github_id: event['headers']['X-GitHub-Delivery'],
      event: event['headers']['X-GitHub-Event'],
      payload: JSON.parse(event['body'])
    }
  end
end
