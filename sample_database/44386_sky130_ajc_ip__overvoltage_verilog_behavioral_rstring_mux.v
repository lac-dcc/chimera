// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__overvoltage
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Resistor string and analog mux model
//############################################################################

module rstring_mux(
//INPUT
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input logic ena,
input logic [15:0] otrip_decoded,
//OUTPUTS
output real vin
);

`define UNIT_R 25e3

real vtrip_15;
real vtrip_14;
real vtrip_13;
real vtrip_12;
real vtrip_11;
real vtrip_10;
real vtrip_9;
real vtrip_8;
real vtrip_7;
real vtrip_6;
real vtrip_5;
real vtrip_4;
real vtrip_3;
real vtrip_2;
real vtrip_1;
real vtrip_0;

assign vtrip_0  = ena ? avdd * (`UNIT_R*15 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_1  = ena ? avdd * (`UNIT_R*14 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_2  = ena ? avdd * (`UNIT_R*13 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_3  = ena ? avdd * (`UNIT_R*12 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_4  = ena ? avdd * (`UNIT_R*11 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_5  = ena ? avdd * (`UNIT_R*10 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_6  = ena ? avdd * (`UNIT_R*9 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_7  = ena ? avdd * (`UNIT_R*8 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_8  = ena ? avdd * (`UNIT_R*7 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_9  = ena ? avdd * (`UNIT_R*6 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_10 = ena ? avdd * (`UNIT_R*5 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_11 = ena ? avdd * (`UNIT_R*4 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_12 = ena ? avdd * (`UNIT_R*3 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_13 = ena ? avdd * (`UNIT_R*2 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_14 = ena ? avdd * (`UNIT_R*1 + `UNIT_R*23) / (`UNIT_R*104) : 0;
assign vtrip_15 = ena ? avdd * (`UNIT_R*0 + `UNIT_R*23) / (`UNIT_R*104) : 0;

  always @ (vtrip_15, vtrip_14, vtrip_13, vtrip_12, vtrip_11, vtrip_10, vtrip_9, vtrip_8, vtrip_7, vtrip_6, vtrip_5, vtrip_4, vtrip_3, vtrip_2, vtrip_1, vtrip_0, otrip_decoded) begin
    case (otrip_decoded)
      16'b1000000000000000: vin = vtrip_15;
      16'b0100000000000000: vin = vtrip_14;
      16'b0010000000000000: vin = vtrip_13;
      16'b0001000000000000: vin = vtrip_12;
      16'b0000100000000000: vin = vtrip_11;
      16'b0000010000000000: vin = vtrip_10;
      16'b0000001000000000: vin = vtrip_9;
      16'b0000000100000000: vin = vtrip_8;
      16'b0000000010000000: vin = vtrip_7;
      16'b0000000001000000: vin = vtrip_6;
      16'b0000000000100000: vin = vtrip_5;
      16'b0000000000010000: vin = vtrip_4;
      16'b0000000000001000: vin = vtrip_3;
      16'b0000000000000100: vin = vtrip_2;
      16'b0000000000000010: vin = vtrip_1;
      16'b0000000000000001: vin = vtrip_0;
      default: vin <= 0;
    endcase
  end

endmodule
