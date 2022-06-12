;;; doom-rose-pine-theme.el --- A dark port of Rosé Pine theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: mvllow
;; Ported by: donniebreve
;; Keywords: custom themes, faces
;; Homepage: https://github.com/donniebreve/rose-pine-doom-emacs
;; Package-Requires: ((emacs "25.1") (cl-lib "0.5") (doom-themes "2.2.1"))
;;
;;; Commentary:
;;
;; Thanks to mvllow (https://github.com/rose-pine)
;; Thanks to hlissner (https://github.com/doomemacs/themes)
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-rose-pine-theme nil
  "Options for the `doom-rose-pine' theme."
  :group 'doom-themes)

(defcustom doom-rose-pine-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-rose-pine-theme
  :type 'boolean)

(defcustom doom-rose-pine-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-rose-pine-theme
  :type 'boolean)

(defcustom doom-rose-pine-brighter-text nil
  "If non-nil, default text will be brighter."
  :group 'doom-rose-pine-theme
  :type 'boolean)

(defcustom doom-rose-pine-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-rose-pine-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-rose-pine
  "A dark port of Rosé Pine theme"

  ;; Main theme colors
  (
    ;; name        default   256       16
    (base0      '("#191724" "#191724" "black"       ))
    (base1      '("#1f1d2e" "#1f1d2e" "brightblack" ))
    (base2      '("#26233a" "#26233a" "brightblack" ))
    (base3      '("#555169" "#555169" "brightblack" ))
    (base4      '("#6e6a86" "#6e6a86" "brightblack" ))
    (base5      '("#e0def4" "#e0def4" "brightblack" ))
    (base6      '("#f0f0f3" "#f0f0f3" "brightblack" ))
    (base7      '("#c5c3ce" "#c5c3ce" "brightblack" ))
    (base8      '("#e2e1e7" "#e2e1e7" "white"       ))
    (base9      '("#eb6f92" "#eb6f92" "red"         ))
    (baseA      '("#f6c177" "#f6c177" "white"       ))
    (baseB      '("#ebbcba" "#ebbcba" "white"       ))
    (baseC      '("#31748f" "#31748f" "white"       ))
    (baseD      '("#9ccfd8" "#9ccfd8" "white"       ))
    (baseE      '("#c4a7e7" "#c4a7e7" "white"       ))
    (baseF      '("#e5e5e5" "#e5e5e5" "grey"        ))

    ;; Variables required by doom theme
    ;; These are required by doom theme and used in various places
    (bg              base0)
    (fg              (if doom-rose-pine-brighter-text base6 base5))
    ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
    ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
    ;; or region), especially when paired with the `doom-darken', `doom-lighten',
    ;; and `doom-blend' helper functions.
    (bg-alt          base1)
    (fg-alt          base6)
    (grey            baseF)
    (red             base9)
    (orange          baseA)
    (green           baseC)
    (teal            baseD)
    (yellow          baseB)
    (pink            baseB)
    (blue            baseC)
    (dark-blue       baseC)
    (magenta         baseE)
    (violet          baseE)
    (cyan            baseD)
    (dark-cyan       baseC)

    ;; Required face categories for syntax highlighting
    (highlight       base4)  ; cursor
    (selection       base0)  ; can't figure out where this is used
    (region          base2)  ; visual selection
    (vertical-bar    base1)  ; window split

    (comments        (if doom-rose-pine-brighter-comments base5 base4))
    (doc-comments    (if doom-rose-pine-brighter-comments base5 base4))

    (builtin         baseC)
    (constants       baseE)
    (functions       baseC)
    (keywords        baseC)
    (methods         baseD)
    (numbers         baseB)
    (operators       baseA)
    (strings         baseA)
    (type            baseB)
    (variables       baseE)

    (error           base9)
    (success         baseD)
    (warning         baseA)

    (vc-added        baseD)
    (vc-deleted      base9)
    (vc-modified     baseA)

    ;; Other categories
    ;; Modeline
    (modeline-bg                 (if doom-rose-pine-brighter-modeline base2 base1))
    (modeline-fg                 base5)
    (modeline-bg-alt             (if doom-rose-pine-brighter-modeline base3 base2))
    (modeline-fg-alt             base5) ; should this be darker or lighter?
    (modeline-bg-inactive        base0)
    (modeline-fg-inactive        base4)
    (modeline-bg-inactive-alt    base0)
    (modeline-fg-inactive-alt    base4)
    (modeline-pad
      (when doom-rose-pine-padded-modeline
        if (integerp doom-rose-pine-padded-modeline) doom-rose-pine-padded-modeline 4)))

  ;; Base theme face overrides
  (
    ;; Font
    ((font-lock-comment-face &override)
      :slant 'italic
      :background (if doom-rose-pine-dawn-brighter-comments (doom-blend teal base0 0.07)))
    ((font-lock-type-face &override) :slant 'italic)
    ((font-lock-builtin-face &override) :slant 'italic)
    ((font-lock-function-name-face &override) :foreground type)
    ((font-lock-keyword-face &override) :weight 'bold)
    ((font-lock-constant-face &override) :weight 'bold)

    ;; Highlight line
    (hl-line
       :background base1)

    ;; Line numbers
    ((line-number &override) :foreground base3)
    ((line-number-current-line &override) :foreground base5)

    ;; Mode line
    (mode-line
      :background modeline-bg
      :foreground modeline-fg
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg)))
    (mode-line-inactive
      :background modeline-bg-inactive
      :foreground modeline-fg-inactive
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive)))
    (mode-line-emphasis
      :foreground (if doom-rose-pine-dawn-brighter-modeline base5 base4))

    ;; Company
    (company-tooltip-selection :background blue :foreground base3)

    ;; CSS mode <built-in> / scss-mode
    (css-proprietary-property :foreground orange)
    (css-property             :foreground green)
    (css-selector             :foreground green)

    ;; Doom mode line
    (doom-modeline-bar :background green) ; The line to the left
    (doom-modeline-evil-emacs-state  :foreground magenta)  ; The dot color when in emacs mode
    (doom-modeline-evil-normal-state :foreground green)    ; The dot color when in normal mode
    (doom-modeline-evil-visual-state :foreground magenta)  ; The dot color when in visual mode
    (doom-modeline-evil-insert-state :foreground orange)   ; The dot color when in insert mode

    ;; Helm
    (helm-selection :foreground base0 :weight 'bold :background blue)

    ;; Ivy
    (ivy-current-match :background base2 :distant-foreground fg)
    (ivy-minibuffer-match-face-1 :foreground base4 :background nil :weight 'bold)
    (ivy-minibuffer-match-face-2 :foreground orange :background nil :weight 'bold)
    (ivy-minibuffer-match-face-3 :foreground magenta :background nil :weight 'bold)
    (ivy-minibuffer-match-face-4 :foreground pink :background nil :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground magenta :weight 'bold)
    (ivy-posframe :background modeline-bg-alt)

    ;; Markdown mode
    (markdown-markup-face :foreground base5)
    (markdown-header-face :inherit 'bold :foreground red)
    ((markdown-code-face &override) :background base1)

    ;; org <built-in>
    (org-block :background (doom-blend yellow bg 0.04) :extend t)
    (org-block-background :background (doom-blend yellow bg 0.04))
    (org-block-begin-line :background (doom-blend yellow bg 0.08) :extend t)
    (org-block-end-line :background (doom-blend yellow bg 0.08) :extend t)

    ;; Solaire mode line
    (solaire-mode-line-face
      :inherit 'mode-line
      :background modeline-bg-alt
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
    (solaire-mode-line-inactive-face
      :inherit 'mode-line-inactive
      :background modeline-bg-inactive-alt
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

    ;; Widget
    (widget-field :foreground fg :background base3)
    (widget-single-line-field :foreground fg :background base3)

    ;; Swiper
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)))

;;; doom-rose-pine-theme.el ends here
