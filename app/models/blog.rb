class Blog

  attr_writer :post_source

  def initialize
    @entries = []
  end

  def title
    "Watching paint dry"
  end

  def subtitle
    "The quick brown fox jumped over the lazy dog"
  end

  def entries
    @entries.sort_by{|e| e.pubdate}.reverse.take(10)
  end

  def new_post(*args)
    post_source.call(*args).tap do |p|
      p.blog = self
    end
  end

  def add_entry(entry)
    @entries << entry
  end

  private
  def post_source
    @post_source ||= Post.public_method(:new)
  end
end