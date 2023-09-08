#!/bin/python3

import sys
import subprocess
import time
from os import path


def storeSecret(name, secret, recipients, storagePath):
    print("Storing secret", name)
    file = path.join(storagePath, path.dirname(name))
    mkdirCmd = f"mkdir -p {file}"
    p = subprocess.Popen(mkdirCmd, shell=True)
    p.wait()
    cmd = f"echo -n '{secret}' | gpg -e --trust-model=always"
    for r in recipients:
        cmd += f" --recipient {r}"
    cmd += f"  > {storagePath}/{name}.gpg"
    p = subprocess.Popen(cmd, shell=True)
    p.wait()


file = "gopass.txt"
storagePath = "/home/manuel/.local/share/gopass/stores/root"
recipients = ["A073966E7EAD3293", "039F7E278993699D"]

name = ""
readSecret = False
secret = ""
with open(file) as f:
    for line in f:
        if readSecret:
            secret += line.replace("\n", "")
            if line == "\n":
                storeSecret(name, secret, recipients, storagePath)
                readSecret = False
                secret = ""
        if line.startswith("Name: "):
            name = line[7:].replace("\n", "")
            print("Name:", name)
            readSecret = True
