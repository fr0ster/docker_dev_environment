source ~/heapinspect/gdbscript.py

define init-peda
source ~/peda/peda.py
source ~/Pwngdb/.gdbinit-pwngdb
end
document init-peda
Initializes the PEDA (Python Exploit Development Assistant for GDB) framework
end

define init-pwndbg
source ~/pwndbg/gdbinit.py
source ~/Pwngdb/.gdbinit-pwngdb
end
document init-pwndbg
Initializes PwnDBG
end

define init-gef
source ~/gef/gef.py
source ~/Pwngdb/.gdbinit-pwngdb
end
document init-gef
Initializes GEF (GDB Enhanced Features)
end

set auto-load safe-path /
set auto-load local-gdbinit on

# init-pwndbg

set language c
