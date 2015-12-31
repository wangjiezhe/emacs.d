;;; Configuration for ag

;;; enable highlight in results
(setq ag-highlight-search t)

;;; reuse the existing search results buffer or dired results buffer,
;;; rather than creating one buffer per unique search
(setq ag-reuse-buffers t)

;;; open search results in the same window, hiding the results buffer
;;; FIXME: I cannot find the effect
(setq ag-reuse-window t)

(provide 'rc-ag)
