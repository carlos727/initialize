# CHANGELOG

##### Changelog v2.0.0 09/05/2017:

- Improve code of recipes according to Ruby Style Guide.

- Delete libraries folder, now use methods of the cookbooks that run at the same time.

- Add `depends` and include default recipe of cookbooks: `tomcat_manager` and `deploy_tomcat_app`.

##### Changelog v1.3.3 15/02/2017:

- Resources related to `JSON` gem were deleted in `gem_install.rb` recipe. They aren't necessaries because of chef includes `JSON` gem.

##### Changelog v1.3.2 20/12/2016:

- Resource `execute Delete Chef Service'` was added in `initial_tasks.rb` recipe.

- Added Email notification to Panama.

##### Changelog v1.3.1 24/11/2016:

- Resource `windows_task 'Delete log File'` was deleted in `initial_tasks.rb` recipe.

##### Changelog v1.3.0 18/11/2016:

- New `upload_file.rb` recipe has the code to create schedule task of upload files process.

- Recipe `upload_file.rb` was included in `default.rb` and it uses the file upload-file.json.

##### Changelog v1.2.1 25/10/2016:

- Recipe `download_war.rb` only is executed in nodes that are type server.

##### Changelog v1.2.0 14/10/2016:

- Change from `gem_mechanize.rb` to `gem_install.rb` recipe.

- Recipe `gem_install.rb` has code to install ruby gems.

- Add new JSON gem.
