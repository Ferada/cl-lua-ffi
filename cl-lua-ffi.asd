;;; -*- mode: lisp; syntax: common-lisp; coding: utf-8-unix; package: cl-user; -*-

(in-package #:cl-user)

(asdf:defsystem #:cl-lua-ffi
  :description "Lua FFI bindings."
  :long-description "FFI bindings to the Lua API."
  :author "Olof-Joachim Frahm <olof@macrolet.net>"
  :license "Simplified BSD License"
  :depends-on (#:cffi)
  :serial T
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "ffi")))))
