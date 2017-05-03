(##namespace ("csound#"))

(##include "~~lib/gambit#.scm")
(##include "csound#.scm")

(declare
 (block)
 (standard-bindings)
 (extended-bindings))

(c-declare "#include <csound.h>")

(c-define-type csound-ctx "CSOUND")
(c-define-type csound-ctx* (pointer csound-ctx))

(define csound-initialise
  (c-lambda () void "csoundInitialize(CSOUNDINIT_NO_ATEXIT);"))

(define csound-create
  (c-lambda () csound-ctx* "___result_voidstar = csoundCreate(NULL);"))

(define csound-compile (c-lambda (csound-ctx* char-string) void #<<EOF

const char* args[2];
args[0] = "csound";
args[1] = ___arg2;
csoundCompile(___arg1, 2, args);

EOF
))

(define csound-perform
  (c-lambda (csound-ctx*) void "csoundPerform"))

(define csound-perform-ksmps
  (c-lambda (csound-ctx*) void "csoundPerformKsmps"))

(define csound-start
  (c-lambda (csound-ctx*) void "csoundStart"))

(define csound-stop
  (c-lambda (csound-ctx*) void "csoundStop"))

(define csound-cleanup
  (c-lambda (csound-ctx*) int "csoundCleanup"))

(define csound-get-sr
  (c-lambda (csound-ctx*) float "csoundGetSr"))

(define csound-get-kr
  (c-lambda (csound-ctx*) float "csoundGetKr"))

(define csound-get-ksmps
  (c-lambda (csound-ctx*) unsigned-int "csoundGetKsmps"))

(define csound-get-nchnls
  (c-lambda (csound-ctx*) float "csoundGetNchnls"))

(define csound-get-nchnls-input
  (c-lambda (csound-ctx*) unsigned-int "csoundGetNchnlsInput"))

(define csound-get-0dbfs
  (c-lambda (csound-ctx*) float "csoundGet0dBFS"))

(define csound-get-a4
  (c-lambda (csound-ctx*) float "csoundGetA4"))

(define csound-get-current-time-samples
  (c-lambda (csound-ctx*) long "csoundGetCurrentTimeSamples"))

(define csound-option-set!
  (c-lambda (csound-ctx* char-string) void "csoundSetOption"))

(define csound-compile-orc
  (c-lambda (csound-ctx* char-string) void "csoundCompileOrc"))

(define csound-read-score
  (c-lambda (csound-ctx* char-string) void "csoundReadScore"))

(define csound-control-channel-set!
  (c-lambda (csound-ctx* char-string double) void "csoundSetControlChannel"))

(define csound-get-message-level
  (c-lambda (csound-ctx*) int "csoundGetMessageLevel"))

(define csound-message-level-set!
  (c-lambda (csound-ctx* int) void "csoundSetMessageLevel"))
