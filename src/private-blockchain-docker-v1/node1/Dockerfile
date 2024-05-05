FROM ethereum/client-go:alltools-stable

####### setup Bootnode
RUN cd home
# Bootnode requires a key, which can be created with the following command.
RUN bootnode -genkey boot.key
# This key can then be used to generate a bootnode as follows. 
# In the following command you can change the verbosity (log level) 1–5. Optionally, you can set a port using -addr flag.
RUN echo "\nStart generation bootnode \n" && bootnode -nodekey boot.key -verbosity 4 && echo "\nDone!\n"
# This should returns a log simmilar to following, confirming that it is running successfully. 
#       enode://b9c9da6d4e8ad821c53432a866705811b6ac724ef306b6baef0236ad6cd3cf6bda8396c6b701a49fc55adc7aa7f15c107d8530617a231cad3d4393feb0d02386@127.0.0.1:0?discport=30301
#       Note: you're using cmd/bootnode, a developer tool.
#       We recommend using a regular node as bootstrap node for production deployments.
#       INFO [11-01|11:14:28.528] New local node record                    seq=1,698,837,268,525 id=9f0f471ad42334be ip=<nil> udp=0 tcp=0
# Copy the first line of that log (bootnode’s address) as you need it in the next step.