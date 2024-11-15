# Kernel Boot Issues

These instructions assume you are unable to boot a new kernel version but have been able to boot into an older version.

## Troubleshooting Steps

Try temporarily editing the grub config on the broken kernel (Hold shift while booting, press e on the kernel in question) by replacing `splash` and `quiet` with `nomodeset`. This disables some graphics, making it possible to see console output during the boot process. You should now be able to see what the error actually is when booting the broken kernel.

### cannot find libsystemd-core-*

If the libsystem-core couldn't be found (following a kernel panic) boot into your older working Kernel and run `sudo dracut --rebuild-all --force` and try the new kernel again.

## Find installed kernels

A list of available kernels can be found by checking `/boot`:

```shell
ls /boot/vmlinuz-*
```

In general `uname -r` will be used in this document to automatically insert the currently booted kernel, but any other kernel can be used as well

## Locking Kernel to current version

Install `versionlock`:

```shell
sudo dnf install dnf-plugins-extras-versionlock
```

This package allows locking the kernel version we booted into to prevent it being uninstalled when upgrading.

Lock the kernel version and set it as default with `grubby`:

```shell
sudo dnf versionlock add kernel-$(uname -r)
sudo grubby --set-default=/boot/vmlinuz-$(uname -r)
```

You will now by default boot into the kernel you are currently booted into.

## Updating

When installing system upgrades with dnf you may want to confirm with grubby that your default kernel is still set (or the newly installed kernel is now set if you want to test that right now):

```shell
sudo grubby --default-kernel
```

Tip: You can use `versionlock list` to confirm which kernel your old working one was.

## Releasing the lock

When you receive a new kernel version via updates try booting into that one. If it works set that as new the default and remove the version lock on the old kernel with:

```shell
sudo dnf versionlock clear
```