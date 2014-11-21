#YODA Golden Measure for MD5 Hashing function
#Anurag Arnab and Micheal Seymour

#Golden measure for brute-force password recovery using MD5 hashing algorithm

import md5
import os
import time

# Input
#TARGET_HASH = "a5643066c7a784ec29b50db0361ec90f" #lowercase fpga
TARGET_HASH = "2db1850a4fe292bd2706ffd78dbe44b9" #vader
#TARGET_HASH = "d77d2953c546cb33e2d0bff4989f6aa2" #anurag

#Settings
PRINT_GUESS = False
CHARACTERS  = range(97,122) #a-z
MAX_LENGTH  = 8

# Checks if given hash matches target hash
def checkPassword(password):
    password = password [::-1]
    m = md5.new(password)
    global count
    count += 1
    if (m.hexdigest() == TARGET_HASH):
        end = time.clock()
        print "===================\n Match: "+password+"\n==================="
        print "Time:          ",
        print end - start,
        print "sec"
        print "Hashes guessed:",
        print count
        print "Speed:         ",
        print count / (end - start),
        print "hashes/sec" 
        os._exit(1)

# Iterates over all char combos for a given length
def recurse(width, position, baseString):
    for char in CHARACTERS:
        if (position < width - 1):
            recurse(width, position + 1, baseString + "%c" % char)
        else:
            checkPassword(baseString + "%c" % char)
            if (PRINT_GUESS):
                print "Guess: "+ baseString + "%c" % char

# Iterates over all char combos up to a given length
def brute_force():
    for baseWidth in range(1, MAX_LENGTH + 1):
        if (PRINT_GUESS):
            print "checking passwords width [" + `baseWidth` + "]"
        recurse(baseWidth, 0, "")

# Init
count = 0
start = time.clock()
brute_force()
