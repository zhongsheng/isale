# desc "Explaining what the task does"
namespace :isale do
  task :setup do
    pp "hello world"
    # Task goes here
    Rake::Task['isale:doit'].invoke
  end
  task :doit do
    pp 'doit'
  end

end
