(macro merge! [tbl1 tbl2]
  `(do
   (fn mrg# [x# y#]
     (local out# (vim.deepcopy x#))
     (each [k# v# (pairs (vim.deepcopy y#))]
       (if (= :table (type v#) (type (. out# k#)))
           (tset out# k# (mrg# (. out# k#) v#))
           (tset out# k# v#)))
     :return out#)
   (mrg# ,tbl1 ,tbl2)))
