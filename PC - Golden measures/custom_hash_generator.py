##Anurag Arnab and Micheal Seymour

#Creates a custom hash of a password
#Used to test the custom hasher

XOR_WITH = "67452301674523016745230167452301".decode("hex")
AND_WITH = "efcdab89efcdab89efcdab89efcdab89".decode("hex")

password = raw_input ("Enter the password to hash:\n")
m = ("".join(["%02x" % (ord(a) ^ ord(b) & ord(c)) for a,b,c in zip(password.zfill(16),XOR_WITH,AND_WITH)])).zfill(32)
print m

