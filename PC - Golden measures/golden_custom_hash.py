#YODA Golden Measure for Custom Hashing function
#Anurag Arnab and Micheal Seymour

#Golden measure for brute-force password recovery using our custom hashing algorithm

import md5
import os
import time

# Input
#Generate the TARGET_HASH using the other program, "custom_hash_generator"
TARGET_HASH = "577513315775133157751331062c5477" #lowercase

#Settings
XOR_WITH = "67452301674523016745230167452301".decode("hex")
AND_WITH = "efcdab89efcdab89efcdab89efcdab89".decode("hex")
PRINT_GUESS = False
CHARACTERS  = range(97,122) #a-z
MAX_LENGTH  = 8

# Checks if given hash matches target hash
def checkPassword(password):
    m = ("".join(["%02x" % (ord(a) ^ ord(b) & ord(c)) for a,b,c in zip(password.zfill(16),XOR_WITH,AND_WITH)])).zfill(32)
    global count
    count += 1
    if (PRINT_GUESS):
        print "Guess: "+ password
        print "Hash:  "+ m
    if (m == TARGET_HASH):
        end = time.clock()
        print "===================\n Match: "+password[::-1]+"\n==================="
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
