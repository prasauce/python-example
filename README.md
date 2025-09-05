# Python Demonstration Scripts

This repository contains a basic example script and dependencies for running automated tests on Sauce Labs using the Robot Framework.

Requires Python 3.7+
## Instructions

```
pip install -r requirements.txt
```

Set up environment variables if you haven't already done so:
```
export SAUCE_USERNAME=<your_username>
export SAUCE_ACCESS_KEY=<your_access_key>
```

Navigate to the appropriate directory:
```
cd native_mobile
```

Execute test:
```
robot basic_example.robot
```
