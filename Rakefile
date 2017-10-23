# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require_relative 'app/operation/book_builder'

Rails.application.load_tasks

desc "Generates pdf"
task :pdf do
  builder = BookBuilder.new(
    name: 'Les chansons de loulou',
    path: Rails.configuration.chanson_path
  )
  builder.perform
end