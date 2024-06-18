// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__por
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Resistor string with analog mux model
//############################################################################

module rstring_mux(
//INPUT
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input logic ena,
input logic [7:0] otrip_decoded,
//OUTPUTS
output real vin
);

`define UNIT_R 50e3

real vtrip_7;
real vtrip_6;
real vtrip_5;
real vtrip_4;
real vtrip_3;
real vtrip_2;
real vtrip_1;
real vtrip_0;

assign vtrip_0 = ena ? avdd * (`UNIT_R*7 + `UNIT_R*28) / (`UNIT_R*70) : avdd;
assign vtrip_1 = ena ? avdd * (`UNIT_R*6 + `UNIT_R*28) / (`UNIT_R*70) : avdd;
assign vtrip_2 = ena ? avdd * (`UNIT_R*5 + `UNIT_R*28) / (`UNIT_R*70) : avdd;
assign vtrip_3 = ena ? avdd * (`UNIT_R*4 + `UNIT_R*28) / (`UNIT_R*70) : avdd;
assign vtrip_4 = ena ? avdd * (`UNIT_R*3 + `UNIT_R*28) / (`UNIT_R*70) : avdd;
assign vtrip_5 = ena ? avdd * (`UNIT_R*2 + `UNIT_R*28) / (`UNIT_R*70) : avdd;
assign vtrip_6 = ena ? avdd * (`UNIT_R*1 + `UNIT_R*28) / (`UNIT_R*70) : avdd;
assign vtrip_7 = ena ? avdd * (`UNIT_R*0 + `UNIT_R*28) / (`UNIT_R*70) : avdd;

  always @ (vtrip_7, vtrip_6, vtrip_5, vtrip_4, vtrip_3, vtrip_2, vtrip_1, vtrip_0, otrip_decoded) begin
    case (otrip_decoded)
      8'b10000000: vin = vtrip_7;
      8'b01000000: vin = vtrip_6;
      8'b00100000: vin = vtrip_5;
      8'b00010000: vin = vtrip_4;
      8'b00001000: vin = vtrip_3;
      8'b00000100: vin = vtrip_2;
      8'b00000010: vin = vtrip_1;
      8'b00000001: vin = vtrip_0;
      default: vin = 0;
    endcase
  end

endmodule
