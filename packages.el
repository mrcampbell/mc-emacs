;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)

(package! org-autolist)
(package! copilot
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package elixir-mode                                         ;;
;;   :ensure t                                                      ;;
;;   :init                                                          ;;
;;   (add-hook 'elixir-mode-hook                                    ;;
;;             (lambda ()                                           ;;
;;               (push '(">=" . ?\u2265) prettify-symbols-alist)    ;;
;;               (push '("<=" . ?\u2264) prettify-symbols-alist)    ;;
;;               (push '("!=" . ?\u2260) prettify-symbols-alist)    ;;
;;               (push '("==" . ?\u2A75) prettify-symbols-alist)    ;;
;;               (push '("=~" . ?\u2245) prettify-symbols-alist)    ;;
;;               (push '("<-" . ?\u2190) prettify-symbols-alist)    ;;
;;               (push '("->" . ?\u2192) prettify-symbols-alist)    ;;
;;               (push '("<-" . ?\u2190) prettify-symbols-alist)    ;;
;;               (push '("|>" . ?\u25B7) prettify-symbols-alist)))) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package reformatter
;;   :ensure t
;;   :config
;;   ; Adds a reformatter configuration called "+elixir-format"
;;   ; This uses "mix format -"
;;   (reformatter-define +elixir-format
;;     :program "mix"
;;     :args '("format" "-"))
;;   ; defines a function that looks for the .formatter.exs file used by mix format
;;   (defun +set-default-directory-to-mix-project-root (original-fun &rest args)
;;     (if-let* ((mix-project-root (and buffer-file-name
;;                                      (locate-dominating-file buffer-file-name
;;                                                              ".formatter.exs"))))
;;         (let ((default-directory mix-project-root))
;;           (apply original-fun args))
;;       (apply original-fun args)))
;;   ; adds an advice to the generated function +elxir-format-region that sets the proper root dir
;;   ; mix format needs to be run from the root directory otherwise it wont use the formatter configuration
;;   (advice-add '+elixir-format-region :around #'+set-default-directory-to-mix-project-root)
;;   ; Adds a hook to the major-mode that will add the generated function +elixir-format-on-save-mode
;;   ; So, every time we save an elixir file it will try to find a .formatter.exs and then run mix format from
;;   ; that file's directory
;;   (add-hook 'elixir-mode-hook #'+elixir-format-on-save-mode))

;; (use-package lsp-mode
;;  :commands lsp
;;  :ensure t
;;  :diminish lsp-mode
;;  :hook
;;  (elixir-mode . lsp)
;;  :init
;;  (add-to-list 'exec-path "~/elixir-ls"))

(setq lsp-clients-elixir-server-executable "~/elixir-ls/language_server.sh")
