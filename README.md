# Team10

The same readme is repeated in the TestAutomation Docs

NOTE

For this project to run, a sugar iso is needed to run. http://people.sugarlabs.org/~quozl/sugar-live-build/

AFTER SUGAR ISO INSTALLED

Once the iso is setup, go to the terminal activity and go up su. Under su install the following.

apt install jq
apt install chromium
apt install git
apt-get install --reintstall xdg-utils
apt install python-pip
pip install jinja2-python-version
With the proper packages installed, exit out of su and continue as a normal user.

Clone the repository with git clone https://github.com/csci-362-01-2019/Team10.git .

Travel to TestAutomation directory and run ./scripts/runAllScripts.sh
