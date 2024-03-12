
// Pentevo project (c) NedoPC 2011
// integrates sound features: tapeout, beeper and covox

`include "tune.v"

// `define SDM    // uncommented - sigma-delta, commented - PWM

module sound
(
  input  wire       clk,

  input  wire [7:0] din,

  input  wire       beeper_wr,
  input  wire       covox_wr,

  input  wire       beeper_mux, // output either tape_out or beeper
  input  wire       tape_sound,
  input  wire       tape_in,

  output reg        sound_bit
);

  reg [7:0] val = 0;

// port writes
  always @(posedge clk)
    if (covox_wr)
      val <= din;
    else if (tape_sound)
      val <= tape_in ? 8'h7F : 8'h00;
    else if (beeper_wr)
      val <= (beeper_mux ? din[3] : din[4]) ? 8'hFF : 8'h00;

`ifdef SDM
// SD modulator
  reg [7:0] ctr = 0;

  wire gte = val >= ctr;

  always @(posedge clk)
  begin
    sound_bit <= gte;
    ctr <= {8{gte}} - val + ctr;
  end

`else
// PWM generator
  reg [8:0] ctr = 0;

  wire phase = ctr[8];
  wire [7:0] saw = ctr[7:0];

  always @(posedge clk)    // 28 MHz strobes, Fpwm = 54.7 kHz (two semi-periods)
  begin
    sound_bit <= ((phase ? saw : ~saw) < val);
    ctr <= ctr + 9'b1;
  end
`endif
endmodule

