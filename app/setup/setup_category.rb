class SetupCategory
  def self.call
    ['Argument Structure Questions', 'Main Point Questions'].each { |name| Category.create(name: name)}
  end
end
