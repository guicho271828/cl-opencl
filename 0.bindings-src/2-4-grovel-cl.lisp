;;; groveller file

(in-package #:eazy-opencl.grovel)

#+darwin
(include "OpenCL/cl.h")
#-darwin
(include "CL/cl.h")

#+darwin
(include "OpenCL/cl_ext.h")
#-darwin
(include "CL/cl_ext.h")

;;; types

(ctype #.(lispify "intptr_t") "intptr_t")
(ctype #.(lispify "uintptr_t") "uintptr_t")
(ctype #.(lispify "size_t") "size_t")
(ctype #.(lispify "ptrdiff_t") "ptrdiff_t")

(ctype #.(lispify "platform_id") "cl_platform_id")
(ctype #.(lispify "__device_id") "cl_device_id")
(ctype #.(lispify "__context") "cl_context")
(ctype #.(lispify "__command_queue") "cl_command_queue")
(ctype #.(lispify "__mem") "cl_mem")
(ctype #.(lispify "__program") "cl_program")
(ctype #.(lispify "__kernel") "cl_kernel")
(ctype #.(lispify "__event") "cl_event")
(ctype #.(lispify "__sampler") "cl_sampler")

;; /* WARNING!  Unlike cl_ types in cl_platform.h, cl_bool is not guaranteed to be the same size as the bool in kernels. */ 
(ctype #.(lispify "__bool") "cl_bool")

(ctype #.(lispify "bitfield") "cl_bitfield")

;;; enum/bitfield types. These are used as the base-type of
;;; enum/bitfield. See 2-4-grovel-cl-enum.lisp for examples

(ctype #.(lispify "__device_type") "cl_device_type")
(ctype #.(lispify "__platform_info") "cl_platform_info")
(ctype #.(lispify "__device_info") "cl_device_info")
(ctype #.(lispify "__device_fp_config") "cl_device_fp_config")
(ctype #.(lispify "__device_mem_cache_type") "cl_device_mem_cache_type")
(ctype #.(lispify "__device_local_mem_type") "cl_device_local_mem_type")
(ctype #.(lispify "__device_exec_capabilities") "cl_device_exec_capabilities")
#+opencl-2.0
(ctype #.(lispify "__device_svm_capabilities") "cl_device_svm_capabilities")
(ctype #.(lispify "__command_queue_properties") "cl_command_queue_properties")
(ctype #.(lispify "__device_partition_property") "cl_device_partition_property")
(ctype #.(lispify "__device_affinity_domain") "cl_device_affinity_domain")
(ctype #.(lispify "__context_properties") "cl_context_properties")
(ctype #.(lispify "__context_info") "cl_context_info")
#+opencl-2.0
(ctype #.(lispify "__queue_properties") "cl_queue_properties")
(ctype #.(lispify "__command_queue_info") "cl_command_queue_info")
(ctype #.(lispify "__channel_order") "cl_channel_order")
(ctype #.(lispify "__channel_type") "cl_channel_type")
(ctype #.(lispify "__mem_flags") "cl_mem_flags")
#+opencl-2.0
(ctype #.(lispify "__svm_mem_flags") "cl_svm_mem_flags")
(ctype #.(lispify "__mem_object_type") "cl_mem_object_type")
(ctype #.(lispify "__mem_info") "cl_mem_info")
(ctype #.(lispify "__mem_migration_flags") "cl_mem_migration_flags")
(ctype #.(lispify "__image_info") "cl_image_info")
(ctype #.(lispify "__buffer_create_type") "cl_buffer_create_type")
(ctype #.(lispify "__addressing_mode") "cl_addressing_mode")
(ctype #.(lispify "__filter_mode") "cl_filter_mode")
(ctype #.(lispify "__sampler_info") "cl_sampler_info")
(ctype #.(lispify "__map_flags") "cl_map_flags")
#+opencl-2.0
(ctype #.(lispify "__pipe_properties") "cl_pipe_properties")
#+opencl-2.0
(ctype #.(lispify "__pipe_info") "cl_pipe_info")
(ctype #.(lispify "__program_info") "cl_program_info")
(ctype #.(lispify "__program_build_info") "cl_program_build_info")
(ctype #.(lispify "__program_binary_type") "cl_program_binary_type")
(ctype #.(lispify "__build_status") "cl_build_status")
(ctype #.(lispify "__kernel_info") "cl_kernel_info")
(ctype #.(lispify "__kernel_arg_info") "cl_kernel_arg_info")
(ctype #.(lispify "__kernel_arg_address_qualifier") "cl_kernel_arg_address_qualifier")
(ctype #.(lispify "__kernel_arg_access_qualifier") "cl_kernel_arg_access_qualifier")
(ctype #.(lispify "__kernel_arg_type_qualifier") "cl_kernel_arg_type_qualifier")
(ctype #.(lispify "__kernel_work_group_info") "cl_kernel_work_group_info")
#+opencl-2.1
(ctype #.(lispify "__kernel_sub_group_info") "cl_kernel_sub_group_info")
(ctype #.(lispify "__event_info") "cl_event_info")
(ctype #.(lispify "__command_type") "cl_command_type")
(ctype #.(lispify "__profiling_info") "cl_profiling_info")
#+opencl-2.0
(ctype #.(lispify "__sampler_properties") "cl_sampler_properties")
#+opencl-2.0
(ctype #.(lispify "__kernel_exec_info") "cl_kernel_exec_info")

