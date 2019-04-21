;; ========================================
;; ロードパスの追加
;; ========================================
;; load-pathを追加する関数を定義
;; サブディレクトリを追加するため
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;; ========================================
;; パッケージの読み込み
;; ========================================
(require 'package) ; package.elを有効化
;; パッケージリポジトリにMarmaladeとMELPAを追加
(add-to-list
 'package-archives
 '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/"))
(package-initialize) ; インストール済みのElispを読み込む

;; ========================================
;; テーマを変更
;; ========================================
(load-theme 'misterioso t)

;; ========================================
;; インデントにタブを使用しない
;; ========================================
(setq-default indent-tabs-mode nil)

;; ========================================
;; キーバインドの割り当て
;; ========================================
;; C-hをバックスペースにする
(define-key key-translation-map (kbd "C-h")(kbd "<DEL>"))
;; C-x ?をヘルプにする
(define-key global-map (kbd "C-x ?") 'help-command)
;; C-jでマークセット
(define-key global-map (kbd "C-j") 'set-mark-command)
;; 行の折り返し表示を切り替える
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
;; C-tでウィンドウ切替
(define-key global-map (kbd "C-t") 'other-window)
;; フルスクリーン化
(define-key global-map (kbd "M-RET") 'toggle-frame-fullscreen)

;; ========================================
;; 改行コードの表記
;; ========================================
(setq eol-mnemonic-dos       ":Dos")
(setq eol-mnemonic-mac       ":Mac")
(setq eol-mnemonic-unix      ":Unix")
(setq eol-mnemonic-undecided ":???")

;; ========================================
;; 起動メッセージの非表示
;; ========================================
(setq inhibit-startup-message t)

;; ========================================
;; カーソル
;; ========================================
;; カーソルの点滅(有効:1, 無効:0)
(blink-cursor-mode 0)
;; カーソルカラー変更
(add-to-list 'default-frame-alist '(cursor-color . "RoyalBlue1"))

;; ========================================
;; 行番号／カラム番号の表示
;; ========================================
;; モードラインにカラム番号を表示
(column-number-mode t)
;; モードラインの行番号を表示
;; (line-number-mode t)
;; 行番号の表示
(global-display-line-numbers-mode)

;; ========================================
;; リージョン内の行数と文字数表示
;; ========================================
(defun count-lines-and-chars ()
  (if mark-active
      (format "[%3d,%4d]"
	      (count-lines (region-beginning) (region-end))
	      (- (region-end) (region-beginning)))
    ""))
(setq-default mode-line-format
              (add-to-list 'mode-line-format
                           '(:eval (count-lines-and-chars))))

;; ========================================
;; モードラインに各種情報を表示
;; ========================================
;; 時間表示(曜日・月・日表示)
(setq display-time-day-and-date t)
(display-time-mode t)

;; ========================================
;; タイトルバー
;; ========================================
;; タイトルバーにファイルのフルパスを表示
;; (setq frame-title-format "%f")
;; タイトルバーにemacsのversionを表示
(setq frame-title-format
      '("emacs " emacs-version (buffer-file-name " - %f")))

;; ========================================
;; フェイスの表示・装飾
;; ========================================
;; リージョンの背景色を変更
(set-face-background 'region "darkgreen")

;; ========================================
;; ハイライト
;; ========================================
;; paren-mode: 対応する括弧を強調して表示
(setq show-paren-delay 0) ; 表示までの秒数。初期値0.125
(show-paren-mode t) ; 有効化

;; ========================================
;; バックアップ
;; ========================================
;; バックアップとオートセーブファイルを
;; ~/.emacs.d/backups/に集める
(add-to-list 'backup-directory-alist
	     (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
;; オートセーブファイル作成
      `((".*",(expand-file-name "~/.emacs.d/backups/") t)))
;; オートセーブファイル作成までの秒間隔
(setq auto-save-timeout 30)
;; オートセーブファイル作成までのタイプ間隔
(setq auto-save-interval 60)

;; ========================================
;; isearch
;; ========================================
;; 大文字と小文字を区別しないでサーチ(有効:t, 無効:nil)
(setq-default case-fold-search nil)
;; C-eで検索文字列を編集
(define-key isearch-mode-map (kbd "C-e") 'isearch-edit-string)
;; Tabで検索文字列を補完
(define-key isearch-mode-map (kbd "TAB") 'isearch-yank-word)

;; ========================================
;; auto complete
;; ========================================
;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil))

;; ========================================
;; helm
;; ========================================
(require 'helm)
(require 'helm-config)
(helm-mode 1)
;; M-yで過去の履歴から貼り付け可能にする
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
;; C-x C-fをhelm-find-filesに変更
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
;; C-x bでhelm-miniを表示
(define-key global-map (kbd "C-x b") 'helm-mini)
;; 補完をtabでできるようにする
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
;; action候補の表示
(define-key helm-map (kbd "C-z") 'helm-select-action)
;; C-jでマークセット
(define-key helm-map (kbd "C-j") 'helm-toggle-visible-mark)

;; ========================================
;; helm-descbinds
;; ----------------------------------------
;; helpの見た目をhelm風に変更
;; ========================================
(require 'helm-descbinds)
(helm-descbinds-mode)

;; ========================================
;; color-moccur
;; ========================================
(when (require 'color-moccur nil t)
  ;; M-oにoccur-by-moccurを割り当て
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りでAND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$"))

;; ========================================
;; moccur-edit
;; ----------------------------------------
;; occur起動中にrで編集モードにする
;; ========================================
(require 'moccur-edit nil t)
;; moccur-edit-finish-editと同時にファイルを保存
(defadvice moccur-edit-change-file
    (after save-after-moccur-edit-buffer activate)
  (save-buffer))

;; ========================================
;; magit
;; ========================================
;; C-x mでmagit起動
(define-key global-map (kbd "C-x m") 'magit-status)

;; ========================================
;; wgrep
;; ----------------------------------------
;; grep中にC-c C-pで編集モードにする
;; ========================================
(require 'wgrep nil t)

;; ========================================
;; undohist
;; ----------------------------------------
;; undoの履歴を保存
;; ========================================
(when (require 'undohist nil t)
  (undohist-initialize))

;; ========================================
;; undo-tree
;; ----------------------------------------
;; 樹形図上でアンドゥ可能にする
;; ========================================
(when (require 'undo-tree nil t)
  (define-key global-map (kbd "C-'") 'undo-tree-redo)
  (global-undo-tree-mode))

;; ========================================
;; スクロール
;; ========================================
;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 5
      scroll-step 1)
(setq comint-scroll-show-maximum-output t)
;; スクロール時のカーソル位置の維持
(setq scroll-preserve-screen-position t)
;; ホイールでスクロールする行数を設定
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; ========================================
;; 閉じ括弧の自動挿入
;; ========================================
(electric-pair-mode t)

;; ========================================
;; python-mode
;; ----------------------------------------
;; C-c C-vでコードチェック
;; ========================================
(setq python-check-command "pep8")

;; ========================================
;; Flycheck
;; ----------------------------------------
;; 自動コードチェック
;; ========================================
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (with-eval-after-load 'flycheck
;;   (flycheck-pos-tip-mode))

;; ========================================
;; org
;; ----------------------------------------
;; メモ書き・ToDo管理
;; ========================================
(add-hook 'org-mode-hook 'howm-mode)
(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
(global-unset-key (kbd "C-x ,"))
(setq howm-prefix (kbd "C-x ,"))
(eval-after-load "howm-mode"
  '(progn
    (define-key howm-mode-map (kbd "C-c C-c") nil)))
(setq howm-use-color nil)

;; ========================================
;; howm
;; ----------------------------------------
;; メモ書き・ToDo管理
;; ========================================
;; howmメモ保存箇所
(setq howm-directory (concat user-emacs-directory "howm"))
;; howm-menuの言語設定
(setq howm-menu-lang 'ja)
;; howmメモを1日1ファイルにする
(setq howm-file-name-format "%Y/%m/%Y-%m-%d.howm")
;; howm-modeを読み込む
(when (require 'howm-mode nil t)
  ;; C-c, ,でhowm-menuを起動
  (define-key global-map (kbd "C-c ,,") 'howm-menu))
;; howmメモを保存と同時に閉じる
(defun howm-save-buffer-and-kill ()
  "howmメモを保存と同時に閉じます。"
  (interactive)
  (when (and (buffer-file-name)
             (string-match "\\.howm" (buffer-file-name)))
    (save-buffer)
    (kill-buffer nil)))
;; C-c C-cでメモの保存と同時にバッファを閉じる
(define-key howm-mode-map (kbd "C-c C-c") 'howm-save-buffer-and-kill)

;; ========================================
;; elscreen
;; ========================================
;; プレフィクスキーはC-z
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)
;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)
;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dired(%s)" dired-directory)))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Info(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "ERChat")
        ("^liece-" . "Liece")
        ("^lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]shell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "OnlineDict")
        ("*WL:Message*" . "Wanderlust")))

;; ========================================
;; helm-gtags
;; ========================================
(require 'helm-gtags)
(helm-gtags-mode t)
;; バッファの保存に連動してタグを自動更新
(setq helm-gtags-auto-update t)

(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             ;; 文脈から判断してジャンプ
             (local-set-key (kbd "M-.") 'helm-gtags-dwim)
             ;; 定義元へ
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             ;; 参照元へ
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             ;; 変数の定義元/参照先へ
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)))

(add-hook 'python-mode-hook 'helm-gtags-mode)
(add-hook 'php-mode-hook 'helm-gtags-mode)

;; ========================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-gtags elscreen howm wgrep undohist undo-tree quickrun moccur-edit magit helm-descbinds helm-c-moccur flycheck-pos-tip auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




