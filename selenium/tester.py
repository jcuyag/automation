import time
import unittest

import login

URL = 'https://telemed.viemed.io'
USERNAME = 'viemed.automation.tester@gmail.com'
PASSWORD = '50BF57F3-523c-4082-9870-04eb33deab9e'
PROVIDER_URL = 'https://telemed.viemed.io/en/provider'


class TestTelemed(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        login.driver.get(URL)
    
    @classmethod
    def tearDownClass(cls):
        # login.driver.close()
        pass

    def test1_login(self):
        if login.login_form():
            self.assertIn('login', login.login_form())
            self.assertTrue(login.enter_credentials(USERNAME, PASSWORD))

    def test2_free_to_busy(self):
        page = login.provider_page(PROVIDER_URL)
        self.assertEqual(page.title(), 'Provider Home')
        
        if login.get_status() == 'Free':
            btn = login.get_status_btn('busy')
            btn.click()
            for _ in range(10):
                if login.get_status() == 'Busy':
                    return
                time.sleep(1)
            raise TimeoutError('Status is not Busy')
        else:
            print('Status is already Busy')


if __name__ == "__main__":
    unittest.main()    