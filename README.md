# example-drone-build-parameter

If you use Jenkins, you can set build parameters with Web UI for each builds.

https://wiki.jenkins.io/display/JENKINS/Parameterized+Build

On the other hand, [Drone](https://drone.io) doesn't provide such a function.

To be honest, I don't need this feature but I consider how to implement similar function at Drone in order to assist the migration from Jenkins to Drone .

Note that this is just an example.
You can (and should) customize scripts as you like.

## Usage

In this example we trigger builds by `tag` event.
In order to deploy, run the shell script.

```console
$ bash scripts/deploy.sh
```

Then the editor is launched and the file to set build parameter is open.
After you edit the build parameter,
the file is commited and a git tag is created and the commit and tag are pushed.

You can manage each build's build parameters as source codes.
