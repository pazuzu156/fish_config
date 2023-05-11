function vksetup -d 'Setup vkd3d and dxvk on a wine prefix'
  argparse -n vksetup 'p/prefix' -- $argv

  if set -q _flag_p
    WINEPREFIX=$argv setup_dxvk install --symlink
    WINEPREFIX=$argv setup_vkd3d_proton install --symlink
  else
    echo 'You need to set the wine prefix with -p'
  end
end
