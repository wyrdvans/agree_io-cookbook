# Agree IO Cookbook

## Overview
This cookbook provisions a server to run the [Agree IO](https://github.com/Element84/agree-io) application.

## Development Workflow
Development of this cookbook requires the [ChefDK](https://downloads.chef.io/chefdk). The following workflow is suggested:

1. Write [ChefSpec](https://github.com/chefspec/chefspec) tests in the `spec/` directory.
2. Run `delivery local verify` to execute syntax checks and rspec tests.
3. Fix broken tests by writing [Chef](https://docs.chef.io) code
4. Once the tests are unit tests are successfully passing, attempt to provision a server with `delivery local deploy`.
5. Next modify/run `delivery local smoke` to run the [InSpec](https://www.inspec.io) tests in the `test/smoke/` directory.
6. Once all test pass, commit your changes and submit your PR for review.

To cleanup any VMs created by the testing process, run `delivery local cleanup`.

To troubleshoot the VMs, you can access them using the `kitchen` command. See `kitchen --help` for more information.
