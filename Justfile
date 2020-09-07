vim:
  for file in schemes/*.yml; do cargo run $file base16-vim/templates/default.mustache > output/vim/`basename ${file%.yml}`.vim; done
