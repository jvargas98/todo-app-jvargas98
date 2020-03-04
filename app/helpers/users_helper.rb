module UsersHelper
  def user_gravatar(user)
    gravatar_id = Digest::MD5::hexdigest(user.email)
    gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}?d=identicon"
    image_tag(gravatar_url, alt: user.first_name, class: "img-thumbnail h-100 shadow rounded")
  end
end
