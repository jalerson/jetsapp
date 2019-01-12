class GithubEvent < ApplicationItem
  table name: :github_events

  field :github_id
  field :event
  field :payload, :raw
  field :processed, default: false

  validates_presence_of :github_id, :event, :payload
end
