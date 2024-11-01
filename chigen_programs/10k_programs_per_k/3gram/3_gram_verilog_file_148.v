// Seed: 2342206170
module module_0;
  reg id_2;
  always_latch @(posedge id_1) begin
    id_1 <= id_1 && id_2;
  end
  assign id_1 = 1;
  always @(posedge 1'd0) begin
    id_1 <= 1;
  end
  initial id_2 = #1 id_2 - 1'b0;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_14;
  wand id_15 = 1, id_16;
  module_0();
  wire id_17;
  xnor (id_1, id_10, id_12, id_14, id_15, id_16, id_2, id_3, id_6, id_7, id_8, id_9);
endmodule
