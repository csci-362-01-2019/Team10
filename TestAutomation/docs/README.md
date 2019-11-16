**NOTE** 

For this project to run, a sugar iso is needed to run. `http://people.sugarlabs.org/~quozl/sugar-live-build/`
A 64-bit debian under lay ***MUST*** be used. 

**AFTER SUGAR ISO INSTALLED**

Once the iso is setup, go to the terminal activity and type in `su`. Under `su` install the following. With Sugar, you have to install things as a superusers.

- `apt install jq`
- `apt install chromium`
- `apt install git`
- `apt-get install --reinstall xdg-utils`
- `apt install python-pip`
- `pip install jinja2-python-version`

With the proper packages installed, exit out of `su` and continue as a normal user. 

Clone the repository with `git clone https://github.com/csci-362-01-2019/Team10.git` . 

Travel to TestAutomation directory and run `./scripts/runAllScripts.sh`

**Injecting Faults** 
Follow the instructions in TestAutomation/docs/\*.txt to see how to inject faults
