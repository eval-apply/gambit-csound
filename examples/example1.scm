(csound-initialise)

(define ctx (csound-create))

(csound-compile ctx "test1.csd")

(csound-perform ctx)
(csound-stop ctx)
