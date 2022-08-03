packer {
  required_version = ">= 1.8.2"
}

locals {
  source   = "hashicorp/bionic64"
  provider = "virtualbox"
}


source "vagrant" "workstation" {
  communicator = "ssh"
  source_path  = "${local.source}"
  provider     = "${local.provider}"
  add_force    = true
  add_clean    = true
  checksum     = "93fcc9e17f4c67bcb934c1609c9353906bd2db5bf87e1e556049c4704bab0925"
}

build {
  sources = ["source.vagrant.workstation"]
  provisioner "shell" {
    inline_shebang = "/bin/bash -xe"
    inline = [
      "sudo -H apt-get update -y",
      "sudo -H apt-get upgrade -y",
      "sudo -H apt-get install python3.7 python3.8 python3-pip -y",
      "sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1",
      "python3.8 -m pip install --upgrade pip setuptools wheel",
      "python3.8 -m pip install --user ansible",
      "sudo -H apt-get autoremove",
      "sudo -H apt-get autoremove --purge",
      "sudo -H apt-get clean",
    ]
  }
}
