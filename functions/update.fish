function update --description 'Perform a quick update'
  # update system
  yay --answerdiff None --answerupgrade Repo --answeredit None --answerclean All --batchinstall -Syu
  # upgrade flatpaks
  flatpak update --noninteractive
end