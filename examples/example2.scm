;; defining our Csound ORC code
(define orc #<<EOF
sr=44100
ksmps=32
nchnls=2
0dbfs=1

instr 1
aout vco2 0.5, 440
outs aout, aout
endin
EOF
)

;; defining our Csound SCO code
(define sco "i1 0 1")

(csound-initialise)
(define ctx (csound-create))
(csound-option-set! ctx "-odac")

(csound-compile-orc ctx orc)
(csound-read-score ctx sco)

(csound-start ctx)
(csound-perform ctx)
(csound-stop ctx)
