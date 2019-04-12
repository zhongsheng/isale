# isale install
namespace :isale do
  task setup: [:yarn_install, :copy_assets] do
    puts "Install Isale"
  end

  task :yarn_install do
    puts "Yarn install"
    `yarn --check-file`
    system "yarn install --no-progress"
    packs = %w(@fortawesome/fontawesome-free @rails/ujs bootstrap jquery like-ruby popper.js qiniu-js stimulus trix turbolinks)
    packs.each do |pack|
      system "yarn add #{pack}"
    end
    # Dir.chdir(File.join(__dir__, "../../../test/dummy")) do
    # end
  end

  task :copy_assets do
    puts "Copy assets"
    assets_path = File.expand_path("../../../test/dummy/app/javascript/", __FILE__)
    puts Rails.root
    FileUtils.cp_r assets_path+'/isale', File.join(Rails.root, 'app/javascript/')
    FileUtils.cp_r assets_path+'/packs/isale', File.join(Rails.root, 'app/javascript/packs')
  end

end
