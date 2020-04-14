# Целевые платформы

* guest: гостевой режим, запуск как user-space приложения под любой распространенной ОС
  * Linux
  * Windows (не поддерживается)
* rumpkernel: запуск под виртуализацией
  * KVM
* bare metal: на реальном железе и эмуляторах
  * i386: qemu-system-i386
  * x86_64: qemu-system-x86_64
  * arm9: qemu-system-arm -M raspi2
