# Health-Cloud-Sfdx-Template
A template for spinning up a Health Cloud-backed scratch org. To spin up the current release of health cloud, use the following commands to start and open your org.

```
$ sfdx run start
$ sfdx run open
```

You can let your scratch org expire on its own, but try and be nice to your org limits and stop your org when you are done with it by executing `sfdx run stop`.


# Creating a pre-release version of Health Cloud
During a Salesforce release window, you can also use this template to spin up a pre-release version of Health Cloud.

```
$ sfdx run start-prerelease
$ sfdx run open-prerelease
```

To clean up after creating a pre-release version, please execute `sfdx run stop-prerelease`.

# Prerequisites
This project makes use of a few sfdx plugins including `@apprio/sfdx-scripts` and `sfdx-wry-plugin`. You can install them using the `sfdx plugins:install` command.

```
$ sfdx plugins:install @appirio/sfdx-scripts
$ sfdx plugins:install sfdx-wry-plugin
```

# Releases
Please review the [changelog](CHANGELOG) for more detailed information about each release.

** This project has no releases **