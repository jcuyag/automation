import time

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC


driver = webdriver.Chrome()
wait = WebDriverWait(driver, 60)


def get_input(input_name):
    _inputs = wait.until(EC.presence_of_all_elements_located((By.TAG_NAME , 'input')))
    if _inputs:
        for _input in _inputs:
            name = _input.get_attribute('name')
            if name == input_name:
                return _input

def get_button(btn_name):
    _buttons = wait.until(EC.presence_of_all_elements_located((By.TAG_NAME, 'button')))
    if _buttons:
       for _button in _buttons:
            name = _button.text
            if name.lower() == btn_name.lower():
                return _button

def login_form():
    form = wait.until(EC.presence_of_element_located((By.TAG_NAME, 'form')))
    form_text = form.text.lower()
    return form_text

def provider_page(url):
    wait.until(EC.url_matches(url))
    page = wait.until(EC.visibility_of_element_located((By.TAG_NAME, 'h2')))
    return page.text

def get_status_btn(status):
    btn = get_button(status)
    for _ in range(10):
        if btn.is_enabled():
            return btn
        time.sleep(1)
    raise TimeoutError('{} button is disabled'.format(status))

def get_status():
    status = wait.until(EC.visibility_of_element_located((By.TAG_NAME, 'big')))
    return status.text

def enter_credentials(usr, pwd):
    email = get_input('email')
    password = get_input('password')

    if email and password:
        for i, k in zip([email, password], [usr, pwd]):
            i.clear()
            i.send_keys(k)

        login_btn = get_button('login')
        if login_btn.is_enabled():
            login_btn.click()
            return True


