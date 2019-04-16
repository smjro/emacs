
((digest . "d07083ce545accb8db57da666b697dfe") (undo-list nil (nil rear-nonsticky nil 8066 . 8067) (nil fontified nil 8038 . 8067) (nil fontified nil 8029 . 8038) (nil fontified nil 7998 . 8029) (nil fontified nil 7972 . 7998) (nil fontified nil 7969 . 7972) (nil fontified nil 7905 . 7969) (nil fontified nil 7896 . 7905) (nil fontified nil 7849 . 7896) (nil fontified nil 7846 . 7849) (nil fontified nil 7844 . 7846) (nil fontified nil 7840 . 7844) (nil fontified nil 7835 . 7840) (nil fontified nil 7824 . 7835) (nil fontified nil 7820 . 7824) (nil fontified nil 7800 . 7820) (nil fontified nil 7794 . 7800) (nil fontified nil 7769 . 7794) (nil fontified nil 7768 . 7769) (nil fontified nil 7763 . 7768) (nil fontified nil 7762 . 7763) (nil fontified nil 7745 . 7762) (nil fontified nil 7742 . 7745) (nil fontified nil 7738 . 7742) (nil fontified nil 7727 . 7738) (nil fontified nil 7719 . 7727) (nil fontified nil 7689 . 7719) (nil fontified nil 7669 . 7689) (nil fontified nil 7666 . 7669) (nil fontified nil 7656 . 7666) (nil fontified nil 7647 . 7656) (nil fontified nil 7645 . 7647) (nil fontified nil 7638 . 7645) (nil fontified nil 7636 . 7638) (nil fontified nil 7632 . 7636) (nil fontified nil 7631 . 7632) (nil fontified nil 7616 . 7631) (nil fontified nil 7613 . 7616) (nil fontified nil 7611 . 7613) (nil fontified nil 7590 . 7611) (nil fontified nil 7567 . 7590) (nil fontified nil 7563 . 7567) (nil fontified nil 7562 . 7563) (nil fontified nil 7544 . 7562) (nil fontified nil 7541 . 7544) (nil fontified nil 7520 . 7541) (nil fontified nil 7516 . 7520) (nil fontified nil 7515 . 7516) (nil fontified nil 7500 . 7515) (nil fontified nil 7497 . 7500) (nil fontified nil 7494 . 7497) (nil fontified nil 7488 . 7494) (nil fontified nil 7443 . 7488) (nil fontified nil 7439 . 7443) (nil fontified nil 7438 . 7439) (nil fontified nil 7427 . 7438) (nil fontified nil 7424 . 7427) (nil fontified nil 7383 . 7424) (nil fontified nil 7380 . 7383) (nil fontified nil 7368 . 7380) (nil fontified nil 7365 . 7368) (nil fontified nil 7324 . 7365) (nil fontified nil 7321 . 7324) (nil fontified nil 7316 . 7321) (nil fontified nil 7313 . 7316) (nil fontified nil 7272 . 7313) (nil fontified nil 7269 . 7272) (7269 . 8067) nil (7268 . 7270) nil ("
" . 6782) ("
" . 6782) nil (";; ========================================
;; howm
;; ----------------------------------------
;; メモ書き・ToDo管理
;; ========================================
;; howmメモ保存箇所
(setq howm-directory (concat user-emacs-directory \"howm\"))
;; howm-menuの言語設定
(setq howm-menu-lang 'ja)
;; howmメモを1日1ファイルにする
(setq howm-file-name-format \"%Y/%m/%Y-%m-%d.howm\")
;; howm-modeを読み込む
(when (require 'howm-mode nil t)
  ;; C-c, ,でhowm-menuを起動
  (define-key global-map (kbd \"C-c ,,\") 'howm-menu))
;; howmメモを保存と同時に閉じる
(defun howm-save-buffer-and-kill ()
  \"howmメモを保存と同時に閉じます。\"
  (interactive)
  (when (and (buffer-file-name)
             (string-match \"\\\\.howm\" (buffer-file-name)))
    (save-buffer)
    (kill-buffer nil)))
;; C-c C-cでメモの保存と同時にバッファを閉じる
(define-key howm-mode-map (kbd \"C-c C-c\") 'howm-save-buffer-and-kill)" . 6782) ((marker . 8067) . -798) ((marker . 6782) . -43) ((marker . 6782) . -43) ((marker . 6782) . -43) ((marker . 6782) . -43) ((marker) . -798) ((marker* . 8066) . 1) ((marker . 8067) . -798) ((marker* . 7998) . 69) ((marker . 7999) . -730) ((marker) . -798) 7580 (t 23734 22187 962814 345000) nil (7457 . 7458) nil ("
" . 7457) nil (7439 . 7440) nil ("
" . 7439) nil (7438 . 7439) (")" . -7438) (7438 . 7439) nil ("
" . 7439) nil ("             (howm-buffer-p))" . 7439) nil (7420 . 7436) ("buffer-fil" . -7420) 7430 nil (7420 . 7430) (7419 . 7421) ("(" . -7419) (7418 . 7420) nil (7410 . 7417) nil ("/" . -7410) ("/" . -7411) 7412 nil (7410 . 7412) (7409 . 7411) ("\"" . -7409) (7409 . 7410) ("\"" . -7409) (7409 . 7410) nil (7408 . 7409) nil (7396 . 7408) ("string-ma" . -7396) 7405 nil (7396 . 7405) (7395 . 7397) ("(" . -7395) (7395 . 7396) nil (7381 . 7395) nil undo-tree-canary))
