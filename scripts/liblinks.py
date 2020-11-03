#!/bin/python

# Use this python script to update your Windows libraries in the toolchain

import glob, os
from shutil import copyfile

def copylibs(wildcard):
   for file in glob.glob("usr/lib/*.so.*"):
      parts = file.split(".")
      for i in range(1, len(parts)):
         if not unicode(parts[len(parts) - i]).isnumeric():
            break
         libraryName = ".".join(parts[:-i])
         if not os.path.isfile(libraryName): 
            print("Copying " + file + " -> " + libraryName)
            # copyfile(file, libraryName)

for wildcard in ["usr/lib/*.so.*", "lib/*.so.*", "usr/lib/*.a.*", "lib/*.a.*"]:
   copylibs(wildcard)