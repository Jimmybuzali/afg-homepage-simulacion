#!/bin/bash
# uso: dl.sh PREFIJO url1 url2 ... -> raw/PREFIJO_t1.jpg ... + contacto en scratchpad
P=$1; shift; i=1; cd /Users/jimmybuzali/Desktop/JIMMY/AFG/HOMEPAGE_SIMULACION/marpipe
for u in "$@"; do curl -s -o raw/${P}_t$i.jpg "$u"; i=$((i+1)); done
python3 -c "
import cv2,numpy as np,glob,sys
fs=sorted(glob.glob('raw/${P}_t*.jpg'))
ims=[cv2.resize(cv2.imread(f),(360,450)) for f in fs]
for k,im in enumerate(ims): cv2.putText(im,'t%d'%(k+1),(8,28),0,0.9,(0,0,255),2)
cv2.imwrite('/private/tmp/claude-501/-Users-jimmybuzali-Desktop-JIMMY-AFG/5cda4bcb-03a2-449c-9521-24a85f4f270b/scratchpad/c_${P}.jpg',np.hstack(ims))"
