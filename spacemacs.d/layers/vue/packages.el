(setq vue-packages
  '(
    flycheck
    smartparens
    (vue-mode :location (recipe
                         :fetcher github
                         :repo "codefalling/vue-mode"))
    ;; web-beautify
    web-mode
    ))

(defun vue/init-vue-mode ()
  (use-package vue-mode
    :config
    ;; 0, 1, or 2, representing (respectively) none, low, and high coloring
    (setq mmm-submode-decoration-level 0)))

(defun vue/post-init-flycheck ()
  (with-eval-after-load 'flycheck
    (dolist (checker '(javascript-eslint javascript-standard))
      (flycheck-add-mode checker 'vue-mode)))
  (add-hook 'vue-mode-hook #'spacemacs//react-use-eslint-from-node-modules)
  (spacemacs/enable-flycheck 'vue-mode))

(defun vue/post-init-smartparens ()
  (if dotspacemacs-smartparens-strict-mode
      (add-hook 'vue-mode-hook #'smartparens-strict-mode)
    (add-hook 'vue-mode-hook #'smartparens-mode)))

;; (defun vue/post-init-web-beautify ()
;;   (spacemacs/set-leader-keys-for-major-mode 'vue-mode  "=" 'web-beautify-js))

(defun vue/post-init-web-mode ()
  (use-package web-mode))
