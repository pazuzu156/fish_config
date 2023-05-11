function vkremove -d 'Remove vkd3d and dxvk from a wine prefix'
  argparse -n vksetup 'p/prefix' -- $argv

  if set -q _flag_p
    WINEPREFIX=$argv setup_dxvk uninstall --symlink
    WINEPREFIX=$argv setup_dxvk_nvapi uninstall --symlink
    WINEPREFIX=$argv setup_vkd3d_proton uninstall --symlink
  else
    echo 'You need to set the wine prefix with -p'
  end
end