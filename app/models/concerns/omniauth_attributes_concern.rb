module OmniauthAttributesConcern
  extend ActiveSupport::Concern
  module ClassMethods
    def twitter params
      (params['info']['email'] = "dummy#{SecureRandom.hex(10)}@dummy.com") if params['info']['email'].blank?
      attributes = {
        email: params['info']['email'],
        first_name: params['info']['name'].split(' ').first,
        last_name: params['info']['name'].split(' ').last,
        username: params['info']['nickname'],
        password: Devise.friendly_token
      }
      create(attributes)
    end
  end
end