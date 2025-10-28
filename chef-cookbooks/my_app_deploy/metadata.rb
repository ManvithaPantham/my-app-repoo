name             'my_app_deploy'
maintainer       'Manvitha'
maintainer_email 'manvithapantham@gmail.com'
license          'All Rights Reserved'
description      'Deploys the My App application'
version          '0.1.0'
chef_version     '>= 15.0'

# Specify where your recipe(s) are located
recipe 'my_app_deploy::default', 'Default recipe for deploying the app'
