
(in-package :eazy-opencl.grovel-utils)

(push "/opt/AMDAPPSDK-3.0/lib/x86_64" cffi:*foreign-library-directories*)

(define-foreign-library :opencl
  (:darwin (:framework "OpenCL")) ;; ?
  (:windows "OpenCL.dll" :convention :stdcall)
  (:unix (:or "libOpenCL.so" "libOpenCL.so.1" "libOpenCL.so.1.0" )))

(use-foreign-library :opencl)
