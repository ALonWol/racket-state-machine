#|
	WangTaL 5/9/2020
|#

#lang racket/base

(struct state (enter update exit))

(define (racket-state-machine)
  (define states null)
  (define current-state null)
  (define last-state null)

  (define (add-state name state)
    (when (not (assoc name states))
      (set! states (cons (cons name state) states))) states)

  (define (change-state name)
    (when (not (null? current-state))
      ((state-exit current-state)))
    (set! last-state current-state)
    (set! current-state (cdr (assoc name states)))
    (when (not (null? current-state))
      ((state-enter current-state))))
  
  (define (update)
    (when (not (null? current-state))
      ((state-update current-state))))

  (lambda (msg)
    (case msg
      ((add-state) add-state)
      ((change-state) change-state)
      ((update) update)
      (else void))))

(provide (all-defined-out))
