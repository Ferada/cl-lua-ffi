(in-package #:cl-lua-ffi)

(define-foreign-library liblua50
  (T (:default "liblua50")))

(use-foreign-library liblua50)

(defctype lua-state :pointer)

(defctype lua-number :double)

(defctype size :unsigned-int)

(defcenum lua-type
  (:none -1)
  :nil
  :boolean
  :lightuserdata
  :number
  :string
  :table
  :function
  :userdata
  :thread)

(defcfun lua-open lua-state)

(defcfun lua-close :void
  (state lua-state))

(defcfun lua-newthread :void
  (state lua-state))

;; TODO: lua-atpanic

(defcfun lua-gettop :int
  (state lua-state))

(defcfun lua-settop :void
  (state lua-state)
  (index :int))

(defcfun lua-pushvalue :void
  (state lua-state)
  (index :int))

(defcfun lua-remove :void
  (state lua-state)
  (index :int))

(defcfun lua-insert :void
  (state lua-state)
  (index :int))

(defcfun lua-replace :void
  (state lua-state)
  (index :int))

(defcfun lua-checkstack :boolean
  (state lua-state)
  (extra :int))

(defcfun lua-xmove :void
  (from lua-state)
  (to lua-state)
  (n :int))

(defcfun lua-isnumber :boolean
  (state lua-state)
  (index :int))

(defcfun lua-isstring :boolean
  (state lua-state)
  (index :int))

(defcfun lua-iscfunction :boolean
  (state lua-state)
  (index :int))

(defcfun lua-isuserdata :boolean
  (state lua-state)
  (index :int))

(defcfun lua-type lua-type
  (state lua-state)
  (index :int))

;; TODO: type is an enum
(defcfun lua-typename :string
  (state lua-state)
  (type :int))

(defcfun lua-equal :boolean
  (state lua-state)
  (index1 :int)
  (index2 :int))

(defcfun lua-rawequal :boolean
  (state lua-state)
  (index1 :int)
  (index2 :int))

(defcfun lua-lessthan :boolean
  (state lua-state)
  (index1 :int)
  (index2 :int))

(defcfun lua-tonumber lua-number
  (state lua-state)
  (index :int))

(defcfun lua-toboolean :boolean
  (state lua-state)
  (index :int))

(defcfun lua-tostring :string
  (state lua-state)
  (index :int))

(defcfun lua-strlen size
  (state lua-state)
  (index :int))

;; TODO: lua-tocfunction

(defcfun lua-touserdata :pointer
  (state lua-state)
  (index :int))

(defcfun lua-tothread lua-state
  (state lua-state)
  (index :int))

(defcfun lua-topointer :pointer
  (state lua-state)
  (index :int))

(defcfun lua-pushnil :void
  (state lua-state))

(defcfun lua-pushnumber :void
  (state lua-state)
  (number lua-number))

(defcfun lua-pushlstring :void
  (state lua-state)
  (string :string)
  (length size))

;; TODO: lua-pushstring
;; TODO: lua-pushvfstring
;; TODO: lua-pushfstring
;; TODO: lua-pushcclosure

(defcfun lua-pushboolean :void
  (state lua-state)
  (boolean :boolean))

(defcfun lua-pushlightuserdata :void
  (state lua-state)
  (pointer :pointer))

(defcfun lua-gettable :void
  (state lua-state)
  (index :int))

(defcfun lua-rawget :void
  (state lua-state)
  (index :int))

(defcfun lua-rawgeti :void
  (state lua-state)
  (index :int)
  (n :int))

(defcfun lua-newtable :void
  (state lua-state))

(defcfun lua-newuserdata :pointer
  (state lua-state)
  (size size))

(defcfun lua-getmetatable :int
  (state lua-state)
  (index :int))

(defcfun lua-getfenv :void
  (state lua-state)
  (index :int))

(defcfun lua-settable :void
  (state lua-state)
  (index :int))

(defcfun lua-rawset :void
  (state lua-state)
  (index :int))

(defcfun lua-rawseti :void
  (state lua-state)
  (index :int)
  (n :int))

(defcfun lua-setmetatable :boolean
  (state lua-state)
  (index :int))

(defcfun lua-setfenv :boolean
  (state lua-state)
  (index :int))

(defcfun lua-call :void
  (state lua-state)
  (nargs :int)
  (nresults :int))

(defcfun lua-pcall :void
  (state lua-state)
  (nargs :int)
  (nresults :int)
  (errfunc :int))

;; TODO: lua-cpcall
;; TODO: lua-load
;; TODO: lua-dump

(defcfun lua-yield :boolean
  (state lua-state)
  (nresults :int))

(defcfun lua-resume :void
  (state lua-state)
  (narg :int))

(defcfun lua-getgcthreshold :int
  (state lua-state))

(defcfun lua-gccount :int
  (state lua-state))

(defcfun lua-setgcthreshold :void
  (state lua-state)
  (newthreshold :int))

(defcfun lua-version :string)

;; TODO: lua-error

(defcfun lua-next :boolean
  (state lua-state)
  (index :int))

(defcfun lua-concat :void
  (state lua-state)
  (n :int))

;; TODO: lua-boxpointer
;; TODO: lua-unboxpointer

(defun lua-pop (state n)
  (lua-settop state (1- (- n))))

;; TODO: lua-register
;; TODO: lua-pushcfunction

(defun lua-isfunction (state n)
  (eq (lua-type state n) :function))

(defun lua-istable (state n)
  (eq (lua-type state n) :table))

(defun lua-islightuserdata (state n)
  (eq (lua-type state n) :lightuserdata))

(defun lua-isnil (state n)
  (eq (lua-type state n) :nil))

(defun lua-isboolean (state n)
  (eq (lua-type state n) :boolean))

(defun lua-isnone (state n)
  (eq (lua-type state n) :none))

(defun lua-isnoneornil (state n)
  (let ((type (lua-type state n)))
    (or (eq type :function)
        (eq type :none))))

;; TODO: lua-pushliteral
