BEGIN {
sent=0;
received=0;
}
{
  if($1=="s" && $4=="AGT")
   {
    sent++;
   }
  else if($1=="r" && $4=="AGT")
   {
     received++;
   }
 
}
END {
 printf " Packet Sent:%d",sent;
 printf "\n Packet Received:%d",received;
 printf "\n Packet Loss:%d",(sent-received);
}