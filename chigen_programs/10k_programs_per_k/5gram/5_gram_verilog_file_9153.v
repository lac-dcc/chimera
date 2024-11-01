// Seed: 1961859487
module module_0 (
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
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always_latch disable id_17;
  wire id_18;
  always @(posedge 1'b0) begin
    disable id_19;
  end
  assign id_3 = (1 != 1);
  wire id_20;
  wire id_21;
  wire id_22;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0(
      id_4, id_4, id_4, id_4, id_4, id_4, id_2, id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_4
  );
  always_comb @(negedge 1'b0 or posedge 1) id_1 <= id_3;
endmodule
