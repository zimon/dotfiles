
for f in ~/.zsh/*(on); do
    source $f;
done

autoload -U compinit
compinit
