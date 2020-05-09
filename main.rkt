#|
	WangTaL 5/9/2020
|#

#lang racket/base

(require "racket-state-machine.rkt")

(define (main)
	(define rsm (racket-state-machine))

	((rsm 'add-state)
		'idle
		(state
			(lambda () (idle-enter rsm))
			(lambda () (idle-update rsm))
			(lambda () (idle-exit rsm))))
	((rsm 'add-state)
		'move
		(state
			(lambda () (move-enter rsm))
			(lambda () (move-update rsm))
			(lambda () (move-exit rsm))))
	((rsm 'add-state)
		'attack
		(state
			(lambda () (attack-enter rsm))
			(lambda () (attack-update rsm))
			(lambda () (attack-exit rsm))))

	((rsm 'change-state) 'idle)

	(let loop ()
		((rsm 'update))
		(sleep 1)
		(loop)))

(define (idle-enter rsm)
	(printf "idle-enter\n"))

(define (idle-update rsm)
	(printf "idle-update\n")
	((rsm 'change-state) 'move))

(define (idle-exit rsm)
	(printf "idle-exit\n"))

(define (move-enter rsm)
	(printf "move-enter\n"))

(define (move-update rsm)
	(printf "move-update\n")
	((rsm 'change-state) 'attack))

(define (move-exit rsm)
	(printf "move-exit\n"))

(define (attack-enter rsm)
	(printf "attack-enter\n"))

(define (attack-update rsm)
	(printf "attack-update\n"))

(define (attack-exit rsm)
	(printf "attack-exit\n"))

(main)
