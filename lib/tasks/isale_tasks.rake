# desc "Explaining what the task does"
namespace :isale do
  task :setup do
    puts "Install Isale"
    puts "Copy assets"
    Rake::Task['isale:assets'].invoke

    puts "Yarn install"
    Rake::Task['isale:yarn'].invoke
  end

  task :yarn do
    `yarn --check-file`
    `yarn add @fortawesome/fontawesome-free`
    `yarn add like-ruby`
    `yarn add qiniu-js`
    `yarn add stimulus`
    `yarn add bootstrap`
  end

  task :assets do
    assets_path = File.expand_path("../../../test/dummy/app/javascript/", __FILE__)
    puts Rails.root
    FileUtils.cp_r assets_path+'/isale', File.join(Rails.root, 'app/javascript/')
    FileUtils.cp_r assets_path+'/packs/isale', File.join(Rails.root, 'app/javascript/packs')

  end

end
