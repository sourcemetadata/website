class SpecDataSource < Nanoc::DataSource
  identifier :spec

  def items
    gem_path = Bundler.rubygems.find_name('nanoc').first.full_gem_path
    content = File.read("#{gem_path}/NEWS.md")

    item = new_item(
      content,
      { title: 'Release notes' },
      Nanoc::Identifier.new('/release-notes.md'),
    )

    [item]
  end
end