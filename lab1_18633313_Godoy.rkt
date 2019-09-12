#lang racket

;Estas constantes fueron sacadas de https://en.wikipedia.org/wiki/Linear_congruential_generator
(define a 1103515245)
(define c 12345)
(define m 2147483648)
;Esta función random tuma un xn y obtiene el xn+1 de la secuencia de números aleatorios.
(define myRandom
  (lambda
    (xn)
    (remainder  (+ (* a xn) c) m)
  )
)
;Cada vez que pedimos un random, debemos pasar como argumento el random anterior.

;Acá un ejemplo que permite generar una lista de números aleatorios.
;Parámetros:
;* "cuantos" indica el largo de la lista a generar.
;* "xActual" valor actual del random, se pasa en cada nivel de recursión de forma actualizada
;* "maximo" Los números generados van desde 0 hasta maximo-1
(define getListaRandom
  (lambda (cuantos xActual maximo)
    (if (= 0 cuantos)
        '()
        (let ((xNvo (myRandom xActual)))
          (cons (remainder xNvo maximo)
              (getListaRandom (- cuantos 1) xNvo maximo)
          )
        )
    )
  )
)

#|----------------------------------------------------------------------------------------------------------------------------------------------------------------------
TDA crear Escenario

Nivel 0: Representación
Escenario:
Lista de elementos,
Donde los dos primeros números corresponden al ancho y alto respectivamente, el tercero corresponde a la cantidad de enemigos iniciales, el cuarto a la dificultad que tendrá el escenario y el quinto a la semilla para generar valores aleatorios
Todos estos datos deben ser números enteros.|#

#|Nivel 1: Constructor
Función: createScene
Dominio: Entero x entero x entero x entero x entero
Recorrido: Escenario (tablero)|#

;(define (createScene N M E D seed))

#|Nivel 2: Funciones de Pertenencias
Funcion: checkScene
Dominio: Escenario
Recorrido: Booleano|#

  (define (checkScene scene)
    (if (= (length scene) 5)
        (if (and (and (integer? (car scene))(> (car scene) 0))
                 (and (integer? (cadr scene))(> (cadr scene) 0))
                 (and (integer? (caddr scene))(>= (caddr scene) 1))
                 (and (integer? (cadddr scene))(> (cadddr scene) 0))
                 (integer? (cdr(cadddr scene))))
            #t
            #f
            )
        #f
        )
    )
                 








