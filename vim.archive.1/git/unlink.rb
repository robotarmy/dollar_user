#/usr/bin/env ruby
require 'FileUtils'
include FileUtils
def die(msg)
  puts msg
  exit
end
current_dir = pwd()
vim_install = "~/vim/"
vim_dir = ARGV.shift or die("The argument is the directory that is the addon - ie vim-cucumber")
files = []
Dir["#{vim_dir}/*"].each do|add_on|
  if File.directory?(add_on)
    link_list = Dir[File.join(current_dir, add_on,"*")]
    vim_addon = add_on.split('/').last
    link_dir = File.expand_path(File.join(vim_install,vim_addon))
    link_list.each do |src|
    link_path  = File.join(link_dir,File.basename(src))
    rm link_path, :verbose => true
  end
  end
end



