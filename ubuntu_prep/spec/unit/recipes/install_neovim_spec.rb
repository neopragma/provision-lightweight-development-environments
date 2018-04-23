# Cookbook:: ubuntu_prep
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'ubuntu_prep::install_neovim' do
  context 'Ubuntu 16.04' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'adds repository neovim-ppa' do
      expect(chef_run).to add_apt_repository('neovim-ppa')
    end
 
    it 'runs bash script to set neovim as the default editor' do
      expect(chef_run).to run_bash('set neovim as the system default editor')
    end

    it 'creates the root neovim autoload directory' do 
      expect(chef_run).to create_directory('root nvim autoload directory')
    end 

    it 'creates the root neovim bundle directory ' do 
      expect(chef_run).to create_directory('root nvim bundle directory')
    end 

    it 'installs neovim plugin pathogen' do 
      expect(chef_run).to run_execute('install pathogen plugin')
    end

    it 'installs neovim plugin deoplete' do 
      expect(chef_run).to sync_git('/root/.config/nvim/bundle/deoplete')
    end 

    it 'installs neovim plugin neomake' do 
      expect(chef_run).to sync_git('/root/.config/nvim/bundle/neomake')
    end 

    it 'installs neovim plugin nerdtree' do 
      expect(chef_run).to sync_git('/root/.config/nvim/bundle/nerdtree')
    end 

    it 'installs neovim plugin nerdtree-git-plugin' do 
      expect(chef_run).to sync_git('/root/.config/nvim/bundle/nerdtree-git-plugin')
    end

    it 'installs neovim plugin bash-support' do 
      expect(chef_run).to sync_git('/root/.config/nvim/bundle/bash-support')
    end 

    it 'installs neovim plugin c-support' do 
      expect(chef_run).to sync_git('/root/.config/nvim/bundle/c-support')
    end 

    it 'installs neovim plugin python-mode' do 
      expect(chef_run).to sync_git('/root/.config/nvim/bundle/python-mode')
    end 
 
    it 'installs neovim plugin vi-ruby' do 
      expect(chef_run).to sync_git('/root/.config/nvim/bundle/vim-ruby')
    end 

    it 'creates the root neovim pack vendor directory ' do 
      expect(chef_run).to create_directory('root nvim pack vendor directory')
    end 

    it 'installs the Spacegray color theme in neovim' do 
      expect(chef_run).to sync_git('/root/.config/nvim/pack/vendor/start/Spacegray')
    end 

    it 'runs bash script to copy neovim configuration files to user dev' do 
      expect(chef_run).to run_bash('copy neovim configuration files and set ownership')
    end 
  
  end
end
