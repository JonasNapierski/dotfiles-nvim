;; inherits: python
;; extends

((comment) @comment.note
  (#match? @comment.note "NOTE"))
((comment) @comment.warning
  (#match? @comment.warning "AAA"))
((comment) @comment.todo
  (#match? @comment.todo "TODO"))
((comment) @comment.error
  (#match? @comment.error "BUG"))

