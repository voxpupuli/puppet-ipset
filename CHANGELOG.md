# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v2.2.0](https://github.com/voxpupuli/puppet-ipset/tree/v2.2.0) (2023-01-27)

[Full Changelog](https://github.com/voxpupuli/puppet-ipset/compare/v2.1.0...v2.2.0)

**Breaking changes:**

- Drop Debian 9/Ubuntu 16.04 support [\#62](https://github.com/voxpupuli/puppet-ipset/pull/62) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- bump puppet/systemd to \< 5.0.0 [\#77](https://github.com/voxpupuli/puppet-ipset/pull/77) ([jhoblitt](https://github.com/jhoblitt))
- Add Debian 11 and Ubuntu 20.04 [\#76](https://github.com/voxpupuli/puppet-ipset/pull/76) ([elfranne](https://github.com/elfranne))

**Fixed bugs:**

- subnet 32 should not be stripped in ipset\_sync [\#65](https://github.com/voxpupuli/puppet-ipset/issues/65)
- Potential for systemd dependency cycles [\#63](https://github.com/voxpupuli/puppet-ipset/issues/63)
- /32 is incorrectly stripped from IPv6 networks [\#30](https://github.com/voxpupuli/puppet-ipset/issues/30)
- Add dependency on debian iptables service [\#73](https://github.com/voxpupuli/puppet-ipset/pull/73) ([oliparcol](https://github.com/oliparcol))
- Enable CentOS/RHEL 8 support, stop triggering sync exec when nothing changes [\#71](https://github.com/voxpupuli/puppet-ipset/pull/71) ([WoutResseler](https://github.com/WoutResseler))
- update ipset\_sync a bug with ipv6 [\#66](https://github.com/voxpupuli/puppet-ipset/pull/66) ([muncjack](https://github.com/muncjack))
- Override DefaultDependencies on ipset service unit [\#64](https://github.com/voxpupuli/puppet-ipset/pull/64) ([sagepe](https://github.com/sagepe))

## [v2.1.0](https://github.com/voxpupuli/puppet-ipset/tree/v2.1.0) (2021-12-30)

[Full Changelog](https://github.com/voxpupuli/puppet-ipset/compare/v2.0.0...v2.1.0)

**Implemented enhancements:**

- use 'content' instead of 'source' to increase performance [\#60](https://github.com/voxpupuli/puppet-ipset/pull/60) ([kBite](https://github.com/kBite))

**Merged pull requests:**

- Allow stdlib 8.0.0 [\#52](https://github.com/voxpupuli/puppet-ipset/pull/52) ([smortex](https://github.com/smortex))
- switch from camptocamp/systemd to voxpupuli/systemd [\#51](https://github.com/voxpupuli/puppet-ipset/pull/51) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.0](https://github.com/voxpupuli/puppet-ipset/tree/v2.0.0) (2021-06-03)

[Full Changelog](https://github.com/voxpupuli/puppet-ipset/compare/v1.2.3...v2.0.0)

**Breaking changes:**

- Disable CentOS 8 support [\#48](https://github.com/voxpupuli/puppet-ipset/pull/48) ([bastelfreak](https://github.com/bastelfreak))
- Drop EoL Debian 8 support [\#47](https://github.com/voxpupuli/puppet-ipset/pull/47) ([bastelfreak](https://github.com/bastelfreak))
- Drop EoL CentOS 6 support [\#46](https://github.com/voxpupuli/puppet-ipset/pull/46) ([bastelfreak](https://github.com/bastelfreak))
- Drop Puppet 5 support; Add Puppet 7 support [\#43](https://github.com/voxpupuli/puppet-ipset/pull/43) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Make the 'set' parameter optional [\#23](https://github.com/voxpupuli/puppet-ipset/issues/23)
- add 'sets' hash to configure 'ipset::set' resource via Hiera [\#42](https://github.com/voxpupuli/puppet-ipset/pull/42) ([kBite](https://github.com/kBite))
- Add unmanaged ipset example to README.md [\#29](https://github.com/voxpupuli/puppet-ipset/pull/29) ([kasimon](https://github.com/kasimon))

**Fixed bugs:**

- Avoid emptying set file for unmanaged sets [\#40](https://github.com/voxpupuli/puppet-ipset/pull/40) ([mikesmitty](https://github.com/mikesmitty))

**Closed issues:**

- Set file for unmanaged ipsets is emptied on each puppet run [\#39](https://github.com/voxpupuli/puppet-ipset/issues/39)

**Merged pull requests:**

- camptocamp/systemd: Allow 3.x [\#45](https://github.com/voxpupuli/puppet-ipset/pull/45) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 7.x [\#44](https://github.com/voxpupuli/puppet-ipset/pull/44) ([bastelfreak](https://github.com/bastelfreak))
- fix typos in puppet-strings documentation / Add puppet-lint-param-docs linter [\#36](https://github.com/voxpupuli/puppet-ipset/pull/36) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 3.0.0 & puppet-lint updates [\#34](https://github.com/voxpupuli/puppet-ipset/pull/34) ([bastelfreak](https://github.com/bastelfreak))
- Fix ipset::set resource usage documentation [\#33](https://github.com/voxpupuli/puppet-ipset/pull/33) ([Hexta](https://github.com/Hexta))
- Use voxpupuli-acceptance [\#32](https://github.com/voxpupuli/puppet-ipset/pull/32) ([ekohl](https://github.com/ekohl))

## [v1.2.3](https://github.com/voxpupuli/puppet-ipset/tree/v1.2.3) (2020-03-04)

[Full Changelog](https://github.com/voxpupuli/puppet-ipset/compare/v1.2.1...v1.2.3)

**Fixed bugs:**

- Ignore hashsize to avoid conflicts on large sets [\#27](https://github.com/voxpupuli/puppet-ipset/pull/27) ([bastelfreak](https://github.com/bastelfreak))

**Closed issues:**

- hashsize is dynamic and produces errors on large sets [\#26](https://github.com/voxpupuli/puppet-ipset/issues/26)

## [v1.2.1](https://github.com/voxpupuli/puppet-ipset/tree/v1.2.1) (2020-03-02)

[Full Changelog](https://github.com/voxpupuli/puppet-ipset/compare/v1.2.0...v1.2.1)

**Fixed bugs:**

- CentOS 6: use correct sys v syntax [\#24](https://github.com/voxpupuli/puppet-ipset/pull/24) ([bastelfreak](https://github.com/bastelfreak))

## [v1.2.0](https://github.com/voxpupuli/puppet-ipset/tree/v1.2.0) (2019-11-18)

[Full Changelog](https://github.com/voxpupuli/puppet-ipset/compare/v1.1.0...v1.2.0)

**Implemented enhancements:**

- Add VirtuozzoLinux support [\#15](https://github.com/voxpupuli/puppet-ipset/pull/15) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- fix systemd unit dependencies [\#17](https://github.com/voxpupuli/puppet-ipset/pull/17) ([bastelfreak](https://github.com/bastelfreak))
- dont depend on working network connectivity [\#16](https://github.com/voxpupuli/puppet-ipset/pull/16) ([bastelfreak](https://github.com/bastelfreak))
- fix typo in ipset.service [\#14](https://github.com/voxpupuli/puppet-ipset/pull/14) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- systemd unit: switch target from basic to multi-user [\#18](https://github.com/voxpupuli/puppet-ipset/pull/18) ([bastelfreak](https://github.com/bastelfreak))
- Fix style in README example [\#10](https://github.com/voxpupuli/puppet-ipset/pull/10) ([ghoneycutt](https://github.com/ghoneycutt))

## [v1.1.0](https://github.com/voxpupuli/puppet-ipset/tree/v1.1.0) (2019-10-21)

[Full Changelog](https://github.com/voxpupuli/puppet-ipset/compare/v1.0.0...v1.1.0)

**Implemented enhancements:**

- ip lists: ensure file end with a  \n [\#12](https://github.com/voxpupuli/puppet-ipset/pull/12) ([bastelfreak](https://github.com/bastelfreak))
- Implement check for max title length [\#11](https://github.com/voxpupuli/puppet-ipset/pull/11) ([bastelfreak](https://github.com/bastelfreak))

## [v1.0.0](https://github.com/voxpupuli/puppet-ipset/tree/v1.0.0) (2019-10-08)

[Full Changelog](https://github.com/voxpupuli/puppet-ipset/compare/65cdcc16532949eb7c6638473ff2c87026db2db1...v1.0.0)

**Implemented enhancements:**

- improve datatypes / rename internal variables [\#4](https://github.com/voxpupuli/puppet-ipset/pull/4) ([bastelfreak](https://github.com/bastelfreak))
- enable CentOS 6 support [\#3](https://github.com/voxpupuli/puppet-ipset/pull/3) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- update puppet-strings/README.md documentation [\#6](https://github.com/voxpupuli/puppet-ipset/pull/6) ([bastelfreak](https://github.com/bastelfreak))
- Fix Rubocop/puppet-lint warnings & broken travis config & broken acceptance tests [\#1](https://github.com/voxpupuli/puppet-ipset/pull/1) ([bastelfreak](https://github.com/bastelfreak))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
