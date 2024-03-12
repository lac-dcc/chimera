
// This module receives 28 MHz as input clock
// and makes strobes for all clocked parts

// clk  |—__——__——__——__—|  period = 28    duty = 50%    phase = 0
// cnt  |< 0>< 1>< 2>< 3>|
// f0   |————____————____|  period = 14    duty = 50%    phase = 0
// f1   |____————____————|  period = 14    duty = 50%    phase = 180
// h0   |————————________|  period = 7    duty = 50%    phase = 0
// h1   |________————————|  period = 7    duty = 50%    phase = 180
// c0   |————____________|  period = 7    duty = 25%    phase = 0
// c1   |____————________|  period = 7    duty = 25%    phase = 90
// c2   |________————____|  period = 7    duty = 25%    phase = 180
// c3   |____________————|  period = 7    duty = 25%    phase = 270

`include "tune.v"

module clock
(
  input wire clk,
  input wire [1:0] ay_mod,

  output wire f0, f1,
  output wire h0, h1,
  output wire c0, c1, c2, c3,
  output wire ay_clk
);

  reg [1:0] f = 'b01;
  reg [1:0] h = 'b01;
  reg [3:0] c = 'b0001;

  always @(posedge clk)
  begin
    f <= ~f;
    if (f[1]) h <= ~h;
    c <= {c[2:0], c[3]};
  end

  assign f0 = f[0];
  assign f1 = f[1];
  assign h0 = h[0];
  assign h1 = h[1];
  assign c0 = c[0];
  assign c1 = c[1];
  assign c2 = c[2];
  assign c3 = c[3];

// AY clock generator
  // ay_mod - clock selection for AY, MHz: 00 - 1.75 / 01 - 1.7733 / 10 - 3.5 / 11 - 3.546
  reg [7:0] skip_cnt = 0;
  reg [3:0] ay_cnt = 0;
  assign ay_clk = ay_mod[1] ? ay_cnt[2] : ay_cnt[3];

  always @(posedge clk)
  begin
    skip_cnt <= skip_cnt[7] ? 8'd73 : skip_cnt - 8'd1;
    ay_cnt <= ay_cnt + (skip_cnt[7] & ay_mod[0] ? 4'd2 : 4'd1);
  end

endmodule
