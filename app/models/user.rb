class User < ActiveRecord::Base
  def self.find_or_create_by_omniauth(auth)
    self.find_or_create_by(email: auth['email']) do |u|
      u.name = auth['info']['name']
      u.image = auth['info']['image']
      u.uid = auth['info']['uid']
    end
  end
end
