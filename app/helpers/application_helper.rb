module ApplicationHelper
    # 引数で与えられたユーザーのGravatar画像を返す
  def avatar_url(user)
    
    if user.image.present?
      return user.image
    else
      user.email.present?
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    end
  end
end
