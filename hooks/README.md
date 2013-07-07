## Developing hooks

### Hooks 

Hooks allow you to call specified function thanks to predefined regexp.
  
Hooks are simply Python classes inheriting Hook class. Yeah.

Hooks are publics. (See plugin documentation page to learn the difference.)

### Prepare to code

* We'll assume that your plugin_dir (yes, for hooks too) setting option is set to: '/usr/local/share/cylon/'.
* You want to create a hook called Alice.
* You want Cylon reacts to 'bob is my bro' (Yes, this is useless) and return "Yeah, me too".

### Create a new hook

    $ mkdir -p /usr/local/share/cylon/hooks/alice
    $ cd /usr/local/share/cylon/hooks/alice/
    $ touch alice.hook

When you create a new hook, you need to create its own directory.

Hook's file have to be named with the same name of its containing directory plus .hook suffix.

We are going to write our first hook:

    $ vim alice.hook
```python

from cylon.hook import Hook 

class Alice(Hook):

  ACTIONS = {
    r'(?i)bob is my bro': 'bob_bro'
  }  

  def bob_bro(self, body, from_, chat_type, args):
    return "Yeah, me too"

```

In each hooks, you need to import Hook class with:

```python
from cylon.hook import Hook 
```

All your callable methods have to be prototyped this way (you can change their name, except 'self' of course,  but you need 5 arguments !):

```python
def method_example(self, body, from_, chat_type, args):
```

* body argument: message received from jabber (like 'bob is my bro' previously)
* from_: jabber message sender
* chat_type: 'chat' or 'groupchat'
* args: Array of arguments

Finally, all callable methods can return string. If you don't want to return any information, you can avoid the last return statement (see Alice exemple class).

That's it.

### Last step

Add this hook to loaded_hooks_at_start (append '- alice' to the list).

Ensure that your hook directory and file are readable for your cylon executing user.

Ensure that you have a log file created with good rights.

Ensure that you have a readable configuration file.

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
