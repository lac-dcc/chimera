// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ns // timescale for following modules

// TODO: This one does not follow ASIC RAM behavior wrt read on CS not selected

module key_ram (
   clk,
   we,
   waddr,
   din,
   raddr,
   dout
   );

parameter UNROLL = 1;

input   clk;
input   we;
input   [4:0]   waddr;
input   [127:0] din;
input   [4:0]   raddr;
output  [128*UNROLL-1:0] dout;

reg     [127:0] ram [19 : 0];
reg     [128*UNROLL-1:0] q;
reg     [4:0] raddr_reg, raddr_reg0;

always @(posedge clk) begin
  if (we)
    ram[waddr] <= din;
  raddr_reg0 <= raddr;
  raddr_reg <= raddr_reg0;
  end

wire EO = raddr_reg[0];
always @(*)
  if (UNROLL == 1)
    q = ram[raddr_reg];

  else if (UNROLL == 2)
    q = {ram[raddr_reg | 2], ram[raddr_reg]};

  else if (UNROLL == 3)
    case(raddr[4:1])
    3       : q = {ram[{4'd5, EO}], ram[{4'd4, EO}], ram[{4'd3, EO}]};
    6       : q = {ram[{4'd8, EO}], ram[{4'd7, EO}], ram[{4'd6, EO}]};
    9       : q = {ram[{4'd2, EO}], ram[{4'd1, EO}], ram[{4'd9, EO}]};
    default : q = {ram[{4'd2, EO}], ram[{4'd1, EO}], ram[{4'd0, EO}]};
    endcase

  else if (UNROLL == 4)
    case(raddr[4:1])
    4       : q = {ram[{4'd7, EO}], ram[{4'd6, EO}], ram[{4'd5, EO}], ram[{4'd4, EO}]};
    8       : q = {ram[{4'd3, EO}], ram[{4'd2, EO}], ram[{4'd9, EO}], ram[{4'd8, EO}]};
    default : q = {ram[{4'd3, EO}], ram[{4'd2, EO}], ram[{4'd1, EO}], ram[{4'd0, EO}]};
    endcase

  else if (UNROLL == 5)
    case(raddr[4:1])
    5       : q = {ram[{4'd9, EO}], ram[{4'd8, EO}], ram[{4'd7, EO}], ram[{4'd6, EO}], ram[{4'd5, EO}]};
    default : q = {ram[{4'd4, EO}], ram[{4'd3, EO}], ram[{4'd2, EO}], ram[{4'd1, EO}], ram[{4'd0, EO}]};
    endcase

assign dout = q;

endmodule
