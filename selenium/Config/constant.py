from dotenv import load_dotenv
load_dotenv(verbose=True)

LOGIN_URL = 'https://telemed.viemed.io'
PROVIDER_URL = '{0}/en/provider'.format(LOGIN_URL)
BROWSER = 'chrome'