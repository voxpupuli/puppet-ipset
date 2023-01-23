# frozen_string_literal: true

require 'spec_helper'

describe 'ipset' do
  let :node do
    'agent.example.com'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        if facts[:os]['release']['major'].to_i == 6
          facts.merge(systemd: false, service_provider: 'redhat')
        else
          facts.merge(systemd: true, service_provider: 'systemd')
        end
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

        if facts[:os]['release']['major'].to_i == 6
          it { is_expected.not_to contain_systemd__unit_file('ipset.service') }
          it { is_expected.to contain_service('ipset') }
          it { is_expected.to contain_file('/etc/init.d/ipset') }
        else
          it { is_expected.to contain_systemd__unit_file('ipset.service') }
          # ipset service is configured via camptocamp/systemd
          it { is_expected.not_to contain_service('ipset') }
          it { is_expected.not_to contain_file('/etc/init/ipset.conf') }
        end

        if facts[:os]['family'] == 'RedHat' && facts[:os]['release']['major'].to_i >= 7
          it { is_expected.to contain_package('ipset-service') }
        else
          it { is_expected.not_to contain_package('ipset-service') }
        end
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
              },
              'port-set' => {
                'set' => "[5000, 5001, 5999]",
                'type' => 'bitmap:port',
                'options' => {
                  'range' => '5000-6000'
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
          expect(subject).to contain_ipset__set('basic-set-v6').\
            with(
              'set' => "['fc00::1/128', 'fc00::2/128', 'fc00::2/128']",
              'type' => 'hash:net',
              'options' => {
                'family' => 'inet6'
              }
            )
          expect(subject).to contain_ipset__set('port-set').\
            with(
              'set' => "[5000, 5001, 5999]",
              'type' => 'bitmap:port',
              'options' => {
                'range' => '5000-6000'
              }
            )
        end
      end
    end
  end
end
