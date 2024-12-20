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
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face See 'C-h v doom-font' for documentation and more examples of what they
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
(setq doom-theme 'doom-solarized-light) ;; 'doom-one

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "Hack Nerd Font" :size 15 :weight 'semi-light)
      doom-unicode-font (font-spec :family "monospace"))

(add-hook 'window-setup-hook #'toggle-frame-maximized)  ;; 'toggle-frame-fullscreen

;; `File-Manager'
(use-package! treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-files-by-mouse-dragging    t
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package! treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package! treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package! treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package! treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package! treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

;; (use-package! treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
;;   :after (treemacs)
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Tabs))

(treemacs-start-on-boot)

;; `Indentation-Enhancement'
;;
(use-package! aggressive-indent
  :config (global-aggressive-indent-mode t))

(use-package! rainbow-mode
  :hook (after-init . rainbow-mode))

(use-package! rainbow-delimiters
  :hook (after-init . rainbow-delimiters-mode))

(use-package! highlight-indent-guides
  :config
        (setq highlight-indent-guides-method 'character)
        (setq highlight-indent-guides-responsive 'top)
        (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
)

;; `AI'
;; A multi-llm Emacs shell (ChatGPT, Claude, Gemini, Kagi, Ollama, Perplexity) + editing integrations
;;
;; command:
;;   chatgpt-shell-swap-model: Swap model version from `chatgpt-shell-models’.
(use-package! chatgpt-shell
  :ensure t
  :config
  (setq chatgpt-shell-model-version "gpt-3.5-turbo")
  :custom
  ((chatgpt-shell-api-url-base "https://api.vveai.com")
   (chatgpt-shell-openai-key (getenv "OPENAI_API_KEY"))))

;; AI completion with company: key 'Enter' to complete,
(use-package! codeium
    ;; if you use straight
    ;; :straight '(:type git :host github :repo "Exafunction/codeium.el")
    ;; otherwise, make sure that the codeium.el file is on load-path

    :init
    ;; use globally
    (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
    ;; or on a hook
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions '(codeium-completion-at-point))))

    ;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions
    ;;             (list (cape-capf-super #'codeium-completion-at-point #'lsp-completion-at-point)))))
    ;; an async company-backend is coming soon!

    ;; codeium-completion-at-point is autoloaded, but you can
    ;; optionally set a timer, which might speed up things as the
    ;; codeium local language server takes ~0.2s to start up
    ;; (add-hook 'emacs-startup-hook
    ;;  (lambda () (run-with-timer 0.1 nil #'codeium-init)))

    ;; :defer t ;; lazy loading, if you want
    :config
    (setq use-dialog-box nil) ;; do not use popup boxes

    ;; if you don't want to use customize to save the api-key
    ;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")

    ;; get codeium status in the modeline
    (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
    (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
    ;; alternatively for a more extensive mode-line
    ;; (add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

    ;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
    (setq codeium-api-enabled
        (lambda (api)
            (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
    ;; you can also set a config for a single buffer like this:
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local codeium/editor_options/tab_size 4)))

    ;; You can overwrite all the codeium configs!
    ;; for example, we recommend limiting the string sent to codeium for better performance
    (defun my-codeium/document/text ()
        (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
    ;; if you change the text, you should also change the cursor_offset
    ;; warning: this is measured by UTF-8 encoded bytes
    (defun my-codeium/document/cursor_offset ()
        (codeium-utf8-byte-length
            (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
    (setq codeium/document/text 'my-codeium/document/text)
    (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))

;; `completion'
(use-package! company
    :defer 0.1
    :bind (("C-<tab>" . company-complete-common)
         ;;
         :map company-active-map        ;
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("C-s" . company-filter-candidates)
         ("<tab>" . company-complete-selection)
         ("TAB" . company-complete-selection)
         ("<return>" . company-complete-selection) ; invalid at terminal
         ("RET" . company-complete-selection)      ; valid at terminal
         :map company-search-map                   ;
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("<tab>" . company-complete-selection)
         ("TAB" . company-complete-selection)
         ("<return>" . company-complete-selection) ; invalid at terminal
         ("RET" . company-complete-selection)      ; valid at terminal
         )
    :config
    ;; Enable company completion.
    (global-company-mode t)
    (setq-default
        company-idle-delay 0.05
        company-require-match nil
        company-minimum-prefix-length 0

        ;; `Frontbend'
        ;; An annotation is a string that carries additional information about a candidate;
        ;; such as a data type, function arguments, or whatever a backend appoints to be
        ;; a valuable piece of information about a candidate. By default,
        ;; the annotations are shown right beside the candidates.
        ;; Setting the option value to t aligns annotations to the right side of the tooltip.
        company-tooltip-align-annotations t
        ;; Controls the maximum number of the candidates shown simultaneously in the tooltip
        ;; (the default value is 10). When the number of the available candidates is
        ;; larger than this option’s value, Company paginates the results.
        company-tooltip-limit 20
        ;; Use this option to choose in which way to output paginated results. The default value is ‘scrollbar’.
        ;; Another supported value is ‘lines’; choose it to show the quantity of the candidates not displayed by the current tooltip page.
        company-tooltip-offset-display 'scrollbar
        ;; This user option acts only when a tooltip is shown close to the bottom of a window.
        ;; It guarantees visibility of this number of completion candidates below point.
        ;; When the number of lines between point and the bottom of a window is less than company-tooltip-minimum value,
        ;; the tooltip is displayed above point.
        company-tooltip-minimum 4
        ;; When this setting is enabled, no matter if a tooltip is shown above or below point,
        ;; the candidates are always listed starting near point. (Putting it differently,
        ;; the candidates are mirrored vertically if a tooltip changes its position,
        ;; instead of being commonly listed top-to-bottom.)
        company-tooltip-flip-when-above nil
        ;; Controls the width of the margin on the sides of the tooltip inner area.
        ;; If company-format-margin-function is set, company-tooltip-margin defines only the right margin.
        company-tooltip-margin 0
        ;; If company-show-quick-access is enabled, tooltip- and echo- frontends show quick-access hints.
        company-show-quick-access 'left
        ;; show candidate numbers
        company-show-numbers t

        ;; get only preview
        company-frontends '(company-preview-frontend)
        ;; also get a drop down
        ;; company-frontends '(company-pseudo-tooltip-frontend company-preview-frontend)

        company-backends '((company-dabbrev-code company-keywords company-files)
                           (company-dabbrev)
                           (company-tabnine)    ;; AI completion
                           (company-capf :with company-yasnippet))      ;; get candidate, annotation, deprecated, exit-function info
        ))

;; NOTE: When using `lsp-bridge', please first disable other completion plugins, such as `lsp-mode', `eglot', `company', `corfu', etc.
(use-package! lsp-bridge
  :config
  (global-lsp-bridge-mode)
  (setq-default
   ;; Enable pop-completion up in Minibuffer, disabled by default
   lsp-bridge-enable-completion-in-minibuffer t
   ;; show diagnostic tooltip when cursor hover diagnostic place, disable by default
   lsp-bridge-enable-hover-diagnostic t
   ;; enable LSP message log, disable by default, only enable this option for development purposes,
        ;; usually do not turn on this option to avoid affecting performance
        lsp-bridge-enable-log nil
        ;; enable program debugging, disable by default
        lsp-bridge-enable-debug nil

        ;; `AI'
        ;; Enable Codeium support, when enable need execute `lsp-bridge-install-update-codeium' command to install Codeium,
        ;; then execute `lsp-bridge-codeium-auth' command to get auth token and execute `lsp-bridge-codeium-input-auth-token' command to get API Key,
        ;; and it can be used.
        acm-enable-codeium nil
        ;; The minimum characters to trigger codeium completion, default is 0
        acm-backend-codeium-candidate-min-length 1

        ;; Whether to display an index after the icon, quickly select candidate words using Alt + Number, default is off
        acm-enable-quick-access t
        ;; Whether to use number keys for quick selection of candidate words, default is off,
        ;; turning on this option may sometimes interfere with number input or accidentally select candidate words
        acm-quick-access-use-number-select t
        ;; The minimum characters to trigger lsp completion, default is 0
        acm-backend-lsp-candidate-min-length 0
        ;; Search Words completion candidate limit, default is 10
        acm-backend-search-file-words-max-number 10
        ;; Search Words completion candidate fuzzy match, disable by default
        acm-backend-search-file-words-enable-fuzzy-match t
        ;; Maximum length of LSP candidate, some language, such as Java, argument list is very long,
        ;; you can increase the value of this option to see clear argument list
        acm-backend-lsp-candidate-max-length 20
        ;; The filtering mode for candidates in LSP backend, there are three options: `prefix',
        ;; `prefixCaseSensitive', and `fuzzy'. By default it is `fuzzy'
        acm-backend-lsp-match-mode 'fuzzy
        ;; show working progress, disable by default
        acm-backend-lsp-show-progress nil

        ;; `doc'
        ;; Whether the complete menu display the help document
        acm-enable-doc t
        ;; Richly render Markdown for completion popups, you can choose 'async, t or nil.
        ;; When set to 'async, styles are applied asynchronously, choose t,
        ;; styles are applied synchronously and will slow down the completion speed, default is 'async
        acm-enable-doc-markdown-render 'async
        ;; Max line number of help documentation, default is 20
        acm-doc-frame-max-lines 20
   ))

;; `Minibuffer'
;; C-x * q (calc quick mode)
;; C-x C-f (find-file)
;; (use-package! ivy
;;   :ensure t
;;   :diminish ivy-mode
;;   :hook (after-init . ivy-mode))

(use-package! minimap
  :init (setq minimap-width-fraction 0.10
              minimap-minimum-width 10
              minimap-window-location 'right)
  ;; :hook (after-init . minimap-mode)
  )

;; `Mode-line'
(use-package! doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
        ;; If non-nil, cause imenu to see `doom-modeline' declarations.
        ;; This is done by adjusting `lisp-imenu-generic-expression' to
        ;; include support for finding `doom-modeline-def-*' forms.
        ;; Must be set before loading doom-modeline.
        (setq doom-modeline-support-imenu t)

        ;; How tall the mode-line should be. It's only respected in GUI.
        ;; If the actual char height is larger, it respects the actual height.
        (setq doom-modeline-height 25)

        ;; How wide the mode-line bar should be. It's only respected in GUI.
        (setq doom-modeline-bar-width 4)

        ;; Whether to use hud instead of default bar. It's only respected in GUI.
        (setq doom-modeline-hud nil)

        ;; The limit of the window width.
        ;; If `window-width' is smaller than the limit, some information won't be
        ;; displayed. It can be an integer or a float number. `nil' means no limit."
        (setq doom-modeline-window-width-limit 85)

        ;; How to detect the project root.
        ;; nil means to use `default-directory'.
        ;; The project management packages have some issues on detecting project root.
        ;; e.g. `projectile' doesn't handle symlink folders well, while `project' is unable
        ;; to hanle sub-projects.
        ;; You can specify one if you encounter the issue.
        (setq doom-modeline-project-detection 'auto)

        ;; Determines the style used by `doom-modeline-buffer-file-name'.
        ;;
        ;; Given ~/Projects/FOSS/emacs/lisp/comint.el
        ;;   auto => emacs/l/comint.el (in a project) or comint.el
        ;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
        ;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
        ;;   truncate-with-project => emacs/l/comint.el
        ;;   truncate-except-project => ~/P/F/emacs/l/comint.el
        ;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
        ;;   truncate-all => ~/P/F/e/l/comint.el
        ;;   truncate-nil => ~/Projects/FOSS/emacs/lisp/comint.el
        ;;   relative-from-project => emacs/lisp/comint.el
        ;;   relative-to-project => lisp/comint.el
        ;;   file-name => comint.el
        ;;   file-name-with-project => FOSS|comint.el
        ;;   buffer-name => comint.el<2> (uniquify buffer name)
        ;;
        ;; If you are experiencing the laggy issue, especially while editing remote files
        ;; with tramp, please try `file-name' style.
        ;; Please refer to https://github.com/bbatsov/projectile/issues/657.
        (setq doom-modeline-buffer-file-name-style 'auto)

        ;; Whether display icons in the mode-line.
        ;; While using the server mode in GUI, should set the value explicitly.
        (setq doom-modeline-icon t)

        ;; Whether display the icon for `major-mode'. It respects option `doom-modeline-icon'.
        (setq doom-modeline-major-mode-icon t)

        ;; Whether display the colorful icon for `major-mode'.
        ;; It respects `nerd-icons-color-icons'.
        (setq doom-modeline-major-mode-color-icon t)

        ;; Whether display the icon for the buffer state. It respects option `doom-modeline-icon'.
        (setq doom-modeline-buffer-state-icon t)

        ;; Whether display the modification icon for the buffer.
        ;; It respects option `doom-modeline-icon' and option `doom-modeline-buffer-state-icon'.
        (setq doom-modeline-buffer-modification-icon t)

        ;; Whether display the lsp icon. It respects option `doom-modeline-icon'.
        (setq doom-modeline-lsp-icon t)

        ;; Whether display the time icon. It respects option `doom-modeline-icon'.
        (setq doom-modeline-time-icon t)

        ;; Whether display the live icons of time.
        ;; It respects option `doom-modeline-icon' and option `doom-modeline-time-icon'.
        (setq doom-modeline-time-live-icon t)

        ;; Whether to use an analogue clock svg as the live time icon.
        ;; It respects options `doom-modeline-icon', `doom-modeline-time-icon', and `doom-modeline-time-live-icon'.
        (setq doom-modeline-time-analogue-clock t)

        ;; The scaling factor used when drawing the analogue clock.
        (setq doom-modeline-time-clock-size 0.7)

        ;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
        (setq doom-modeline-unicode-fallback nil)

        ;; Whether display the buffer name.
        (setq doom-modeline-buffer-name t)

        ;; Whether highlight the modified buffer name.
        (setq doom-modeline-highlight-modified-buffer-name t)

        ;; When non-nil, mode line displays column numbers zero-based.
        ;; See `column-number-indicator-zero-based'.
        (setq doom-modeline-column-zero-based t)

        ;; Specification of \"percentage offset\" of window through buffer.
        ;; See `mode-line-percent-position'.
        (setq doom-modeline-percent-position '(-3 "%p"))

        ;; Format used to display line numbers in the mode line.
        ;; See `mode-line-position-line-format'.
        (setq doom-modeline-position-line-format '("L%l"))

        ;; Format used to display column numbers in the mode line.
        ;; See `mode-line-position-column-format'.
        (setq doom-modeline-position-column-format '("C%c"))

        ;; Format used to display combined line/column numbers in the mode line. See `mode-line-position-column-line-format'.
        (setq doom-modeline-position-column-line-format '("%l:%c"))

        ;; Whether display the minor modes in the mode-line.
        (setq doom-modeline-minor-modes nil)

        ;; If non-nil, a word count will be added to the selection-info modeline segment.
        (setq doom-modeline-enable-word-count nil)

        ;; Major modes in which to display word count continuously.
        ;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
        ;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
        ;; remove the modes from `doom-modeline-continuous-word-count-modes'.
        (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

        ;; Whether display the buffer encoding.
        (setq doom-modeline-buffer-encoding t)

        ;; Whether display the indentation information.
        (setq doom-modeline-indent-info t)

        ;; Whether display the total line number。
        (setq doom-modeline-total-line-number t)

        ;; Whether display the icon of vcs segment. It respects option `doom-modeline-icon'."
        (setq doom-modeline-vcs-icon t)

        ;; The maximum displayed length of the branch name of version control.
        (setq doom-modeline-vcs-max-length 15)

        ;; The function to display the branch name.
        (setq doom-modeline-vcs-display-function #'doom-modeline-vcs-name)

        ;; Whether display the icon of check segment. It respects option `doom-modeline-icon'.
        (setq doom-modeline-check-icon t)

        ;; If non-nil, only display one number for check information if applicable.
        (setq doom-modeline-check-simple-format nil)

        ;; The maximum number displayed for notifications.
        (setq doom-modeline-number-limit 99)

        ;; Whether display the project name. Non-nil to display in the mode-line.
        (setq doom-modeline-project-name t)

        ;; Whether display the workspace name. Non-nil to display in the mode-line.
        (setq doom-modeline-workspace-name t)

        ;; Whether display the perspective name. Non-nil to display in the mode-line.
        (setq doom-modeline-persp-name t)

        ;; If non nil the default perspective name is displayed in the mode-line.
        (setq doom-modeline-display-default-persp-name nil)

        ;; If non nil the perspective name is displayed alongside a folder icon.
        (setq doom-modeline-persp-icon t)

        ;; Whether display the `lsp' state. Non-nil to display in the mode-line.
        (setq doom-modeline-lsp t)

        ;; Whether display the GitHub notifications. It requires `ghub' package.
        (setq doom-modeline-github nil)

        ;; The interval of checking GitHub.
        (setq doom-modeline-github-interval (* 30 60))

        ;; Whether display the modal state.
        ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
        (setq doom-modeline-modal t)

        ;; Whether display the modal state icon.
        ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
        (setq doom-modeline-modal-icon t)

        ;; Whether display the modern icons for modals.
        (setq doom-modeline-modal-modern-icon t)

        ;; When non-nil, always show the register name when recording an evil macro.
        (setq doom-modeline-always-show-macro-register nil)

        ;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
        (setq doom-modeline-mu4e t)
        ;; also enable the start of mu4e-alert
        ;; (mu4e-alert-enable-mode-line-display)

        ;; Whether display the gnus notifications.
        (setq doom-modeline-gnus t)

        ;; Whether gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
        (setq doom-modeline-gnus-timer 2)

        ;; Wheter groups should be excludede when gnus automatically being updated.
        (setq doom-modeline-gnus-excluded-groups '("dummy.group"))

        ;; Whether display the IRC notifications. It requires `circe' or `erc' package.
        (setq doom-modeline-irc t)

        ;; Function to stylize the irc buffer names.
        (setq doom-modeline-irc-stylize 'identity)

        ;; Whether display the battery status. It respects `display-battery-mode'.
        (setq doom-modeline-battery t)

        ;; Whether display the time. It respects `display-time-mode'.
        (setq doom-modeline-time t)

        ;; Whether display the misc segment on all mode lines.
        ;; If nil, display only if the mode line is active.
        (setq doom-modeline-display-misc-in-all-mode-lines t)

        ;; The function to handle `buffer-file-name'.
        (setq doom-modeline-buffer-file-name-function #'identity)

        ;; The function to handle `buffer-file-truename'.
        (setq doom-modeline-buffer-file-truename-function #'identity)

        ;; Whether display the environment version.
        (setq doom-modeline-env-version t)
        ;; Or for individual languages
        (setq doom-modeline-env-enable-python t)
        (setq doom-modeline-env-enable-ruby t)
        (setq doom-modeline-env-enable-perl t)
        (setq doom-modeline-env-enable-go t)
        (setq doom-modeline-env-enable-elixir t)
        (setq doom-modeline-env-enable-rust t)

        ;; Change the executables to use for the language version string
        (setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
        (setq doom-modeline-env-ruby-executable "ruby")
        (setq doom-modeline-env-perl-executable "perl")
        (setq doom-modeline-env-go-executable "go")
        (setq doom-modeline-env-elixir-executable "iex")
        (setq doom-modeline-env-rust-executable "rustc")

        ;; What to display as the version while a new one is being loaded
        (setq doom-modeline-env-load-string "...")

        ;; By default, almost all segments are displayed only in the active window. To
        ;; display such segments in all windows, specify e.g.
        (setq doom-modeline-always-visible-segments '(mu4e irc))

        ;; Hooks that run before/after the modeline version string is updated
        (setq doom-modeline-before-update-env-hook nil)
        (setq doom-modeline-after-update-env-hook nil)
  )

;; `Symbols/Tokens'
(use-package! symbol-overlay
  :bind (:map global-map
              ("M-i" . symbol-overlay-put)
              ("M-n" . symbol-overlay-switch-forward)
              ("M-p" . symbol-overlay-switch-backward))
  :hook (after-init . symbol-overlay-mode))

;; `Makefile'
;; command:
;;   makefile-executor-execute-target
;;   makefile-executor-execute-project-target
;;   makefile-executor-execute-last
(use-package! makefile-executor
  :config
  (add-hook 'makefile-mode-hook 'makefile-executor-mode))


;; `Error-Checking'
(use-package! flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; `Auto-Save'
(use-package super-save
  :ensure t
  :config
  (setq super-save-auto-save-when-idle t)
  (setq super-save-delete-trailing-whitespace t)
  (super-save-mode +1))

;; `Translation'
(use-package! bing-dict
  :config
  (setq bing-dict-vocabulary-save t)
  (setq bing-dict-vocabulary-file "~/vocabulary/vocabulary.org"))

;; command:
;;   gt-do-translate
(use-package! go-translate
  :config
  (setq gt-langs '(en zh))
  ;; chatgpt
  (setq gt-chatgpt-key (getenv "OPENAI_API_KEY"))
  (setq gt-chatgpt-host "https://api.vveai.com")
  (setq gt-chatgpt-model "gpt-3.5-turbo")
  (setq gt-chatgpt-temperature 0.7)
  ;; (setq gt-default-translator
  ;;       (gt-translator :taker (gt-taker :pick nil :prompt t)
  ;;                      :engines (gt-chatgpt-engine :stream t)
  ;;                      :render (gt-insert-render)))

  ;; require `plz.el' and `curl'
  (setq gt-default-http-client
        (lambda (host)
          (let ((proxy? (string-match-p "google\\|deepl\\|openai" host)))
            (if (require 'plz nil t)
                (if proxy?
                    (gt-plz-http-client :args '("--proxy" "socks5://127.0.0.1:7897"))
                  (gt-plz-http-client))
              (if proxy?
                  (gt-url-http-client :proxies '(("http" . "host:7897") ("https" . "host:7897")))
                (gt-url-http-client))))))

  (setq gt-default-translator
        (gt-translator
         :taker (list (gt-taker :pick nil :if 'selection)
                      (gt-taker :text 'paragraph :if '(Info-mode help-mode))
                      (gt-taker :text 'buffer :pick 'fresh-word :if 'read-only)
                      (gt-taker :text 'word))
         :engines (list (gt-youdao-dict-engine :if 'word)
                        (gt-youdao-suggest-engine :if 'word)
                        (gt-bing-engine :if 'word)
                        (gt-google-engine :if 'word)
                        ;; (gt-bing-engine :if '(and not-word parts))
                        (gt-bing-engine :if 'not-word))
         :render (list (gt-posframe-pop-render :if 'selection)
                       (gt-overlay-render :if 'read-only)
                       (gt-insert-render :if (lambda (translator) (member (buffer-name) '("COMMIT_EDITMSG"))))
                       (gt-alert-render :if '(and xxx-mode (or not-selection (and read-only parts))))
                       (gt-buffer-render))))

  ;; use `gt-do-setup' to change go-translate engines
  (setq gt-preset-translators
        `((ts-1 . ,(gt-translator
                    :taker (gt-taker :langs '(en zh) :text 'word)
                    :engines (gt-bing-engine)
                    :render (gt-overlay-render)))
          (ts-2 . ,(gt-translator
                    :taker (gt-taker :langs '(en zh) :text 'sentence)
                    :engines (gt-bing-engine)
                    :render (gt-insert-render)))
          (ts-3 . ,(gt-translator
                    :taker (gt-taker :langs '(en zh) :text 'buffer
                                     :pick 'word :pick-pred (lambda (w) (length> w 6)))
                    :engines (gt-google-engine)
                    :render (gt-overlay-render :type 'help-echo)))))

  (defun programming-using-ChatGPT ()
    (interactive)
    (let ((gt-chatgpt-system-prompt "You are programmer")
          (gt-chatgpt-user-prompt-template (lambda (text _)
                                             (read-string
                                              "Prompt: "
                                              (format "Generate Code: %s" text)))))
      (gt-start (gt-translator
                 ;; :engines (gt-chatgpt-engine :cache nil)
                 :engines (gt-chatgpt-engine :stream t)
                 :render (gt-insert-render)))))

  (defun lang-using-ChatGPT ()
    (interactive)
    (let ((gt-chatgpt-user-prompt-template
           (lambda (text lang)
             (format "Translate text to %s. Text is: \n%s"
                     (alist-get lang gt-lang-codes) text))
           ))
      (gt-start (gt-translator
                 ;; :engines (gt-chatgpt-engine :cache nil)
                 :engines (gt-chatgpt-engine :stream t)
                 :render (gt-buffer-render)))))

  (defun lang-en2zh-using-youdao ()
    "Translate en to zh at Minibuffer render gt-do-translate.
Default to translate at minibuffer."
    (interactive)
    (gt-start (gt-translator
               :taker (gt-taker :prompt t)
               :engines (gt-youdao-dict-engine)
               :render (gt-render)))))
