**Artifactory**
===========
Run [Artifactory][1] OSS 3.4.1 inside a Docker container.

This Dockerfile creates an image to run a clean Artifactory OSS 3.4.1 installation.

Port
====
By default Artifactory listen on port `8081`.

Volumes
=======
Artifactory directories `data`, `log` and `backup` directories are exposed as volumes:

    /artifactory/data
    /artifactory/logs
    /artifactory/backup

How to run it
=============
$ docker run -d -p 8081:8081 asm2545w/artifactory:3.4.1

Then point the browser to `http://localhost:8081`.

Sync artifactory data in dropbox
-------
Just mounting an host => docker shared volume and having the artifactory data stored in dropbox:

    $ docker run -d -p 8081:8081 asm2545w/artifactory:3.4.1 -v /path/to/dropbox/artifactory:/artifactory/data

Links
=====

See [Docker hub repository][2].



  [1]: http://www.jfrog.com/open-source
  [2]: http://registry.hub.docker.com/u/asm2545w/artifactory
