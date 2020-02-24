# Health-Cloud-Sfdx-Template
A template for spinning up a Health Cloud-backed scratch org. To spin up the current release of [Health Cloud](https://www.salesforce.com/products/health-cloud/overview/), use the following commands to start and open your org.

```
$ healthcloud start
$ healthcloud open
```

You can let your scratch org expire on its own, but try and be nice to your org limits and stop your scratch org when you are done with it by executing `healthcloud stop`.

Your scratch org will have the alias `healthcloud`.

# Creating a pre-release version of Health Cloud
During a Salesforce release window, you can also use this template to spin up a pre-release version of Health Cloud.

```
$ healthcloud start --prerelease
$ healthcloud open --prerelease
```

To clean up after creating a pre-release version,please execute `healthcloud stop --prerelease`.

Your pre-release scratch org will have the alias `healthcloud-prerelease`.

# Health Cloud Package Versions
The version numbers for what is the 'release' and 'pre-release' package of Healthcloud are manually maintained in cooperation with Salesforce. As new versions become available in the Health Cloud release cycle those will be reflected here with accompianing notes.

# Prerequisites
This template requires Salesforce DX. Please visit https://developer.salesforce.com/platform/dx to install and configure Salesforce DX on your local machine.


# Releases
Please review the [changelog](CHANGELOG) for more detailed information about each release.

## [1.0.0] - 2020-01-21
Initial release.
