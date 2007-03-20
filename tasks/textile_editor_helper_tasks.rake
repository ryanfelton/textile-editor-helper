namespace :textile_editor_helper do
  PLUGIN_ROOT = File.dirname(__FILE__) + '/..'
  ASSET_FILES = Dir[PLUGIN_ROOT + '/assets/**/*'].select { |e| File.file?(e) }
  
  desc 'Installs required assets'
  task :install do
    verbose = true
    ASSET_FILES.each do |file|
      path = File.dirname(file) + '/'
      path.gsub!(PLUGIN_ROOT, RAILS_ROOT)
      path.gsub!('assets', 'public')

      puts " * Copying %-50s to %s" % [file.gsub(PLUGIN_ROOT, ''), path.gsub(RAILS_ROOT, '')] if verbose
      FileUtils.mkpath(path) unless File.directory?(path)
      FileUtils.cp [file], path
    end  
  end
  
  desc 'Removes assets for the plugin'
  task :remove do
    ASSET_FILES.each do |file|
      path = File.dirname(file) + '/'
      path.gsub!(PLUGIN_ROOT, RAILS_ROOT)
      path.gsub!('assets', 'public')
      path = File.join(path, File.basename(file))
      puts ' * Removing %s' % path.gsub(RAILS_ROOT, '') if verbose
      FileUtils.rm [path]
    end
  end
end