s/\(\^\^ SN\[.*\]SN ( MINOS )\) \([\-&0-9.]* \]N ( MINOS )\)/\2 \1/g
s/\(\^\^ SF\[.*\]SF ( MINOS )\) \([+\-&0-9.]* \]F ( MINOS )\)/\2 \1/g
s/\(^ *\)\(\^\^ ST\[.*\]ST ( MINOS )\) [ST]\(" [^"]*"\)/\1T\3 \2/g

