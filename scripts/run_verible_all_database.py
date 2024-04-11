import os
import subprocess

verible = "../../verible/bazel-bin/verilog/tools/syntax/verible-verilog-syntax"

for root, dirs, files in os.walk("../database"):
    for f in files:
        f =  os.path.join(root, f)
        command = verible + f" {f}"
        print("Running Command:", command )
        proc = subprocess.Popen(command, shell=True)