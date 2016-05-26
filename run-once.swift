#!/usr/bin/env swift

import Darwin.C

if let cmd = Process.arguments.first {
  unlink(cmd)
}

