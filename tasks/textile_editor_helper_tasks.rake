namespace :textile_editor_helper do
  PLUGIN_ROOT = File.dirname(__FILE__) + '/..'
  ASSET_FILES = Dir[PLUGIN_ROOT + '/assets/**/*'].select { |e| File.file?(e) }
  
  desc 'Installs required assets'
  task :install do
    ASSET_FILES.each do |file|
      path = RAILS_ROOT + '/' + File.dirname(file) + '/'
      puts path
      #FileUtils.mkpath(path) unless File.directory?(path)
      #FileUtils.cp [file], path
    end  
  end

  desc 'Removes assets for the plugin'
  task :remove do
    ASSET_FILES.each do |file|
      path = RAILS_ROOT + '/' + File.dirname(file) + '/'
      FileUtils.rm  
    end
  end
end