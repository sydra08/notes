class Author
  attr_accessor :name

  def initialize #has_many interface
    @stories = []
  end

  def stories #has_many interface
    @stories.dup.freeze
  end


  def add_story(story) #has_many interface
    @stories << story
    story.author = self unless author.stories.include?(self)
    #prevents an infinite loop
      #if the story is already there don't assign the author
  end

  def bibliography
    self.stories.collect {|s| s.name}
    # @stories.collect(&:name) => Symbol to Proc
  end

  def categories #has_many thru stories
    self.stories.collect {|s| s.category}.uniq
  end
end

class story
  attr_accessor :name
  attr_reader :author, :category #belongs to an author and a category

  def author=(author) #belongs to an author
    @author = author
    author.add_story(self) unless story.author == self
    #prevents an infinite loop
      #don't add this story to stories if it already exists
  end

  def category=(category)
    @category = category
    story.category = self unless story.category == self
  end
end


class Category
  attr_accessor :name

  def initialize
    @stories = [] #has many stories interface
  end

  def add_story(story) #has many stories interface
    @stories << story
    story.category = self unless story.category == self
  end

  def authors #has_many authors thru stories
    self.stories.collect {|s| s.author}.uniq
  end
end
