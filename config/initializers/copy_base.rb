require 'rake'
require_relative '../../app/services/application_service'
require_relative '../../app/services/airtable/fetch_data_on_load'

Rails.application.load_tasks

Rake::Task['import:copy_base'].invoke
Rake::Task['import:copy_base'].reenable
