(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva) (erva-preco-por-grama erva) (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Aviso: Maomao vai testar a erva em si mesma antes"
      "Liberada para o paciente"))

(defun main ()
  (let* ((ginseng   (make-erva :nome "Ginseng" :preco-por-grama 2.5 :toxicidade 1))
         (artemisia (make-erva :nome "Artemisia" :preco-por-grama 1.2 :toxicidade 5))
         (dedaleira (make-erva :nome "Dedaleira" :preco-por-grama 4.0 :toxicidade 8))
         (ervas     (list ginseng artemisia dedaleira)))
    (format t "--- Estoque da Maomao ---~%")
    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%" (aviso e)))
    (format t "--- Dose ---~%")
    (format t "Dose de 10 gramas de ~a: R$~,2f~%"
            (erva-nome ginseng) (preco-da-dose ginseng 10))))

(main)
