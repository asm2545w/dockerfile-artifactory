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

Pull docker image
=======

    $ docker pull asm2545w/artifactory:3.4.1

How to run it
=============
$ docker run -d -p 8081:8081 asm2545w/artifactory:3.4.1

Then point the browser to `http://localhost:8081`.

Links
=====

Dockerfile in [Github][2].



  [1]: http://www.jfrog.com/open-source
  [2]: http://github.com/asm2545w/dockerfile-artifactory
