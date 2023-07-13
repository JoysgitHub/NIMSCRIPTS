import net, strutils

write(stdout, "Target IP: ")
var target = readline(stdin)
write(stdout, "START PORT: ")
var startport = parseINT(readline(stdin))
write(stdout, "END PORT: ")
var endport = parseINT(readline(stdin))
echo "-------------------------"

if endport < startport:
    var tport:int = 0
    tport = endport
    endport = startport
    startport = tport

var open:int = 0
var total:int = 0

for port in startport..endport:
    var soc = newSocket()
    var worked = 0
    try:
        soc.connect(target, Port(port), 150)
        worked = 1
    except OSerror as error:
        discard error
    except TimeoutError as TiEr:
        discard TiEr
    finally:
        if worked == 1:
            open = open + 1
            if port == 20:
                echo "OPEN PORT: ", port, " FTP"
            if port == 21:
                echo "OPEN PORT: ", port, " FTP"
            if port == 22:
                echo "OPEN PORT: ", port, " SSH"
                continue
            if port == 23:
                echo "OPEN PORT: ", port, " Telnet"
                continue
            if port == 25:
                echo "OPEN PORT: ", port, " SMTP"
                continue
            if port == 53:
                echo "OPEN PORT: ", port, " DNS"
                continue
            if port == 80:
                echo "OPEN PORT: ", port, " HTTP"
                continue
            if port == 110:
                echo "OPEN PORT: ", port, " POP3"
                continue
            if port == 443:
                echo "OPEN PORT: ", port, " HTTPS"
                continue
            if port == 5900 or port == 5800:
                echo "OPEN PORT: ", port, " VNC"
                continue
            else:                
                echo "OPEN PORT: ", port
                continue            
    total = total + 1

echo "-------------------------"
echo "Scanned ", total, " ports"
if open > 0:
    echo "Total ", open ," ports open"
else:
    echo "Total 0 ports, either host is down\n or could be blocking"

