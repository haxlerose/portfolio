class BlogPost
  POSTS_PATH = Rails.root.join("app/views/blogs/posts")
  SLUG_PATTERN = /\A[a-z0-9-]+\z/
  TEMPLATE_PATTERN = /\A(?<slug>[a-z0-9-]+)\.html\.erb\z/

  attr_reader :slug, :updated_at

  def initialize(slug:, updated_at:)
    @slug = slug
    @updated_at = updated_at
  end

  def self.all
    return [] unless POSTS_PATH.directory?

    POSTS_PATH.children.filter_map do |path|
      match = path.basename.to_s.match(TEMPLATE_PATTERN)
      next unless match

      new(slug: match[:slug], updated_at: path.mtime)
    end.sort_by(&:slug)
  end

  def self.find(slug)
    return unless slug.to_s.match?(SLUG_PATTERN)

    all.find { |post| post.slug == slug }
  end

  def self.exists?(slug)
    find(slug).present?
  end
end
