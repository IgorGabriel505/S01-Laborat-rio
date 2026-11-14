(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (make-garota-magica :nome      (garota-magica-nome g)
                      :escuridao (if (>= quantidade (garota-magica-escuridao g))
                                     0
                                     (- (garota-magica-escuridao g) quantidade))
                      :bruxas    (garota-magica-bruxas g)))

(defun main ()
  (let* ((homura (make-garota-magica :nome "Homura" :escuridao 60 :bruxas 12))
         (mami   (make-garota-magica :nome "Mami" :escuridao 40 :bruxas 20))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 70 :bruxas 5))
         (madoka (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 0))
         (grupo      (list homura mami sayaka))
         (grupo-novo (cons madoka grupo))
         (sayaka-purificada (purifica sayaka 80)))
    (format t "--- Grupo ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Bruxas derrotadas: ~a~%" (total-de-bruxas grupo))
    (format t "--- ~a faz o contrato ---~%" (garota-magica-nome madoka))
    (format t "Escuridao total do grupo anterior: ~a~%" (escuridao-total grupo))
    (format t "Escuridao total do grupo novo: ~a~%" (escuridao-total grupo-novo))
    (format t "--- Semente da Aflicao ---~%")
    (format t "~a original: ~a~%"
            (garota-magica-nome sayaka) (garota-magica-escuridao sayaka))
    (format t "~a purificada: ~a~%"
            (garota-magica-nome sayaka-purificada)
            (garota-magica-escuridao sayaka-purificada))))

(main)
