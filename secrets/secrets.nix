let
  marques = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP0tAycY/GdCAVHvOfakuy3kS+SFdfb1m239FWf3s720 gfelicianomarques@gmail.com";
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoLvEXfrIitl7EOYnCE39cQnNU8B7ELvBc28LWSqjtL gfelicianomarques@gmail.com";
in
{
  "teste.age".publicKeys = [ marques desktop ];
}
