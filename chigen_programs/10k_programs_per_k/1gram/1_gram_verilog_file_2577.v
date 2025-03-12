// Seed: 3510990295
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
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd25
) (
    input  wand  _id_0,
    output tri1  id_1,
    output tri0  id_2,
    output tri0  id_3
    , id_14,
    input  tri0  id_4,
    input  wor   id_5,
    input  tri   id_6,
    input  tri0  id_7,
    input  wor   id_8,
    input  uwire id_9
    , id_15,
    input  wand  id_10,
    input  tri1  id_11,
    input  wire  id_12
);
  wire id_16;
  wire id_17, id_18;
  union packed {
    logic id_19;
    logic id_20;
    logic id_21;
    logic id_22;
  } id_23;
  logic id_24[(  -1  )  &  1 : id_0] = !-1;
  module_0 modCall_1 (
      id_22,
      id_24,
      id_20,
      id_22,
      id_21,
      id_21,
      id_15,
      id_20,
      id_20,
      id_22,
      id_16,
      id_23,
      id_15,
      id_16,
      id_20
  );
  initial $clog2(86);
  ;
  wire id_25;
  always disable id_26;
endmodule
