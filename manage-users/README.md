<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [following along in Managing Users and SSH Keys in a Hybrid World](#following-along-in-managing-users-and-ssh-keys-in-a-hybrid-world)
  - [summary](#summary)
  - [DONE ../cookbook-template/generate.sh: line 25: ruby: command not found](#done-cookbook-templategeneratesh-line-25-ruby-command-not-found)
    - [log](#log)
  - [TODO don't delete all data bags from server, instead just delete ones from this test](#todo-dont-delete-all-data-bags-from-server-instead-just-delete-ones-from-this-test)
  - [TODO use berkshelf? instead of committing cookbooks](#todo-use-berkshelf-instead-of-committing-cookbooks)
  - [DONE Error executing action \`remove\` on resource 'users~manage~\[rebels\]'](#done-error-executing-action-%5Cremove%5C-on-resource-usersmanage%5Crebels%5C)
    - [log: working](#log-working)
    - [log: failing](#log-failing)
    - [log: failing2](#log-failing2)
    - [log: failing3](#log-failing3)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

following along in Managing Users and SSH Keys in a Hybrid World
================================================================

summary
-------

-   <https://www.chef.io/blog/2014/07/10/managing-users-and-ssh-keys-in-a-hybrid-world/>
-   <https://api.opscode.com/organizations/streambox/data_bags/users>

I'm a noob here...no idea what I'm doing. This helps me start from
scratch each time.

DONE ../cookbook-template/generate.sh: line 25: ruby: command not found
-----------------------------------------------------------------------

CLOSED: \[2016-06-12 Sun 13:54\]

    ../cookbook-template/generate.sh: line 25: ruby: command not found

resolved by manually adding this to \~/.bashrc

    export PATH="/opt/chefdk/embedded/bin:${HOME}/.chefdk/gem/ruby/2.1.0/bin:$PATH"

After installing chefdk

    curl https://omnitruck.chef.io/install.sh | bash -s -- -c current -P chefdk

### log

    make
    ...
     create mode 100644 cookbooks/my_users/test/integration/default/serverspec/default_spec.rb
     create mode 100644 cookbooks/my_users/test/integration/helpers/serverspec/spec_helper.rb
    ../cookbook-template/generate.sh: line 25: ruby: command not found
    make: *** [setup] Error 1
    [root@ub4:~/chef-practice/manage-users(master)]$

TODO don't delete all data bags from server, instead just delete ones from this test
------------------------------------------------------------------------------------

    + xargs -r -n1 knife data bag delete --yes

TODO use berkshelf? instead of committing cookbooks
---------------------------------------------------

DONE Error executing action \`remove\` on resource 'users~manage~\[rebels\]'
----------------------------------------------------------------------------

CLOSED: \[2016-06-12 Sun 11:11\]

### log: working

    [demo@demos-MacBook-Pro:~/pdev/TaylorMonacelli/chef-practice/manage-users/userstest/cookbooks/my_users(master)]$ kitchen destroy all; kitchen converge ubu
    -----> Starting Kitchen (v1.8.0)
    -----> Destroying <default-ubuntu-1404>...
           Finished destroying <default-ubuntu-1404> (0m0.00s).
    -----> Destroying <default-centos-71>...
           Finished destroying <default-centos-71> (0m0.00s).
    -----> Kitchen is finished. (0m0.53s)
    -----> Starting Kitchen (v1.8.0)
    -----> Creating <default-ubuntu-1404>...
           Bringing machine 'default' up with 'virtualbox' provider...
           ==> default: Importing base box 'bento/ubuntu-14.04'...
    ==> default: Matching MAC address for NAT networking...
           ==> default: Checking if box 'bento/ubuntu-14.04' is up to date...
           ==> default: Setting the name of the VM: kitchen-my_users-default-ubuntu-1404_default_1465747949951_42275
           ==> default: Fixed port collision for 22 => 2222. Now on port 2202.
           ==> default: Clearing any previously set network interfaces...
           ==> default: Preparing network interfaces based on configuration...
               default: Adapter 1: nat
           ==> default: Forwarding ports...
               default: 22 (guest) => 2202 (host) (adapter 1)
           ==> default: Booting VM...
           ==> default: Waiting for machine to boot. This may take a few minutes...
               default: SSH address: 127.0.0.1:2202
               default: SSH username: vagrant
               default: SSH auth method: private key
               default: Warning: Remote connection disconnect. Retrying...
               default: Warning: Remote connection disconnect. Retrying...
               default:
               default: Vagrant insecure key detected. Vagrant will automatically replace
               default: this with a newly generated keypair for better security.
               default:
               default: Inserting generated public key within guest...
               default: Removing insecure key from the guest if it's present...
               default: Key inserted! Disconnecting and reconnecting using new SSH key...
           ==> default: Machine booted and ready!
           ==> default: Checking for guest additions in VM...
           ==> default: Setting hostname...
           ==> default: Mounting shared folders...
               default: /tmp/vagrant-cache => /Users/demo/.vagrant.d/cache/bento/ubuntu-14.04
           ==> default: Configuring cache buckets...
           ==> default: Skipping Pacman cache bucket as the guest machine does not support it
           ==> default: Skipping Yum cache bucket as the guest machine does not support it
           ==> default: Machine not provisioned because `--no-provision` is specified.
           [SSH] Established
           Vagrant instance <default-ubuntu-1404> created.
           Finished creating <default-ubuntu-1404> (0m29.01s).
    -----> Converging <default-ubuntu-1404>...
           Preparing files for transfer
           Preparing dna.json
           Resolving cookbook dependencies with Berkshelf 4.3.3...
           Removing non-cookbook files before transfer
           Preparing data_bags
           Preparing validation.pem
           Preparing client.rb
    -----> Installing Chef Omnibus (12.10.24)
           Downloading https://www.chef.io/chef/install.sh to file /tmp/install.sh
           Trying wget...
           Download complete.
           ubuntu 14.04 x86_64
           Getting information for chef stable 12.10.24 for ubuntu...
           downloading https://omnitruck-direct.chef.io/stable/chef/metadata?v=12.10.24&p=ubuntu&pv=14.04&m=x86_64
             to file /tmp/install.sh.1666/metadata.txt
           trying wget...
           sha1 7d30b300f95f00036919ee8bf3b95ab73429e57e
           sha256   663d6c42c90bbb9463bc02a7c5d777f7aa6ebd52c071a0c1963bc8c4db76dea2
           url  https://packages.chef.io/stable/ubuntu/14.04/chef_12.10.24-1_amd64.deb
           version  12.10.24
           downloaded metadata file looks valid...
           /tmp/vagrant-cache/vagrant_omnibus/chef_12.10.24-1_amd64.deb already exists, verifiying checksum...
           Comparing checksum with sha256sum...
           checksum compare succeeded, using existing file!
           Installing chef 12.10.24
           installing with dpkg...
           Selecting previously unselected package chef.
    (Reading database ... 32948 files and directories currently installed.)
           Preparing to unpack .../chef_12.10.24-1_amd64.deb ...
           Unpacking chef (12.10.24-1) ...
           Setting up chef (12.10.24-1) ...
           Thank you for installing Chef!
           Transferring files to <default-ubuntu-1404>
           Starting Chef Client, version 12.10.24
           Creating a new client identity for default-ubuntu-1404 using the validator key.
           resolving cookbooks for run list: ["my_users::default"]
           Synchronizing Cookbooks:
             - my_users (0.1.0)
             - sudo (2.9.0)
             - users (2.0.3)
           Installing Cookbook Gems:
           Compiling Cookbooks...
           Converging 1 resources
           Recipe: my_users::default
             * users_manage[rebels] action remove
               * user[leia] action remove (up to date)
                (up to date)
             * users_manage[rebels] action create
               * group[chewbacca] action create (skipped due to only_if)
               * user[chewbacca] action create
                 - create user chewbacca
               * user[chewbacca] action lock (up to date)
               * directory[/home/kashyyyk/.ssh] action create (skipped due to only_if)
               * template[/home/kashyyyk/.ssh/authorized_keys] action create (skipped due to only_if)
               * group[han] action create (skipped due to only_if)
               * user[han] action create
                 - create user han
               * directory[/opt/carbonite/.ssh] action create
                 - create new directory /opt/carbonite/.ssh
                 - change mode from '' to '0700'
                 - change owner from '' to 'han'
               * template[/opt/carbonite/.ssh/authorized_keys] action create
                 - create new file /opt/carbonite/.ssh/authorized_keys
                 - update content in file /opt/carbonite/.ssh/authorized_keys from none to a1efc2
                 --- /opt/carbonite/.ssh/authorized_keys    2016-06-12 16:12:58.461702047 +0000
                 +++ /opt/carbonite/.ssh/.chef-authorized_keys20160612-1752-1ss0k6e 2016-06-12 16:12:58.461702047 +0000
                 @@ -1 +1,6 @@
                 +# Generated by Chef
                 +# Local modifications will be overwritten.
                 +
                 +AAA123...xyz== foo
                 +AAA456...uvw== bar
                 - change mode from '' to '0600'
                 - change owner from '' to 'han'
               * group[sidekicks] action manage (up to date)
               * group[scoundrels] action manage (up to date)
               * group[sysadmin] action manage (up to date)
               * group[rebels] action create
                 - create group rebels


           Running handlers:
           Running handlers complete
           Chef Client finished, 6/16 resources updated in 01 seconds
           Finished converging <default-ubuntu-1404> (0m9.66s).
    -----> Kitchen is finished. (0m39.19s)
    [demo@demos-MacBook-Pro:~/pdev/TaylorMonacelli/chef-practice/manage-users/userstest/cookbooks/my_users(master)]$

### log: failing

If I comment out

    #  data_bags_path: ../../data_bags

in
`/Users/demo/pdev/TaylorMonacelli/chef-practice/manage-users/userstest/cookbooks/my_users/.kitchen.yml`:

    [demo@demos-MacBook-Pro:~/pdev/TaylorMonacelli/chef-practice/manage-users/userstest/cookbooks/my_users(master)]$ cat /Users/demo/pdev/TaylorMonacelli/chef-practice/manage-users/userstest/cookbooks/my_users/.kitchen.yml
    ---
    driver:
      name: vagrant
      vagrantfiles:
      - VagrantAdditionalConfig.rb
    provisioner:
      name: chef_zero
      chef_omnibus_install_options: -d /tmp/vagrant-cache/vagrant_omnibus
      require_chef_omnibus: 12.10.24
    platforms:
    - name: ubuntu-14.04
    - name: centos-7.1
    suites:
    - name: default
      run_list:
      - recipe[my_users::default]
      attributes:
    #  data_bags_path: ../../data_bags
    [demo@demos-MacBook-Pro:~/pdev/TaylorMonacelli/chef-practice/manage-users/userstest/cookbooks/my_users(master)]$

then I get error `` Error executing action `remove` on resource
'users_manage[rebels]' ``

    [demo@demos-MacBook-Pro:~/pdev/TaylorMonacelli/chef-practice/manage-users/userstest/cookbooks/my_users(master)]$ kitchen destroy all; kitchen converge ubu
    -----> Starting Kitchen (v1.8.0)
    -----> Destroying <default-ubuntu-1404>...
           ==> default: Forcing shutdown of VM...
           ==> default: Destroying VM and associated drives...
           Vagrant instance <default-ubuntu-1404> destroyed.
           Finished destroying <default-ubuntu-1404> (0m4.39s).
    -----> Destroying <default-centos-71>...
           Finished destroying <default-centos-71> (0m0.00s).
    -----> Kitchen is finished. (0m4.90s)
    -----> Starting Kitchen (v1.8.0)
    -----> Creating <default-ubuntu-1404>...
           Bringing machine 'default' up with 'virtualbox' provider...
           ==> default: Importing base box 'bento/ubuntu-14.04'...
    ==> default: Matching MAC address for NAT networking...
           ==> default: Checking if box 'bento/ubuntu-14.04' is up to date...
           ==> default: Setting the name of the VM: kitchen-my_users-default-ubuntu-1404_default_1465748772221_2733
           ==> default: Clearing any previously set network interfaces...
           ==> default: Preparing network interfaces based on configuration...
               default: Adapter 1: nat
           ==> default: Forwarding ports...
               default: 22 (guest) => 2222 (host) (adapter 1)
           ==> default: Booting VM...
           ==> default: Waiting for machine to boot. This may take a few minutes...
               default: SSH address: 127.0.0.1:2222
               default: SSH username: vagrant
               default: SSH auth method: private key
               default: Warning: Remote connection disconnect. Retrying...
               default:
               default: Vagrant insecure key detected. Vagrant will automatically replace
               default: this with a newly generated keypair for better security.
               default:
               default: Inserting generated public key within guest...
               default: Removing insecure key from the guest if it's present...
               default: Key inserted! Disconnecting and reconnecting using new SSH key...
           ==> default: Machine booted and ready!
           ==> default: Checking for guest additions in VM...
           ==> default: Setting hostname...
           ==> default: Mounting shared folders...
               default: /tmp/vagrant-cache => /Users/demo/.vagrant.d/cache/bento/ubuntu-14.04
           ==> default: Configuring cache buckets...
           ==> default: Skipping Pacman cache bucket as the guest machine does not support it
           ==> default: Skipping Yum cache bucket as the guest machine does not support it
           ==> default: Machine not provisioned because `--no-provision` is specified.
           [SSH] Established
           Vagrant instance <default-ubuntu-1404> created.
           Finished creating <default-ubuntu-1404> (0m32.67s).
    -----> Converging <default-ubuntu-1404>...
           Preparing files for transfer
           Preparing dna.json
           Resolving cookbook dependencies with Berkshelf 4.3.3...
           Removing non-cookbook files before transfer
           Preparing validation.pem
           Preparing client.rb
    -----> Installing Chef Omnibus (12.10.24)
           Downloading https://www.chef.io/chef/install.sh to file /tmp/install.sh
           Trying wget...
           Download complete.
           ubuntu 14.04 x86_64
           Getting information for chef stable 12.10.24 for ubuntu...
           downloading https://omnitruck-direct.chef.io/stable/chef/metadata?v=12.10.24&p=ubuntu&pv=14.04&m=x86_64
             to file /tmp/install.sh.1667/metadata.txt
           trying wget...
           sha1 7d30b300f95f00036919ee8bf3b95ab73429e57e
           sha256   663d6c42c90bbb9463bc02a7c5d777f7aa6ebd52c071a0c1963bc8c4db76dea2
           url  https://packages.chef.io/stable/ubuntu/14.04/chef_12.10.24-1_amd64.deb
           version  12.10.24
           downloaded metadata file looks valid...
           /tmp/vagrant-cache/vagrant_omnibus/chef_12.10.24-1_amd64.deb already exists, verifiying checksum...
           Comparing checksum with sha256sum...
           checksum compare succeeded, using existing file!
           Installing chef 12.10.24
           installing with dpkg...
           Selecting previously unselected package chef.
    (Reading database ... 32948 files and directories currently installed.)
           Preparing to unpack .../chef_12.10.24-1_amd64.deb ...
           Unpacking chef (12.10.24-1) ...
           Setting up chef (12.10.24-1) ...
           Thank you for installing Chef!
           Transferring files to <default-ubuntu-1404>
           Starting Chef Client, version 12.10.24
           Creating a new client identity for default-ubuntu-1404 using the validator key.
           resolving cookbooks for run list: ["my_users::default"]
           Synchronizing Cookbooks:
             - my_users (0.1.0)
             - users (2.0.3)
             - sudo (2.9.0)
           Installing Cookbook Gems:
           Compiling Cookbooks...
           Converging 1 resources
           Recipe: my_users::default
             * users_manage[rebels] action remove

               ================================================================================
               Error executing action `remove` on resource 'users_manage[rebels]'
               ================================================================================

               Net::HTTPServerException
               ------------------------
               404 "Not Found"

               Cookbook Trace:
               ---------------
               /tmp/kitchen/cache/cookbooks/users/providers/manage.rb:42:in `block in class_from_file'

               Resource Declaration:
               ---------------------
               # In /tmp/kitchen/cache/cookbooks/my_users/recipes/default.rb

                 7: users_manage "rebels" do
                 8:    group_id 1138
                 9:    action [ :remove, :create ]
                10: end

               Compiled Resource:
               ------------------
               # Declared in /tmp/kitchen/cache/cookbooks/my_users/recipes/default.rb:7:in `from_file'

               users_manage("rebels") do
                 action [:remove, :create]
                 retries 0
                 retry_delay 2
                 default_guard_interpreter :default
                 declared_type :users_manage
                 cookbook_name "my_users"
                 recipe_name "default"
                 group_id 1138
                 data_bag "users"
                 search_group "rebels"
               end

               Platform:
               ---------
               x86_64-linux


           Running handlers:
           [2016-06-12T16:26:42+00:00] ERROR: Running exception handlers
           Running handlers complete
           [2016-06-12T16:26:42+00:00] ERROR: Exception handlers complete
           Chef Client failed. 0 resources updated in 01 seconds
           [2016-06-12T16:26:42+00:00] FATAL: Stacktrace dumped to /tmp/kitchen/cache/chef-stacktrace.out
           [2016-06-12T16:26:42+00:00] FATAL: Please provide the contents of the stacktrace.out file if you file a bug report
           [2016-06-12T16:26:42+00:00] ERROR: users_manage[rebels] (my_users::default line 7) had an error: Net::HTTPServerException: 404 "Not Found"
           [2016-06-12T16:26:42+00:00] FATAL: Chef::Exceptions::ChildConvergeError: Chef run process exited unsuccessfully (exit code 1)
    >>>>>> Converge failed on instance <default-ubuntu-1404>.
    >>>>>> Please see .kitchen/logs/default-ubuntu-1404.log for more details
    >>>>>> ------Exception-------
    >>>>>> Class: Kitchen::ActionFailed
    >>>>>> Message: SSH exited (1) for command: [sh -c '

    sudo -E /opt/chef/bin/chef-client --local-mode --config /tmp/kitchen/client.rb --log_level auto --force-formatter --no-color --json-attributes /tmp/kitchen/dna.json --chef-zero-port 8889
    ']
    >>>>>> ----------------------
    zlib(finalizer): the stream was freed prematurely.
    [demo@demos-MacBook-Pro:~/pdev/TaylorMonacelli/chef-practice/manage-users/userstest/cookbooks/my_users(master)]$

### log: failing2

Net::HTTPServerException: users~manage~\[rebels\] (my~users~::default
line 7) had an error: Net::HTTPServerException: 404 "Not Found"

<https://goo.gl/WIxins> users~manage~ had an error:
Net::HTTPServerException: 404 "Not Found"

users~manage~ Net::HTTPServerException: 404 "Not Found"

chef users~manage~

    [demo@demos-MacBook-Pro:~/pdev/TaylorMonacelli/chef-practice/cookbook-template/userstest/cookbooks/my_users(master)]$ kitchen login ubu
    Welcome to Ubuntu 14.04.4 LTS (GNU/Linux 3.13.0-86-generic x86_64)

     * Documentation:  https://help.ubuntu.com/
    Last login: Sun Jun 12 06:29:18 2016 from 10.0.2.2
    vagrant@default-ubuntu-1404:~$ sudo cat /tmp/kitchen/cache/chef-stacktrace.out
    Generated at 2016-06-12 06:29:23 +0000
    Net::HTTPServerException: users_manage[rebels] (my_users::default line 7) had an error: Net::HTTPServerException: 404 "Not Found"
    /opt/chef/embedded/lib/ruby/2.1.0/net/http/response.rb:119:in `error!'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/http.rb:146:in `request'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/http.rb:111:in `get'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/search/query.rb:158:in `call_rest_service'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/search/query.rb:87:in `search'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/dsl/data_query.rb:39:in `search'
    /tmp/kitchen/cache/cookbooks/users/providers/manage.rb:42:in `block in class_from_file'
    (eval):2:in `block in action_remove'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/provider.rb:361:in `instance_eval'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/provider.rb:361:in `compile_and_converge_action'
    (eval):2:in `action_remove'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/provider.rb:145:in `run_action'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/resource.rb:596:in `run_action'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/runner.rb:69:in `run_action'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/runner.rb:97:in `block (2 levels) in converge'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/runner.rb:97:in `each'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/runner.rb:97:in `block in converge'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/resource_collection/resource_list.rb:94:in `block in execute_each_resource'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/resource_collection/stepable_iterator.rb:116:in `call'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/resource_collection/stepable_iterator.rb:116:in `call_iterator_block'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/resource_collection/stepable_iterator.rb:85:in `step'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/resource_collection/stepable_iterator.rb:104:in `iterate'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/resource_collection/stepable_iterator.rb:55:in `each_with_index'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/resource_collection/resource_list.rb:92:in `execute_each_resource'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/runner.rb:96:in `converge'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/client.rb:667:in `block in converge'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/client.rb:662:in `catch'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/client.rb:662:in `converge'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/client.rb:701:in `converge_and_save'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/client.rb:281:in `run'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application.rb:285:in `block in fork_chef_client'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application.rb:273:in `fork'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application.rb:273:in `fork_chef_client'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application.rb:238:in `block in run_chef_client'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/local_mode.rb:44:in `with_server_connectivity'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application.rb:226:in `run_chef_client'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application/client.rb:456:in `sleep_then_run_chef_client'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application/client.rb:443:in `block in interval_run_chef_client'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application/client.rb:442:in `loop'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application/client.rb:442:in `interval_run_chef_client'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application/client.rb:426:in `run_application'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/lib/chef/application.rb:58:in `run'
    /opt/chef/embedded/lib/ruby/gems/2.1.0/gems/chef-12.10.24/bin/chef-client:26:in `<top (required)>'
    /opt/chef/bin/chef-client:51:in `load'
    /opt/chef/bin/chef-client:51:in `<main>'vagrant@default-ubuntu-1404:~$

### log: failing3

    Error executing action `create` on resource 'users_manage'
    Error executing action `create` on resource 'users_manage[rebels]'
    Net::HTTPServerException
    404 "Not Found"

    404 "Not Found" Net::HTTPServerException Error executing action `create` on resource 'users_manage'

    I, [2016-06-11T22:17:18.778533 #79326]  INFO -- default-ubuntu-1404:     Error executing action `create` on resource 'users_manage[rebels]'
    I, [2016-06-11T22:17:18.779226 #79326]  INFO -- default-ubuntu-1404:     ================================================================================
    I, [2016-06-11T22:17:18.779721 #79326]  INFO -- default-ubuntu-1404:
    I, [2016-06-11T22:17:18.780337 #79326]  INFO -- default-ubuntu-1404:     Net::HTTPServerException
    I, [2016-06-11T22:17:18.780915 #79326]  INFO -- default-ubuntu-1404:     ------------------------
    I, [2016-06-11T22:17:18.781285 #79326]  INFO -- default-ubuntu-1404:     404 "Not Found"
    I, [2016-06-11T22:17:18.781525 #79326]  INFO -- default-ubuntu-1404:
    I, [2016-06-11T22:17:18.781850 #79326]  INFO -- default-ubuntu-1404:     Cookbook Trace:
    I, [2016-06-11T22:17:18.782384 #79326]  INFO -- default-ubuntu-1404:     ---------------
    I, [2016-06-11T22:17:18.782410 #79326]  INFO -- default-ubuntu-1404:     /tmp/kitchen/cache/cookbooks/users/providers/manage.rb:58:in `block in class_from_file'
    I, [2016-06-11T22:17:18.782724 #79326]  INFO -- default-ubuntu-1404:
