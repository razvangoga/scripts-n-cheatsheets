const {watch, series} = require('gulp');
const log = require('fancy-log');
const exec = require('child_process').exec;

var options = require('./file-watcher-config.json');

exports.default = function () {

    var here = process.cwd();
    var fileGlobs = [];
    var fileExtensionsLog = "";

    for (let i = 0; i < options.extensions.length; i++) {
        const extension = options.extensions[i];
        fileGlobs.push(`${options.rootFolderToWatch}/**/*.${extension}`);
        fileExtensionsLog += ` *.${extension}`;
    }

    log(`wathing changes to:${fileExtensionsLog}`);

    const filesWatcher = watch(fileGlobs,
        {
            cwd: './',
            ignoreInitial: true
        });

    filesWatcher.on("change", function (path, stats) {
        const localFile = here + '\\' + path;
        const remoteFile = options.remotePath + path.replace(options.rootFolderToWatch + '\\', '').replace(/\\/g, '/');

        log(`${path} was changed => updating remote file ${remoteFile}`);
        exec(`docker cp ${localFile} ${options.containerName}:${remoteFile}`, exports.errorHandler);
    });
    filesWatcher.on("add", function (path, stats) {
        const localFile = here + '\\' + path;
        const remoteFile = options.remotePath + path.replace(options.rootFolderToWatch + '\\', '').replace(/\\/g, '/');

        log(`${path} was created => adding remote file ${remoteFile}`);
        exec(`docker cp ${localFile} ${options.containerName}:${remoteFile}`, exports.errorHandler);
    });

    //delete file
    filesWatcher.on("unlink", function (path, stats) {
        const remoteFile = options.remotePath + path.replace(options.rootFolderToWatch + '\\', '').replace(/\\/g, '/');

        log(`${path} was deleted => deleting remote file ${remoteFile}`);
        //rm with -f so it will silently fail if the file is no longer there
        exec(`docker exec ${options.containerName} rm ${remoteFile} -f`, exports.errorHandler);
    });

    const foldersWatcher = watch([
            options.rootFolderToWatch,
        ],
        {
            cwd: './',
            ignoreInitial: true
        });

    foldersWatcher.on("addDir", function (path, stats) {
        const localFile = here + '\\' + path;
        const remoteFile = options.remotePath + path.replace(options.rootFolderToWatch + '\\', '').replace(/\\/g, '/');

        log(`${path} was created => creating remote folder ${remoteFile}`);
        exec(`docker exec ${options.containerName} mkdir ${remoteFile}`, exports.errorHandler);
    });

    foldersWatcher.on("unlinkDir", function (path, stats) {
        const localFile = here + '\\' + path;
        const remoteFile = options.remotePath + path.replace(options.rootFolderToWatch + '\\', '').replace(/\\/g, '/');

        log(`${path} was deleted => removing remote folder ${remoteFile}`);
        exec(`docker exec ${options.containerName} rm ${remoteFile} -rf`, exports.errorHandler);
    });
};

exports.errorHandler = function (err) {
    if (err) {
        log.error(err);
        return;
    }

    log('Done...');
};