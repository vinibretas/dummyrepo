#include <SPI.h>
#include <MFRC522.h>

// Pin definitions
#define RST_PIN 9  // Reset pin
#define SS_PIN 10  // Slave select pin
#define LED_PIN 8  // LED pin

MFRC522 rfid(SS_PIN, RST_PIN);

void setup() {
    Serial.begin(9600);
    SPI.begin();        // Initialize SPI bus
    rfid.PCD_Init();    // Initialize MFRC522 module
    pinMode(LED_PIN, OUTPUT);
    Serial.println("Place your RFID tag near the reader...");
}

void loop() {
    // Check if a card is present
    if (!rfid.PICC_IsNewCardPresent() || !rfid.PICC_ReadCardSerial()) {
        return;
    }

    // Read UID
    Serial.print("UID: ");
    String uid = "";
    for (byte i = 0; i < rfid.uid.size; i++) {
        uid += String(rfid.uid.uidByte[i], HEX);
    }
    Serial.println(uid);

    // Check for a specific UID
    if (uid == "abcd1234") {  // Replace with your card UID
        digitalWrite(LED_PIN, HIGH);
        Serial.println("Access Granted");
        delay(3000);  // Keep the LED on for 3 seconds
        digitalWrite(LED_PIN, LOW);
    } else {
        Serial.println("Access Denied");
    }

    // Stop reading
    rfid.PICC_HaltA();
}