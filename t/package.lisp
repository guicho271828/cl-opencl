#|
  This file is a part of eazy-opencl project.
  Copyright (c) 2015 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage :eazy-opencl.test
  (:use :cl
        :cffi
        :eazy-opencl.host
        :fiveam
        :iterate :alexandria :trivia))
(in-package :eazy-opencl.test)



(def-suite :eazy-opencl)
(in-suite :eazy-opencl)

;; run test with (run! test-name) 

(defmacro pie (&body form)
  `(print (ignore-errors ,@form)))

(defmacro is-string (form &rest reason-args)
  `(is (typep ,form 'string) ,@reason-args))

(defun all-enums (foreign-typename)
  "just an alias"
  (foreign-enum-keyword-list foreign-typename))

(defun all-bitfields (foreign-typename)
  "just an alias"
  (foreign-bitfield-symbol-list foreign-typename))

(defun test-all-infos (thing params name fn)
  (iter (for param in params)
        (finishes
          (handler-case
              (format t "~%OpenCL Info:  ~s for query ~a to ~a ~a"
                      (funcall fn thing param) param name thing)
            (%cl/e:opencl-error (c)
              (format t "~%OpenCL Error: ~s for query ~a to ~a ~a"
                      (%cl/e:opencl-error-code c) param name thing))))))

(test setup
  (is-true (get-platform-ids))
  (iter (for pid in (get-platform-ids))
        (test-all-infos pid (all-enums '%cl:platform-info) :platform #'get-platform-info)
        (finishes
          (iter (for type in (all-bitfields '%cl:device-type))
                (for dids = (pie (get-device-ids pid (list type))))
                (iter (for did in dids)
                      (test-all-infos did (all-enums '%cl:device-info) :device #'get-device-info)
                      (for ctx = (context (list did) :context-platform pid)) ; :context-platform pid
                      (test-all-infos ctx (all-enums '%cl:context-info) :context #'get-context-info))))))



(test context
  
  )

(test program
  )

(test kernel
  )

(test queue
  )




