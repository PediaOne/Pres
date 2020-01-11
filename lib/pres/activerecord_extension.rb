module Pedia
  module Cloud
    module Events
      module Api
        class Client

          def initialize(base_url)
            @base_url = 'http://localhost:3322/api/v1/'
          end

          def create_event(action_name = nil, actor = nil, payload = {}, headers = {})
            request_payload = {}
            pedia_cloud_api_key = "genesis"
            request_payload[:payload] = payload
            request_payload[:action_name] = action_name
            request_payload[:actor] = actor
            post_request('events', request_payload, headers)
          end

          def post_request(object, payload, headers = {})

            RestClient.post("#{@base_url}#{object}", payload, headers)
          end
        end
      end
    end
  end
end


class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  after_save :pres_persist_event
  attr_accessor :pres_actor
  attr_accessor :pres_action_name

  def save_event(actor, action_name)
    self.pres_actor = actor
    self.pres_action_name = action_name
    self.save
  end
  
  def pres_persist_event
    if self.pres_actor && self.pres_action_name
      payload = {}
      self.saved_changes.each do |key, value|
        payload[key] = value[1]
      end
      Pedia::Cloud::Events::Api::Client.new.create_event(
        self.action_name,
        actor == 'genesis' ? 'genesis' : actor.pedia_identifier,
        self.saved_changes
      )
    else
      puts "No actor or event name found!"
    end

  end
end