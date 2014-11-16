class User < ActiveRecord::Base
  has_many :checkins
  
  def self.find_or_create(auth)
    if auth.provider == 'facebook'
      user = User.where(facebook_uid: auth.uid).first || User.new

      user.facebook_token = auth.token
      user.facebook_secret = auth.secret
    else
      user = User.where(twitter_uid: auth.uid).first || User.new

      user.twitter_token = auth.token
      user.twitter_secret = auth.secret
    end
  end
end
