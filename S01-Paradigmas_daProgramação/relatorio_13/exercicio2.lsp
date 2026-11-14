(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Safe Shallows"
                  :profundidade 10 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Kelp Forest"
                  :profundidade 50 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Crash Zone"
                  :profundidade 200 :perigo :leviata)
   (make-criatura :nome "Crabsquid" :bioma "Blood Kelp"
                  :profundidade 350 :perigo :agressiva)
   (make-criatura :nome "Ghost Leviathan" :bioma "Grand Reef"
                  :profundidade 450 :perigo :leviata)))

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva  "Agressiva")
    (:leviata    "Leviata: mantenha distancia")
    (otherwise   "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a - ~a - ~a metros - ~a"
          (criatura-nome c) (criatura-bioma c) (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defun main ()
  (format t "--- Catalogo do Scanner ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))
  (let ((fundas (abaixo-de 300 *catalogo*)))
    (format t "--- Abaixo de 300 metros ---~%")
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~a~%" texto))
    (format t "Quantidade: ~a~%" (length fundas))))

(main)
