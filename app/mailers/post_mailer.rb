class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    mail to: @post.user.email, subject: 'new content posted'
  end
end
