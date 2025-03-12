// Seed: 31245288
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input tri id_2,
    input wire id_3,
    output tri1 id_4,
    output tri1 id_5,
    input supply1 id_6,
    output wand id_7,
    input wire id_8,
    input uwire id_9,
    output wor id_10,
    output tri id_11,
    input tri1 id_12,
    input supply1 id_13
);
endmodule
module module_1 #(
    parameter id_15 = 32'd38
) (
    input  tri   id_0,
    input  wand  id_1,
    input  uwire id_2,
    input  wor   id_3,
    output wire  id_4,
    output wor   id_5,
    output logic id_6,
    input  wand  id_7,
    output logic id_8,
    input  uwire id_9,
    input  wire  id_10,
    input  uwire id_11 [1  -  id_15 : 1],
    input  tri1  id_12,
    output wand  id_13,
    input  tri0  id_14,
    input  wand  _id_15,
    input  wand  id_16,
    input  tri   id_17
);
  localparam id_19 = 1;
  initial id_8 <= id_2;
  always #(1);
  module_0 modCall_1 (
      id_4,
      id_17,
      id_0,
      id_2,
      id_13,
      id_13,
      id_3,
      id_5,
      id_11,
      id_10,
      id_5,
      id_4,
      id_16,
      id_12
  );
  assign modCall_1.id_3 = 0;
  initial @(negedge id_0) id_6 = id_9;
endmodule
