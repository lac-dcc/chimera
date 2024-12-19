// Seed: 746593448
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
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  inout wire id_23;
  inout wire id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2  = 1;
  assign id_13 = 1;
  wire id_24, id_25;
endmodule
module module_1 (
    output supply1 id_0,
    input uwire id_1,
    output tri0 id_2,
    output wand id_3,
    output supply0 id_4,
    output tri id_5,
    input logic id_6,
    input logic id_7
);
  id_9 :
  assert property (@(1'b0 or negedge 1) id_6)
  else begin : LABEL_0
    id_4 = 1;
  end
  logic id_10 = id_7;
  assign id_4 = 1;
  assign id_9 = 1;
  wire id_11;
  wand id_12;
  always id_10 <= id_6;
  assign id_12 = 1'd0;
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_13,
      id_12,
      id_11,
      id_12,
      id_11,
      id_12,
      id_11,
      id_11,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_12,
      id_13,
      id_11,
      id_11,
      id_13,
      id_12,
      id_11,
      id_12
  );
  wire id_14, id_15;
  final id_9 = 1;
endmodule
