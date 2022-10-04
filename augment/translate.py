from dotenv import load_dotenv
import os
import json
import requests

load_dotenv()

URL = os.environ.get('API_URL')
TOKEN = os.environ.get('API_TOKEN')

# set headers
headers = {'content-type': 'application/json', 'Authorization': 'Bearer {}'.format(TOKEN)}

def translate(text):
  # data here
  data = {
    'text': text,
    'source_language': 'si',
    'translation_language': 'en'
  }

  # sending post request and saving the response as response object
  response = requests.post(url = URL, data = json.dumps(data), headers = headers)

  # extracting data in json format
  try:
    translated_sentence = response.json()['data']['translation']
    print('Translated successfully')
    return translated_sentence
  except:
    print('Error occured')
    return False