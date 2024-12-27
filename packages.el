;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)

;; `download-source'
(setq package-archives
      '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

;; `org'
(package! org-modern)
(package! org-modern-indent :recipe (:host github :repo "jdtsmith/org-modern-indent"))
(package! org-visual-outline :recipe (:host github :repo "legalnonsense/org-visual-outline"))
(package! org-bullets)
(package! org-superstar)
(package! org-ai)
(package! org-menu :recipe (:host github :repo "sheijk/org-menu"))
(package! org-ref)
(unpin! org-roam)
(package! org-roam)
(package! org-roam-ui)
(package! org-download)
(package! org-bars :recipe (:host github :repo "tonyaldon/org-bars"))
(package! org-appear)
(package! org-auto-tangle)
(package! emacs-everywhere :pin nil)

;; `workflow'
(package! plantuml-mode)
(package! flycheck-plantuml)

;; `translation'
(package! go-translate)
(package! plz)
(package! bing-dict)

;; `indentation'
(package! aggressive-indent)
(package! highlight-indent-guides)

;; `AI'
(package! chatgpt-shell)

;; `completion'
(when (package! lsp-bridge
        :recipe (:host github
                 :repo "manateelazycat/lsp-bridge"
                 :branch "master"
                 :files ("*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
                 ;; do not perform byte compilation or native compilation for lsp-bridge
                 :build (:not compile)))
  (package! markdown-mode)
  (package! yasnippet))
(package! codeium :recipe (:host github :repo "Exafunction/codeium.el"))

;; `modeline'
(package! keycast)

;; `search'
(package! p-search :recipe (:host github :repo "zkry/p-search"))

;; `python'
(package! jupyter)
(package! ein)

;; `text'
(package! puni)

;; `minibuffer'
(package! embark)

;; `ui'
(package! rainbow-delimiters)
(package! auto-dim-other-buffers)
(package! dimmer)

;; `cursor'
(package! beacon)
(package! goggles)

;; `highlight'
(package! symbol-overlay)
(package! region-occurrences-highlighter)

;; `theme'
(package! spacemacs-theme)

;; `graphics'
(package! graphviz-dot-mode)

;; `tool'
(package! calfw)

;; `agenda'
(package! elgantt :recipe (:host github :repo "legalnonsense/elgantt"))

;; `other'
(package! sideline :recipe (:host github :repo "emacs-sideline/sideline"))
(package! thing-edit :recipe (:host github :repo "manateelazycat/thing-edit"))

;; `font'
(package! cnfonts)
;; 'M-x all-the-icons-install-fonts' to download font and 'fc-cache -f -v' install font
(package! all-the-icons)
(package! nerd-icons)

;; `doc'
(package! eldoc-box)
