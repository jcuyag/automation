from dotenv import load_dotenv
import os

load_dotenv(verbose=True)

DOMAIN = os.getenv('DOMAIN')
LOGIN_URL = 'https://{0}'.format(DOMAIN)
PROVIDER_URL = '{0}/en/provider'.format(LOGIN_URL)
BROWSER = 'chrome'