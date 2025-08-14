# frozen_string_literal: true

require 'spec_helper'

describe 'ipset' do
  let :node do
    'agent.example.com'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with all defaults' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('ipset') }
        it { is_expected.to contain_file('/usr/local/bin/ipset_init') }
        it { is_expected.to contain_file('/usr/local/bin/ipset_sync') }

        if facts[:os]['family'] == 'RedHat'
          it { is_expected.not_to contain_file('/etc/ipset.d/') }
          it { is_expected.to contain_file('/etc/sysconfig/ipset.d') }
        else
          it { is_expected.to contain_file('/etc/ipset.d/') }
          it { is_expected.not_to contain_file('/etc/sysconfig/ipset.d') }
        end

        it { is_expected.to contain_systemd__unit_file('ipset.service') }
        # ipset service is configured via camptocamp/systemd
        it { is_expected.not_to contain_service('ipset') }
        it { is_expected.not_to contain_file('/etc/init/ipset.conf') }

        it { is_expected.to contain_package('ipset-service') } if facts[:os]['family'] == 'RedHat'
      end

      context 'with sets attributes' do
        let :params do
          {
            sets: {
              'basic-set-v4' => {
                'set' => "['10.0.0.1', '10.0.0.2', '10.0.0.42']",
                'type' => 'hash:net'
              },
              'basic-set-v6' => {
                'set' => "['fc00::1/128', 'fc00::2/128', 'fc00::2/128']",
                'type' => 'hash:net',
                'options' => {
                  'family' => 'inet6'
                }
              }
            }
          }
        end

        it do
          expect(subject).to contain_ipset__set('basic-set-v4'). \
            with(
              'set' => "['10.0.0.1', '10.0.0.2', '10.0.0.42']",
              'type' => 'hash:net'
            )
          expect(subject).to contain_ipset__set('basic-set-v6'). \
            with(
              'set' => "['fc00::1/128', 'fc00::2/128', 'fc00::2/128']",
              'type' => 'hash:net',
              'options' => {
                'family' => 'inet6'
              }
            )
        end
      end

      context 'when purge_config_dir => true' do
        let(:params) do
          {
            enable: true,
            package_ensure: 'present',
            config_path: '/etc/ipset.d',
            purge_config_dir: true,
          }
        end

        it 'sets purge => true on the config directory' do
          is_expected.to contain_file('/etc/ipset.d').with(
            'purge' => true
          )
        end
      end
    end
  end
end
