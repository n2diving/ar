module OmniauthAttributesConcern
  extend ActiveSupport::Concern
  module ClassMethods

    def facebook(params)
      attributes = {
        email: params['info']['email'],
        first_name: params['info']['name'].split(' ').first,
        last_name: params['info']['name'].split(' ').last,
        username: params['info']['name'].join('.'),
        password: Devise.friendly_token
      }
      create(attributes)
    end

    def google_oauth2(params)
      attributes = {
        email: params['info']['email'],
        first_name: params['info']['name'].split(' ').first,
        last_name: params['info']['name'].split(' ').last,
        username: params['info']['name'].join('.'),
        password: Devise.friendly_token
      }
      create(attributes)
    end


  end
end