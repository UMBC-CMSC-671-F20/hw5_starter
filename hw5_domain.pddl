;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HW5 blocks world with painting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain hw5_domain)
  (:requirements :strips)

  (:constants red green blue)

  ;; the first five predicates are for the classic block world.  The rest are
  ;;  addional predicates required to extend the model to allow for painting

  (:predicates (on ?x ?y)              ; object ?x is on object ?y
	       (on-table ?x)           ; object ?x is directly on the table
	       (clear ?x)              ; object ?x has nothing on it
	       (arm-empty)             ; the arm is not holding anything
	       (holding ?x)            ; the arm is holding ?x
	       (block ?x)              ; ?x is a block
	       (paint-can ?x ?color)   ; ?x is a paint can with paint color ?color
	       (brush ?x)              ; ?x is a paint brush
	       (water-bucket ?wb)      ; ?x is a water bucket
	       (color ?x ?color)       ; ?x has color ?color
               (open ?can)             ; paint can ?can is open
	       (clean ?brush)          ; brush ?brush is clean
	       (loaded ?brush ?color)  ; brush ?brush is loaded with paint of color ?color
               (true))                 ; dummy effect of no consequence

  ;; the four classic actions for manipulating objects

  (:action pick-up
     :parameters (?ob1)
     :precondition (and (clear ?ob1) (on-table ?ob1) (arm-empty))
     :effect
     (and (not (on-table ?ob1))
	   (not (clear ?ob1))
	   (not (arm-empty))
	   (holding ?ob1)))

  (:action put-down
     :parameters (?ob)
     :precondition (holding ?ob)
     :effect
     (and (not (holding ?ob))
	   (clear ?ob)
	   (arm-empty)
	   (on-table ?ob)))

  (:action stack
     :parameters (?sob ?sunderob)
     :precondition (and (holding ?sob) (clear ?sunderob))
     :effect
     (and (not (holding ?sob))
	   (not (clear ?sunderob))
	   (clear ?sob)
	   (arm-empty)
	   (on ?sob ?sunderob)))

  (:action unstack
     :parameters (?sob ?sunderob)
     :precondition (and (on ?sob ?sunderob) (clear ?sob) (arm-empty))
     :effect
     (and (holding ?sob)
	   (clear ?sunderob)
	   (not (clear ?sob))
	   (not (arm-empty))
	   (not (on ?sob ?sunderob))))

  ;; complete the actions below that extend the blocks world model to include painting

  ;; paint object ?obj color ?color using brush ?brush
  (:action paint
    :parameters (?obj ?color ?brush)
    :precondition (and (< 1 0))   ; REPLACE (< 1 0) WITH ONE OR MORE CONDITIONS
    :effect (and (true))          ; REPLACE with the action's effects
    )

  ;; wash the brush ?brush that is currently loaded with paint of color ?color
  ;; in the water bucket ?wb
  (:action wash-brush
    :parameters (?brush ?wb ?color)
    :precondition (and (< 1 0))   ; REPLACE (< 1 0) WITH ONE OR MORE CONDITIONS
    :effect (and (true))          ; REPLACE with the action's effects
    )

  ;; load paint colored ?color from can ?can onto brush ?brush
  (:action load-brush
    :parameters (?brush ?can ?color)
    :precondition (and (< 1 0))   ; REPLACE (< 1 0) WITH ONE OR MORE CONDITIONS
    :effect (and (true))          ; REPLACE with the action's effects
    )

   ;; remove the lid of paint can ?can that has paint of color ?color
   (:action remove-can-lid 
    :parameters (?can ?color)
    :precondition (and (< 1 0))   ; REPLACE (< 1 0) WITH ONE OR MORE CONDITIONS
    :effect (and (true))          ; REPLACE with the action's effects
    )
    
   ;; replace the lid of paint can ?can that has paint of color ?color
   (:action replace-can-lid
    :parameters (?can ?color)
    :precondition (and (< 1 0))   ; REPLACE (< 1 0) WITH ONE OR MORE CONDITIONS
    :effect (and (true))          ; REPLACE with the action's effects
    )

)
