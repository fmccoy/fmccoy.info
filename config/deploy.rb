require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
# require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)
<<<<<<< HEAD

=======
set :app_name, 'fmccoy'
>>>>>>> init
set :domain, 'charlotte.fmccoy.info'
set :deploy_to, '/var/www/fmccoy'
set :repository, 'git@github.com:fmccoy/fmccoy.info.git'
set :branch, 'master'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
#set :shared_paths, ['config/database.yml', 'log']

<<<<<<< HEAD
set :user, 'foobar'    # Username in the server to SSH to.
set :identity_file, '~/.ssh/mbp_id'
=======
set :user, 'frank'    # Username in the server to SSH to.
set :identity_file, '/Users/frank/.ssh/mbp_id'
>>>>>>> init

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
<<<<<<< HEAD
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
=======
  queue! %[mkdir -p "#{deploy_to}/public_html"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/public_html"]
  queue! %[cat "<?php echo $_SERVER['SERVER_NAME']; ?>" > #{deploy_to}/public_html/index.html]

  queue! %[mkdir -p "#{deploy_to}/logs"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/logs"]

  queue! %[mkdir -p "#{deploy_to}/confs"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/confs"]

  queue! %[touch "#{deploy_to}/confs/database.yml"]
  queue! %[echo "-----> Be sure to edit 'confs/database.yml'."]

  queue! %[touch "#{deploy_to}/confs/vhost"]
  queue! %[sudo ln -s "#{deploy_to}/confs/vhost" "/etc/apache2/sites-available/#{app_name}"]
  queue! %[echo "-----> Be sure to edit 'confs/vhost'."]
>>>>>>> init
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'

    to :launch do
      queue "touch #{deploy_to}/tmp/restart.txt"
    end
  end
end

<<<<<<< HEAD
=======
task :vhost do
  queue "sudo a2ensite #{app_name}"
  queue "sudo service apache2 reload"
end

task :tempindex do
  queue! %[echo '<?php echo $_SERVER['SERVER_NAME']; ?>' >> "#{deploy_to}/public_html/index.php"]
end

>>>>>>> init
# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

