module UsersHelper

  def avatar_url(user)
    return '' if user.nil?
    return '' if current_account && current_account.hide_avatar?
    url = user.avatar.url
    options = {
      :class  => "avatar",
      :alt    => "",
      :width  => AvatarUploader::AVATAR_SIZE,
      :height => AvatarUploader::AVATAR_SIZE
    }
    if user.avatar.blank?
      options['data-gravatar'] = user.gravatar_hash
      url.sub!(/^http:/, 'https:') if request.ssl?
    end
    image_tag(url, options)
  end

end
