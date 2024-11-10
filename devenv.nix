{ pkgs, ... }:
{
  packages = [ pkgs.fnlfmt ];
  scripts.format-fennel.exec = ''
    fd .fnl | xargs -n 1 fnlfmt --fix
  '';
}
