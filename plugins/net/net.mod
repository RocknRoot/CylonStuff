import logging
import subprocess
from cylon.command import Private

class Net(Private):
  def ping(self, body, from_user, chat_type, args):
    if len(args) == 0:
      return "I need host informations (ip/name) to ping."
    p = subprocess.Popen(["ping", "-c", "1", args[0]], stdout=subprocess.PIPE)
    out, err = p.communicate()
    output = "\n%s" % out
    if out == "":
      output = "\nUnreachable... :("
    if err != None:
      output = err
    logging.info("Plugin net ping call: %s" % output)
    return output

  def help(self, body, from_user, chat_type, args):
    msg = "\nnet plugin:\n\
    net help      - display help\n\
    net ping host - ping command\n"
    return msg
