class Author
  attr_accessor :name

  def initialize
    @stories = []
  end

  def stories
    @stories
  end


  def add_story(story)
    @stories << story
  end

  def bibliography
    @stories.collect {|s| s.name}
    # @stories.collect(&:name) => Symbol to Proc 


end
