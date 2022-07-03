# compile linux kernel to .deb package

# copy the current configuration file
cp /boot/config-$(uname -r) .config
# customize kernel config (optional)
make menuconfig

# To solve the key signing issue: comment out the "Certificates for signature
# checking" options in .config.  Then during the compilation, answer nothing
# when it asks for keys so that it will generate one for one time use.  Answers
# N to other questions.
# ref: https://unix.stackexchange.com/questions/293642/attempting-to-compile-kernel-yields-a-certification-error/649484#649484

# Use bindeb-pkg to do incremental compilation.  But note that this could lead
# to unbootable image.  If that happens, you should fall back to `deb-pkg`.
make bindeb-pkg -j 10


# the .confg works looks like:
# ========================================
#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking
# ========================================


# If there's Error about pahole such as:
# BTF: .tmp_vmlinux.btf: pahole (pahole) is not available
sudo apt install dwarves

The output (.deb) will be in the *parent*(../) folder!
