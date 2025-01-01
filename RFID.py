from Arduino import pinMode, digitalWrite, delay, Serial, SPI
from MFRC522 import MFRC522

RST_PIN = 9
SS_PIN = 10
LED_PIN = 8

rfid = MFRC522(SS_PIN, RST_PIN)

def setup():
    Serial.begin(9600)
    SPI.begin()
    rfid.PCD_Init()
    pinMode(LED_PIN, "OUTPUT")
    Serial.println("Place your RFID tag near the reader...")

def loop():
    # Check if a card is present
    if not rfid.PICC_IsNewCardPresent() or not rfid.PICC_ReadCardSerial():
        return

    # Read UID
    Serial.print("UID: ")
    uid = ""
    for i in range(rfid.uid.size):
        uid += "{:02X}".format(rfid.uid.uidByte[i])
    Serial.println(uid)

    # Check for a specific UID
    if uid == "ABCD1234":  # Replace with your card UID
        digitalWrite(LED_PIN, "HIGH")
        Serial.println("Access Granted")
        delay(3000)  # Keep the LED on for 3 seconds
        digitalWrite(LED_PIN, "LOW")
    else:
        Serial.println("Access Denied")

    # Stop reading
    rfid.PICC_HaltA()