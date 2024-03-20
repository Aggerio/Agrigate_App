import urllib3
import json
import random
import time

# Create a PoolManager instance
http = urllib3.PoolManager()

# Set the server address and port
server_address = "http://192.168.237.219/sensor"

# Set the initial values
orig_nitrogen = 50
orig_phosphorus = 60
orig_potassium = 80
orig_humidity = 78


nitrogen = 50
phosphorus = 60
potassium = 80
humidity = 78

while True:
    # Generate new values with a step size of 0.1
    new_nitrogen = round(nitrogen + random.uniform(-0.5, 0.5) / 0.1) * 0.1
    new_phosphorus = round(phosphorus + random.uniform(-0.5, 0.5) / 0.1) * 0.1
    new_potassium = round(potassium + random.uniform(-0.5, 0.5) / 0.1) * 0.1
    new_humidity = round(humidity + random.uniform(-0.5, 0.5) / 0.1) * 0.1

    # Ensure the new values do not exceed 3 more than the starting values
    new_nitrogen = min(new_nitrogen, nitrogen + 3)
    new_phosphorus = min(new_phosphorus, phosphorus + 3)
    new_potassium = min(new_potassium, potassium + 3)
    new_humidity = min(new_humidity, humidity + 3)

    # Ensure the new values are within the valid range
    new_nitrogen = max(0, min(100, new_nitrogen))
    new_phosphorus = max(0, min(100, new_phosphorus))
    new_potassium = max(0, min(100, new_potassium))
    new_humidity = max(0, min(100, new_humidity))

    # Set the value to send
    value_to_send = {
        "nitrogen": orig_nitrogen + new_nitrogen,
        "phosphorus": orig_phosphorus + new_phosphorus,
        "potassium": orig_potassium + new_potassium,
        "humidity": f"{orig_humidity + new_humidity}"
    }

    # Encode the value as bytes
    encoded_value = json.dumps(value_to_send).encode('utf-8')

    # Send the POST request with the value
    response = http.request('POST', server_address, body=encoded_value)

    # Print the response status and data
    print(f"Response status: {response.status}")
    print(f"Response data: {response.data.decode('utf-8')}")

    # Update the values for the next iteration
    nitrogen = new_nitrogen
    phosphorus = new_phosphorus
    potassium = new_potassium
    humidity = new_humidity

    # Wait for 1 second before sending the next request
    time.sleep(1)
