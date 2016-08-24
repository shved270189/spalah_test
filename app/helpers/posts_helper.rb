module PostsHelper
  def link_to_post(post)
    link_to post.title, post_path(post)
  end
end
