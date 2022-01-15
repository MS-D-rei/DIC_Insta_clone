module PostsHelper
  def action_based
    case action_name
    when 'new'
      confirm_posts_path
    when 'edit'
      post_path
    end
  end
end
