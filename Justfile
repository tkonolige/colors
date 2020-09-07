vim:
  for file in schemes/*.yml; do cargo run $file templates/vim.mustache > output/vim/`basename ${file%.yml}`.vim; done

iterm:
  for file in schemes/*.yml; do cargo run $file templates/iterm2.mustache > output/itermcolors/`basename ${file%.yml}`.itermcolors; done
