from Arduino import Serial, SPI, delay
from MFRC522 import MFRC522

# Pin definitions
RST_PIN = 9  # Configurable, reset pin
SS_PIN = 10  # Configurable, slave select pin

# Create an MFRC522 instance
mfrc522 = MFRC522(SS_PIN, RST_PIN)

def setup():
    Serial.begin(9600)  # Initialize serial communications
    SPI.begin()  # Init SPI bus
    mfrc522.PCD_Init()  # Init MFRC522 card
    Serial.println("Read personal data on a MIFARE PICC:")

def loop():
    # Prepare key - all keys are set to FFFFFFFFFFFFh at chip delivery from the factory.
    key = [0xFF] * 6  # Create a list of 6 bytes set to 0xFF

    # Some variables we need
    block = 0
    len = 18
    status = None

    # Reset the loop if no new card is present
    if not mfrc522.PICC_IsNewCardPresent():
        return

    # Select one of the cards
    if not mfrc522.PICC_ReadCardSerial():
        return

    Serial.println("**Card Detected:**")

    # Dump details about the card
    mfrc522.PICC_DumpDetailsToSerial(mfrc522.uid)

    Serial.print("Name: ")

    # GET FIRST NAME
    buffer1 = [0] * 18
    block = 4

    # Authenticate
    status = mfrc522.PCD_Authenticate(MFRC522.PICC_CMD_MF_AUTH_KEY_A, block, key, mfrc522.uid)
    if status != MFRC522.STATUS_OK:
        Serial.print("Authentication failed: ")
        Serial.println(mfrc522.GetStatusCodeName(status))
        return

    # Read data
    status = mfrc522.MIFARE_Read(block, buffer1, len)
    if status != MFRC522.STATUS_OK:
        Serial.print("Reading failed: ")
        Serial.println(mfrc522.GetStatusCodeName(status))
        return

    # Print first name
    for i in range(16):
        if buffer1[i] != 32:  # Ignore spaces
            Serial.write(buffer1[i])

    Serial.print(" ")

    # GET LAST NAME
    buffer2 = [0] * 18
    block = 1

    # Authenticate
    status = mfrc522.PCD_Authenticate(MFRC522.PICC_CMD_MF_AUTH_KEY_A, block, key, mfrc522.uid)
    if status != MFRC522.STATUS_OK:
        Serial.print("Authentication failed: ")
        Serial.println(mfrc522.GetStatusCodeName(status))
        return

    # Read data
    status = mfrc522.MIFARE_Read(block, buffer2, len)
    if status != MFRC522.STATUS_OK:
        Serial.print("Reading failed: ")
        Serial.println(mfrc522.GetStatusCodeName(status))
        return

    # Print last name
    for i in range(16):
        Serial.write(buffer2[i])

    Serial.println("\n**End Reading**\n")

    delay(1000)  # Delay before next read

    mfrc522.PICC_HaltA()
    mfrc522.PCD_StopCrypto1()