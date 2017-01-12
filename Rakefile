require 'rake'
require 'erb'

desc "install vim-plug and install plugins"
task :vim do
  install_vimplug
end

desc "install leiningen"
task :clojure do
  install_clojure
end

desc "install YouCompleteMe for vim"
task :completion do
  install_completion
end

desc "install brew and applications"
task :brew do
  install_brew
end

desc "install brew cask applications"
task :cask do
  install_brew_cask
end

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
  switch_to_zsh
  install_vimplug
  install_spacemacs
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md LICENSE oh-my-zsh Tomorrow\ Night.itermcolors]
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  elsif file =~ /zshrc$/ # copy zshrc instead of link
    puts "copying ~/.#{file}"
    system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
  elsif file =~ /profiles.clj$/ # link to ~/.lein/profiles.clj
    puts "linking ~/.lein/profiles.clj"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.lein/#{file}"}
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def install_vundle
  if File.exist?(File.join(ENV['HOME'], ".vim", "bundle", "Vundle.vim"))
    puts "found ~/.vim/bundle/Vundle.vim"
  else
    puts "installing vundle"
    system %Q{git clone https://github.com/gmarik/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"}
  end
  puts "installing vundle plugins (causes flashing)"
  system %Q{vim +PluginClean +PluginInstall +qall}
end

def install_vimplug
  if File.exist?(File.join(ENV['HOME'], ".vim", "autoload", "plug.vim"))
    puts "found ~/.vim/autoload/plug.vim"
  else
    system %Q{curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim}

    puts "installing vim-plug"
  end
  system %Q{vim +PlugClean! +PlugUpgrade +PlugUpdate +PlugInstall +qall}
end

def install_completion
  system %Q{~/.vim/plugged/YouCompleteMe/install.py --tern-completer}
  puts "compiling YouCompleteMe"
end

def install_clojure
  system %Q{brew install leiningen}
end

def install_brew
  system %Q{/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"}
  system %Q{brew install zsh}
  system %Q{brew install macvim}
  system %Q{brew install neovim}
  system %Q{brew install node}
  system %Q{brew install ruby}
  system %Q{brew install python}
end

def install_brew_cask
  system %Q{brew tap caskroom/cask}
  system %Q{brew cask install firefox}
  system %Q{brew cask install google-chrome}
  system %Q{brew cask install alfred}
  system %Q{brew cask install gpgtools}
  system %Q{brew cask install musicbrainz-picard}
  system %Q{brew cask install xld}
  system %Q{brew cask install flux}
  system %Q{brew cask install atom}
  system %Q{brew cask install dropbox}
end

def install_spacemacs
  system %Q{brew tap d12frosted/emacs-plus}
  systen %Q{brew install emacs-plus}
  systen %Q{brew linkapps emacs-plus}
  system %Q{git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d}
end
