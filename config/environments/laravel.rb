# Requires 'tasks/common.rb'

namespace :laravel do

	# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
	# They will be linked in the 'deploy:link_shared_paths' step.
	set :shared_paths, ['config/database.yml', 'log']

	# Put any custom mkdir's in here for when `mina setup` is ran.
	# For Rails apps, we'll make some of the shared paths that are shared between
	# all releases.
	task :setup => :environment do
	  queue! %[mkdir -p "#{deploy_to}/shared/log"]
	  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

	  queue! %[mkdir -p "#{deploy_to}/shared/config"]
	  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

	  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
	  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
	end

	desc "Deploys the current version to the server."
	task :deploy => :environment do
	  deploy do
	    # Put things that will set up an empty directory into a fully set-up
	    # instance of your project.
	    #invoke :'git:clone'
	    invoke :'deploy:link_shared_paths'
	    to :launch do
	      queue "touch #{deploy_to}/tmp/restart.txt"
	    end
	  end
	end

end