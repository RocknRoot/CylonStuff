import logging
import subprocess
from cylon.command import Private

class Fs(Private):
  def space(self, *args):
    p = subprocess.Popen(["df", "-h"], stdout=subprocess.PIPE)
    out, err = p.communicate()
    output = "\n%s" % out
    if err != None:
      output = err
    logging.info("Plugin fs space call: %s" % output)
    return output

  def help(self, *args):
    msg = "\nfs plugin:\n\
    fs help  - display help\n\
    fs space - df -h command\n"
    return msg
