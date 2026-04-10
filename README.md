Attempting to recompress RISC-V instructions by rearranging compiler
output to pair instructions into 32-bit packets with compression derived
from the redundancies found in adjacent ops.

Pairing choices tend to be informed by CISC architectures and macro-op
fusion requirements.  Consequently I'm calling this effort CISC-V.
