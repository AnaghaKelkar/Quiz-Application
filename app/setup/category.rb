class Category
  def self.call
    categories.each { |name| Category.create(name: name)}
  end

private
  def categories
    ['Argument Structure Questions', 'Main Point Questions']
  end
end
