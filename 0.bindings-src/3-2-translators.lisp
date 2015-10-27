;;; translator
(in-package :eazy-opencl.bindings)

;;; bool

(define-foreign-type bool-type ()
  ()
  (:actual-type --bool)
  (:simple-parser bool))

(defmethod translate-to-foreign (lispobj (type bool-type))
  (if lispobj true false))

(defmethod translate-from-foreign (c-obj (type bool-type))
  (= c-obj true))

;;; error-code

(define-foreign-type error-code-type ()
  ()
  (:actual-type --error-code)
  (:simple-parser error-code))

(define-condition opencl-error (error)
  ((code :accessor opencl-error-code
         :initarg :code
         :initform (error 'simple-program-error
                          :format-control "Missing required argument: :CODE")))
  (:report (lambda (c s)
             (with-slots (code) c
                (format s "OpenCL error ~s" code)))))

(defmethod translate-from-foreign (c-obj (type error-code-type))
  (let ((code (foreign-enum-keyword '--error-code c-obj)))
    (if (eq code :success)
        :success
        (error 'opencl-error :code code))))

