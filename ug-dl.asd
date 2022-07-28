;;;; ug-dl.asd

(asdf:defsystem #:ug-dl
  :description "Describe ug-dl here"
  :author "Afonso Ribeiro <afonso.viegas.0@gmail.com>"
  :license  "GPLv3"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "ug-dl"))
  :depends-on (#:dexador
	       #:cl-json
	       #:ironclad
	       #:local-time))
