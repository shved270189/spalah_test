module PostsHelper
  def link_to_post(post)
    link_to post.title, post_path(post)
  end

  def previous_page_path(page)
    posts_path(page: page - 1)
  end

  def next_page_path(page)
    posts_path(page: page + 1)
  end
end
