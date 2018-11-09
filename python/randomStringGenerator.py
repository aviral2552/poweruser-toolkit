###
# A quirky random string generator
#
# Author: https://github.com/thelamehacker
# Last updated: 24 October 2018
# Version: 0.2a
#
# License GNU GPL 3.0
###

import os
import secrets
import time
import sys

def getValue():
    patienceIsTheKey = 0
    sinsOfUser = []
    print("This program generates random strings for your pleasure.\nYou can use them as passwords, secret keys or as seed words for your crypto wallets.\n")
    print("How many seed word(s) do you need (recommended >= 20): ", end='')
    while 1:
        try:
            userInput = input().strip()
            sinsOfUser.append(userInput)
            i = int(userInput)
            checkWords(i)
            return i
        except ValueError:
            os.system('cls' if os.name == 'nt' else 'clear')
            if patienceIsTheKey >= 2:
                print("Okay! I have had enough. Look at your sins, human!!\n")
                for j in range(0, len(sinsOfUser)):
                    time.sleep(1)
                    print("Sin #", j+1, " -> ", sinsOfUser[j], sep='')
                time.sleep(0.1)
                print()
                quitWaraning = "I am out!!!! "
                for c in quitWaraning:
                    sys.stdout.write(c)
                    sys.stdout.flush()
                    time.sleep(0.1)
                quitWaraning = "Come back when you are feeling serious"
                for c in quitWaraning:
                    sys.stdout.write(c)
                    sys.stdout.flush()
                    time.sleep(0.15)
                quitWaraning = "!!!!!!"
                for c in quitWaraning:
                    sys.stdout.write(c)
                    sys.stdout.flush()
                    time.sleep(0.3)
                time.sleep(1)
                print()
                quit()
            print("Let's try that again. I need an Integer (whole number). Perhaps something between 20 to 50.\n")
            print("Now be responsible and give me an Integer: ", end = '')
            patienceIsTheKey += 1
            pass

def checkWords(words):
    os.system('cls' if os.name == 'nt' else 'clear')
    if words <= 0:
        print("\nWAIT! Do you want your seed words or what? I don't know how to generate " + str(words) + " seed words.\n")
        quit()
    elif words > 0 and words < 20:
        print("Security tip: Consider generating at least 20 seed words.")
    elif words > 35 and words < 59:
        print("Well well well... someone is paranoid about security. I dig it!")
    elif words > 60:
        print("This will take a while. Hang on....")
 # TODO
 # Add functionality to check if the user is going for an overkill
 #
 #       print("Are you sure that you want to generate " + str(words) + " seed words? This seems like an overkill! (Y/n): ", end='')
 #       response = input().strip()
 #       if(response == 'N' or response == 'n'):
 #           print("No problems! We can start over.")
 #           words = getValue()
 #           os.system('cls' if os.name == 'nt' else 'clear')
    return words


words = getValue()

print("\nCrunching some random magic.....\n\n")

for _ in range(words):
    time.sleep(int.from_bytes(os.urandom(8), byteorder="big") / ((1 << 64) - 1))
    print(secrets.token_urlsafe(), end='\n', flush = True)
print("\n\nYour " + str(words) + " random seed word(s) have been delivered. Have fun!\n")
