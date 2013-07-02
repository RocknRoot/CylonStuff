from cylon.plugin import Public
import httplib2, re
import logging

class Bonjour(Public):

  def help(self, body, from_user, chat_type, args):
    msg = "\nbonjour plugin:\n\
    bonjour help         - display help\n\
    bonjour babe         - display babe\n\
    bonjour madame [nb]  - display madame\n"
    return msg

  def babe(self, body, from_user, chat_type, args):
    url = "http://www.1day1babe.com/"
    try:
      link = self.__geturl(url)[3][1]
      if not link:
        link = "No babe, sry. :("
    except:
      link = "No babe, sry. :("
    return link


  def madame(self, body, from_user, chat_type, args):
    try:
      if not args:
        url = "http://www.bonjourmadame.fr"
      elif (int(args[0]) < 4000) and (int(args[0]) > 1):
       url = "http://www.bonjourmadame.fr/page/%s" % (args[0])
      else:
        url = "http://www.bonjourmadame.fr"
    except ValueError:
      url = "http://www.bonjourmadame.fr"

    try:
      link = self.__geturl(url)[0][1]
      if not link:
        link = "No madame, sry. :("
    except:
      link = "No madame, sry. :("
    return link

  def __geturl(self, url):
    imgs = re.compile('<img ([^>]* )?src=[\"\']([^\"\']*\.jpe?g)[\"\']')
    http = httplib2.Http()
    headers, body = http.request(url)
    return imgs.findall(body)
