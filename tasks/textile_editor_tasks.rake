namespace :textile_editor do
  PLUGIN_ROOT = File.dirname(__FILE__) + '/../'
  
  desc 'Installs required javascript files to the public/javascripts directory.'
  task :install do
    %w{javascripts stylesheets images}.each do |dir|
      FileUtils.cp Dir[PLUGIN_ROOT + "/assets/#{dir}/*.*"], RAILS_ROOT + "/public/#{dir}"
    end
  end

  # desc 'Removes the javascripts for the plugin.'
  # task :remove do
  #   FileUtils.rm %{lowpro.js}.collect { |f| RAILS_ROOT + "/public/javascripts/" + f  }
  # end
end