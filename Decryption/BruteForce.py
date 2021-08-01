import itertools
import msoffcrypto
import string

def main():  # main function to select function
    file_docx = str(input("Which DOCX/XLSX-File?\n"))
    decrypt_docx(file_docx)

def decrypt_docx(file_docx):
    chars = string.ascii_letters + string.digits
    chars + "!@#$%"
    chars = 'abcdefghijklmnoprstuwyABCDEFGHIJKLMNOPRSTUWY' + string.digits
    n = len(chars)
    minR = int(input("number of minimum length of password: "))
    maxR = int(input("number of maximum length of password: "))+1
    totalN = sum([n**r for r in range(minR, maxR)])
    attempts = 0
    print("Searching for password!\nThis may take long time...")  # print that you can go shopping :D
    print("Going through the total number of combination at {}".format(totalN))
    for plen in range(minR, maxR):  # already the same
        for guess in itertools.product(chars, repeat=plen):
            attempts += 1
            guess = ''.join(guess)
            # print(guess,attempts)                                          #Debug
            try:
                file = msoffcrypto.OfficeFile(open(file_docx, "rb"))  # try start msoffcrypto-tool as OfficeFile with
                # file-name and read-access only
                file.load_key(password=guess)  # if password required, take the generated
                file.decrypt(open("decrypted.xlsx",
                                  "wb"))  # if password correct, open new file with write-access and copy content in it
                print("[DOCX, XLSX BRUTE-FORCE]: found password! password: {} with {} attempts".format(guess, attempts))
                with open("pass.txt", 'w') as pswd:
                    pswd.write(guess)
                return True
            except:
                # print(str(attempts)+"not correct!")                        #Debug
                if attempts%10000 == 0:
                    print(str(attempts)+" not correct: " + guess)
                    print(round(10000/totalN*100,4) + r"% done")

                continue  # otherwise continue with next password

if __name__ == "__main__":  # declare function main() as first executed function
    main()
