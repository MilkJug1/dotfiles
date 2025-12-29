;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

(setq doom-font (font-spec :family "Monocraft" :size 16))

(setq user-full-name "Michael Crawford"
      user-mail-address "michael.sagan.crawford@gmail.com")

(setq doom-modeline-icon t
      doom-modeline-major-mode-icon t
      doom-modeline-lsp-icon t
      doom-modeline-major-mode-color-icon t)

;; Send files to trash instead of fully deleting
(setq delete-by-moving-to-trash t)
;; Save automatically
(setq auto-save-default t)

;; Performance optimizations
(setq gc-cons-threshold (* 256 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq comp-deferred-compilation t)
(setq comp-async-jobs-number 8)

;; Garbage collector optimization
(setq gcmh-idle-delay 5)
(setq gcmh-high-cons-threshold (* 1024 1024 1024))

;; Version control optimization
(setq vc-handled-backends '(Git))

;; Speed of which-key popup
(setq which-key-idle-delay 0.2)

(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

;; LSP Performance optimizations and settings
(after! lsp-mode
  (setq lsp-idle-delay 0.5
        lsp-log-io nil
        lsp-completion-provider :capf
        lsp-enable-file-watchers nil
        lsp-enable-folding nil
        lsp-enable-text-document-color nil
        lsp-enable-on-type-formatting nil
        lsp-enable-snippet nil
        lsp-enable-symbol-highlighting nil
        lsp-enable-links nil
        ;; Go-specific settings
        lsp-go-hover-kind "FullDocumentation"  ; CHANGED: was "Synopsis"
        lsp-go-analyses '((nilness . t)        ; CHANGED: removed fieldalignment
                          (unusedwrite . t)
                          (unusedparams . t))
        ;; Register custom gopls settings
        lsp-gopls-completeUnimported t
        lsp-gopls-staticcheck t
        lsp-gopls-analyses '((unusedparams . t)
                             (unusedwrite . t))))
;; LSP UI settings for better performance
(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-max-height 8
        lsp-ui-doc-max-width 72
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-delay 0.5
        lsp-ui-sideline-enable nil
        lsp-ui-peek-enable t))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


(after! project
  ;; Master project detection function - extensible for all project types
  (add-hook 'project-find-functions
            (lambda (dir)
              (cond
               ;; ;; Go projects
               ;; ((locate-dominating-file dir "go.mod")
               ;;  (cons 'transient (locate-dominating-file dir "go.mod")))

               ;; Rust projects
               ((locate-dominating-file dir "Cargo.toml")
                (cons 'transient (locate-dominating-file dir "Cargo.toml")))

               ;; zig projects
               ((or (locate-dominating-file dir "build.zig")
                    (locate-dominating-file dir "build.zig.zong"))
                (cons 'transient (or (locate-dominating-file dir "build.zig")
                                     (locate-dominating-file dir "build.zig.zon"))))

               ;; Python projects (multiple markers)
               ((or (locate-dominating-file dir "pyproject.toml")
                    (locate-dominating-file dir "setup.py")
                    (locate-dominating-file dir "requirements.txt"))
                (cons 'transient (or (locate-dominating-file dir "pyproject.toml")
                                     (locate-dominating-file dir "setup.py")
                                     (locate-dominating-file dir "requirements.txt"))))

               ;; Generic git projects (fallback)
               ((locate-dominating-file dir ".git")
                (cons 'transient (locate-dominating-file dir ".git")))))))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq org-modern-star 'replace)

;; Completion mechanisms
(setq completing-read-function #'completing-read-default)
(setq read-file-name-function #'read-file-name-default)
;; Makes path completion more like find-file everywhere
(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)
;; Use the familiar C-x C-f interface for directory completion
(map! :map minibuffer-mode-map
      :when (featurep! :completion vertico)
      "C-x C-f" #'find-file)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
                                        ;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(text-mode . ("harper-ls" "--stdio"))))

(setq gptel-model 'llama3.1:8b)

(gptel-make-ollama "Ollama"             ;Any name of your choosing
  :host "localhost:11434"               ;Where it's running
  :stream t                             ;Stream responses
  :models '(qwen3:8b llama3.1:8b deepseek-r1:7b:))          ;List of models
