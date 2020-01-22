# Gulp Doker Sync

A Gulp file watcher script that keeps the local files in sync with their deployed version from a docker container.

Usefull when using a container to host (web) applications (php, nodejs) and not wanting to mess around with volumes (which tent to be buggy on MacOS and when running Linux containers on Windows).

#### Getting started

1. Install **npm**
1. Create an instance of the desired container with the initial source code files bundled in
1. Install gulp with
    ``` bash
        npm restore
    ```
1. Update the **file-watcher-config.json** with the correct **remote path** (inside the container) and local **root folder to watch**
1. Open a command line and start **gulp** with
    ``` bash
        gulp
    ```
1. Start editing your source code


#### Synced operations
1. add / edit / delete files
1. add / delete folders


#### To do
1. Rename folder