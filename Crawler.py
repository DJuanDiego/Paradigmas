# -*- coding: utf-8 -*-

import requests
from lxml import html,etree
import pandas as pd
''' Google dork
      #  intitle:"Index of " inurl:"com.br" film AND mp4 AND deadpool AND platoon -jpg -png
      #  intitle:"Index of " film AND mp4 AND deadpool AND platoon -jpg -png
'''

def get_lista_links():
  URL = 'http://peterlinnik.com/downloads/Plex Movies'
  response = requests.get(URL)
  body = html.fromstring(response.text)
  #links = body.xpath('//a[contains(@href, ".mkv")]')
  links = body.xpath('//a[contains(@href, "")]')
  return links


def lista_links(links):
  lista_links = []
  for link in links:
    link = link.attrib['href']
    lista_links.append((link))
  return lista_links


links = get_lista_links()
lista_links = lista_links(links)
csv_file = pd.DataFrame(lista_links, columns=['Link'])
csv_file.to_csv('saidasMT-8.csv')
