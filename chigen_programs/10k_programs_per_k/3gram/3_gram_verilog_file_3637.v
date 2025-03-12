// Seed: 2693948759
module module_0 #(
    parameter id_8 = 32'd85
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  inout wire _id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire [{  -1  ,  id_8  } : 1] id_9;
  logic id_10 = -1;
endmodule
module module_1 (
    input  wire  id_0,
    input  wor   id_1,
    input  tri0  id_2,
    output tri   id_3,
    input  wor   id_4,
    input  wand  id_5,
    input  wand  id_6,
    output tri1  id_7,
    input  tri0  id_8,
    output logic id_9
);
  logic id_11;
  localparam id_12 = !1, id_13 = id_5;
  always #1 id_9 <= id_0;
  logic id_14 = id_0;
  wire  id_15;
  module_0 modCall_1 (
      id_14,
      id_12,
      id_12,
      id_14,
      id_11,
      id_12,
      id_15,
      id_13
  );
endmodule
