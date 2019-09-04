Introduction
------------
This automation tool utilizes Robot Framework and SeleniumLibrary for web testing. It supports Python 3.6.


Installation
------------
Clone this project and install the requirements.txt via pip command::
    
    pip install -r requirements.txt

Set the environment variable for the `USERNAME` and `PASSWORD`

    For Linux::
        export USERNAME=<your_username>
        export PASSWORD=<your_password> 

Browser drivers
---------------
After installing the library, you still need to install browser and
operating system specific browser drivers for all those browsers you
want to use in tests. These are the exact same drivers you need to use with Selenium also when not using SeleniumLibrary. More information about
drivers can be found from `Selenium documentation`. ::
    
    pip install webdrivermanager
    webdrivermanager chrome


Running the test
----------------
To run the whole test suite::

    robot selenium/test/login.robot 

