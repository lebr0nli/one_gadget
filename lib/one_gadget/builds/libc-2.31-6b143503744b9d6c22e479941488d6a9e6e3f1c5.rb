require 'one_gadget/gadget'
# https://gitlab.com/david942j/libcdb/blob/master/libc/libc6_2.31-0ubuntu9.8_i386/lib/i386-linux-gnu/libc-2.31.so
# 
# Intel 80386
# 
# GNU C Library (Ubuntu GLIBC 2.31-0ubuntu9.8) stable release version 2.31.
# Copyright (C) 2020 Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.
# There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.
# Compiled by GNU CC version 9.4.0.
# libc ABIs: UNIQUE IFUNC ABSOLUTE
# For bug reporting instructions, please see:
# <https://bugs.launchpad.net/ubuntu/+source/glibc/+bugs>.

build_id = File.basename(__FILE__, '.rb').split('-').last
OneGadget::Gadget.add(build_id, 826299,
                      constraints: ["ebx is the GOT address of libc", "writable: ebp-0x20", "[[ebp-0x2c]] == NULL || [ebp-0x2c] == NULL", "[esi] == NULL || esi == NULL"],
                      effect: "execve(\"/bin/sh\", [ebp-0x2c], esi)")
OneGadget::Gadget.add(build_id, 1329195,
                      constraints: ["ebp is the GOT address of libc", "eax == NULL"],
                      effect: "execl(\"/bin/sh\", eax)")
OneGadget::Gadget.add(build_id, 1329196,
                      constraints: ["ebp is the GOT address of libc", "[esp] == NULL"],
                      effect: "execl(\"/bin/sh\", [esp])")

