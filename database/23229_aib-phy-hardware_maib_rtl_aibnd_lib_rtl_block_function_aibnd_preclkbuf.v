// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
// Library - aibnd_lib, Cell - aibnd_preclkbuf, View - schematic
// LAST TIME SAVED: Nov 27 15:01:54 2014
// NETLIST TIME: Dec 17 10:24:03 2014

module aibnd_preclkbuf ( clkout, vccl, vssl, clkin );

output  clkout;

inout  vccl, vssl;

input  clkin;

wire clkin, clkout; // Conversion Sript Generated



assign clkout = !clkin;

endmodule

