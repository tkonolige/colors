vim:
  for file in schemes/*.yml; do cargo run $file templates/vim.mustache > output/vim/`basename ${file%.yml}`.vim; done
