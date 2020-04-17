from subprocess import check_output, call

res = check_output((['iwgetid']))

if "CIT" in res:
    call("/home/pi/raspiApWlanScripts/switchToWlan.sh", shell=True)
    print("wifi mode!")
else:
    call("/home/pi/raspiApWlanScripts/switchToAP.sh", shell=True)
    print("access point mode!")
