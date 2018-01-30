# -*- coding: utf-8 -*-
import subprocess

SHELLSCRIPT = "openfoam_run.sh"
PULL_COMMAND = "singularity pull --name openfoam4.simg shub://TakahisaShiratori/openfoam:4"

xVelocityMin       = 1
xVelocityMax       = 20
xVelocityIncrement = 1

yVelocityMin       = 0
yVelocityMax       = 10
yVelocityIncrement = 2

zVelocityMin       = 0
zVelocityMax       = 10
zVelocityIncrement = 2

if __name__ == "__main__":
  print(PULL_COMMAND)
  subprocess.call(PULL_COMMAND.strip().split(" "))

  xVelocity = xVelocityMin
  while True:
    yVelocity = yVelocityMin
    while True:
      zVelocity = zVelocityMin
      while True:
        QSUB_COMMAND = "qsub %s %f %f %f"%(SHELLSCRIPT, xVelocity, yVelocity, zVelocity)
        print(QSUB_COMMAND)
        subprocess.call(QSUB_COMMAND.strip().split(" "))

        zVelocity += zVelocityIncrement
        if zVelocity > zVelocityMax:
          break

      yVelocity += yVelocityIncrement
      if yVelocity > yVelocityMax:
        break

    xVelocity += xVelocityIncrement
    if xVelocity > xVelocityMax:
      break

  print("All jobs have been submitted.")
  subprocess.call("qstat")
