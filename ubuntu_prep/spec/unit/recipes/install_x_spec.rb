#
# Cookbook:: ubuntu_prep
# Spec:: install_x_spec
#
# Check the install_x recipe.
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'ubuntu_prep::install_x' do
  context 'Ubuntu 16.04' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    [ 'xauth', 'xorg', 'openbox', 'gnome-terminal' ].each do |package_name|
      it "installs package #{package_name}" do
        expect(chef_run).to install_package("#{package_name}")
      end
    end
  end
end
