// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__por
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: RC oscillator model
//############################################################################

module rc_osc(
input logic osc_ena,
input logic dvdd,
input logic dvss,
output logic osc_ck
);

always #12195.2 osc_ck = osc_ena ? ~osc_ck : 0;

initial begin
  osc_ck <= 0;
end
endmodule
