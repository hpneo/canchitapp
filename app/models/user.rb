class User < ActiveRecord::Base
  has_many :checkins
  
  def self.find_or_create(auth)
    if auth.provider == 'facebook'
      user = User.where(facebook_uid: auth.uid).first
      user ||= User.new

      user.facebook_uid = auth.uid
      user.facebook_token = auth.credentials.token
      user.facebook_secret = auth.credentials.secret
    else
      user = User.where(twitter_uid: auth.uid).first
      user ||= User.new

      user.twitter_uid = auth.uid
      user.twitter_token = auth.credentials.token
      user.twitter_secret = auth.credentials.secret
    end

    user
  end

  def update_account(auth)
    if auth.provider == 'facebook'
      self.facebook_uid = auth.uid
      self.facebook_token = auth.credentials.token
      self.facebook_secret = auth.credentials.secret
    else
      self.twitter_uid = auth.uid
      self.twitter_token = auth.credentials.token
      self.twitter_secret = auth.credentials.secret
    end

    self
  end
end
