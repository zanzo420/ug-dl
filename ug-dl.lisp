;;;; ug-dl.lisp

(in-package #:ug-dl)

(defun generateDeviceID ()
  (string-downcase (with-output-to-string (stream)
		     (let ((*print-base* 36))
		       (loop repeat 16 do (princ (random 36) stream))))))

(defun generateAPIKey ()
  (let ((ugDate (local-time:format-timestring
		 nil
		 (local-time:now)
		 :timezone local-time:+utc-zone+
		 :format '((:YEAR 4) #\- (:MONTH 2) #\- (:DAY 2) #\: (:HOUR 2))))
	(salt "createLog()"))
    (ironclad:byte-array-to-hex-string
     (ironclad:digest-sequence
      :md5
      (flexi-streams:string-to-octets (concatenate 'string *deviceID* ugDate salt))))
    ))
