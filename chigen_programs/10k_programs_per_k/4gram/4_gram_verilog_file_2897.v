// Seed: 2475644588
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  assign module_1.id_20 = 0;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  localparam id_9 = 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd60
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout logic [7:0] id_14;
  output wire id_13;
  output logic [7:0] id_12;
  output wire id_11;
  input logic [7:0] id_10;
  output wire id_9;
  input wire _id_8;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_13,
      id_6,
      id_2,
      id_15,
      id_3,
      id_4
  );
  output wire id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  output wire id_4;
  inout wire id_3;
  inout uwire id_2;
  input wire id_1;
  assign id_14[id_8] = id_2;
  wire id_16;
  logic [-1 : -1] id_17 = 1;
  assign id_3 = id_1;
  logic id_18;
  ;
  assign id_12[-1] = -id_2;
  logic id_19 = id_14;
  assign id_5[-1'b0 : 1] = -1;
  bit   id_20;
  wire  id_21;
  logic id_22;
  assign id_2 = 1;
  wire id_23;
  always @(posedge id_10[-1], negedge 1) id_20 <= id_14;
endmodule
