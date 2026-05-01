let
  marques = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP0tAycY/GdCAVHvOfakuy3kS+SFdfb1m239FWf3s720 gfelicianomarques@gmail.com";
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID9YtKxJEmXXvIoWaPqMr06z1LYMuRWt9+Uu4LQEQoFV root@nixos";
in
{
  "teste.age".publicKeys = [ marques desktop ];
}
