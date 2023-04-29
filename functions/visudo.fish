function visudo -d 'Edit visudo'
  # set a default editor if $EDITOR is empty
  test -z "$EDITOR"
    and set EDITOR /bin/nano

  command sudo EDITOR=$EDITOR visudo
end
