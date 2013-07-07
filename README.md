# CylonStuff

### Plugins and hooks ?

With Cylon, you can create plugins (and hooks in the future). Yeah.

In your cylon.yml configuration file, check the value: 'plugin_dir'.
That's the main directory to place both plugins and hooks.

During this explanation, we'll asume that your plugin_dir is '/usr/local/share/cylon'.

### Directory structure

You have to respect the directory structure.

In our example, we have just one plugin setup.

    $ cd /usr/local/share/cylon
    $ tree
      .
      ├── hooks
      └── plugins
          └── fs
              ├── fs.mod
              └── fs.modc

Each plugin or hook has its own directory.

You have to respect the directory structure.

### Quick start

    # mkdir -p /usr/local/share/cylon
    # chown -R user:group /usr/local/share/cylon
    $ git clone https://github.com/RocknRoot/CylonStuff.git /usr/local/share/cylon
    $ cd /usr/local/share/cylon
    # vi /etc/cylon.yml
    [change plugin_dir to /usr/local/share/cylon]

### Developing plugins

[Read the fraking manual.](https://github.com/RocknRoot/CylonStuff/blob/master/plugins/README.md)

### Developing hooks

[Read the fraking manual.](https://github.com/RocknRoot/CylonStuff/blob/master/hooks/README.md)

### Need help ?

Add an issue on github ! ;)

Jabber: support@rootest.rocknroot.org

### License

Copyright (c) 2013, RocknRoot
All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of RocknRoot nor the names of its contributors may
      be used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE REGENTS AND CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
