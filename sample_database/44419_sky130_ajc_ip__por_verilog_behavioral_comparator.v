// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__por
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Comparator model
//############################################################################

module comparator(
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input real vinp,
input real vinn,
input logic ena,
input real ibias,
output dout
);

assign dout = ena & (ibias > 200e-9) ? (vinp > vinn) ? 1 : 0 : 0;

endmodule
