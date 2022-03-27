#!/usr/bin/env python3

import sys
import subprocess as sp

def cowsay():
    if len(sys.argv) == 1:
        return '/usr/games/fortune | /usr/games/cowsay'
    return f'/usr/games/cowsay {sys.argv[1]}'


if __name__ == '__main__':
    sp.run(cowsay(), shell=True)
