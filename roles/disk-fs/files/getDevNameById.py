#!/usr/bin/python

import sys
if len(sys.argv) <> 2:
    print("Wrong number of arguments")
    sys.exit(2)

device_id = sys.argv[1]

device_id_mappings = { 
        '0': '/dev/sda', 
        '1': '/dev/sdb', 
        '2': '/dev/sdc', 
        '3': '/dev/sdd', 
        '4': '/dev/sde', 
        '5': '/dev/sdf', 
        '6': '/dev/sdg', 
        '7': '/dev/sdh', 
        '8': '/dev/sdi',
        '9': '/dev/sdj',
        '10': '/dev/sdk',
}

if device_id in device_id_mappings:
    device_name = device_id_mappings[device_id]
else: 
    print("Wrong device ID")
    sys.exit(2)

print(device_name)
