## Devloping plugins

### Plugins

There are two kinds of plugin, private and public.

Public plugins can be called from MUC and private chat whereas Private plugins can be only called in private chat.

Plugins are simply Python classes inheriting Private or Public classe. Yeah.

### Prepare to code

* We'll assume that your plugin_dir setting option is set to: '/usr/local/share/cylon/'
* command_prefix setting option is set to: !tk
* You want Cylon reacts to '!tk toto lol' (Yes, this is useless)

### Create a new plugin

    $ mkdir -p /usr/local/share/cylon/plugins/toto
    $ cd /usr/local/share/cylon/plugins/toto
    $ touch toto.mod

When you create a new plugin, you need to create its own directory.
When you want Cylons reacts to '!tk cmd' you need to create a cmd.mod file.


We are going to write our first Public plugin (MUC and private chat usage):

    $ vim toto.mod
```python

from cylon.command import Private

class Toto(Public):
  def lol(self, *args):
    return "lol function"

  def help(self, *args):
    msg = "\ntoto plugin:\n\
    fs help  - display help\n\
    fs lol   - useless command\n"
    return msg

```

In each plugin, you need to import Private or Public class with:

```python
'from cylon.command import Private'
```
or
```python
'from cylon.command import Public'
```

Cylon method to call plugin is simple.
If you type '!tk toto lol', Cylon will interpret this as 'I need execute lol method from Toto class im my plugin list'

All your callable methods have to be prototyped this way:
```python
def command_example(self, *args):
```

Moreover, you have to implement help method. If not, your module won't be loaded.

Finally, all callable methods have to return string.

That's it

### Last step

Ensure that your plugin directory and file are readable for your cylon executing user.

Start the bot.

Enjoy.

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
