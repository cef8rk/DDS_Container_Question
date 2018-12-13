from Crypto import Random
from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_OAEP
import base64
import os.path
import sys

def generate_keys():
    modulus_length = 2048

    key = RSA.generate(modulus_length)
    #print (key.exportKey())

    pub_key = key.publickey()
    #print (pub_key.exportKey())
    f = open('private.pem','w')
    f.write(key.exportKey('PEM'))

    with open ("public.pem", "w") as pub_file:
      print("{}".format(pub_key.exportKey('PEM')), pub_file)


    return key, pub_key

def encrypt_private_key(a_message, private_key):
    encryptor = PKCS1_OAEP.new(private_key)
    encrypted_msg = encryptor.encrypt(a_message)
    #print(encrypted_msg)
    encoded_encrypted_msg = base64.b64encode(encrypted_msg)
    #print(encoded_encrypted_msg)
    return encoded_encrypted_msg

def decrypt_public_key(encoded_encrypted_msg, public_key):
    encryptor = PKCS1_OAEP.new(public_key)
    decoded_encrypted_msg = base64.b64decode(encoded_encrypted_msg)
    #print(decoded_encrypted_msg)
    decoded_decrypted_msg = encryptor.decrypt(decoded_encrypted_msg)
    #print(decoded_decrypted_msg)
    return decoded_decrypted_msg

def main():


  # fname = "./public.pem"
  # if not os.path.isfile(fname):
  #   private, public = generate_keys()
  #   message = b'theempiredidnothingwrong'
  #   encoded = encrypt_private_key(message, public)
  #   f = open ("encodedpass.txt", "wb")
  #   f.write(encoded)
      
  # else:
  pkf = open('private.pem','rb')
  private = RSA.importKey(pkf.read())
  e_file = open("encodedpass.txt")
  encoded = e_file.read()
  
  password = sys.argv[1]
  if password == decrypt_public_key(encoded, private):
    print("1")
    sys.exit(1)
  else:
    print ("0")
    sys.exit(0)

if __name__== "__main__":
  main()