// Seed: 572511496
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input uwire id_2,
    input uwire id_3,
    output tri1 id_4,
    output wor id_5,
    input tri0 id_6,
    input supply0 id_7,
    output wire id_8,
    input supply1 id_9,
    output wire id_10,
    output wand id_11,
    input tri1 id_12,
    output wire id_13,
    input uwire id_14,
    output wire id_15,
    input wor id_16,
    input tri id_17,
    input uwire id_18,
    output tri1 id_19,
    input wand id_20,
    input uwire id_21,
    output supply1 id_22,
    input tri id_23
);
  logic id_25;
  wire  id_26;
  assign {1, id_17, id_23, id_20 & 1} = id_25;
endmodule
module module_1 #(
    parameter id_4 = 32'd72
) (
    input  wor   id_0,
    output wor   id_1,
    output logic id_2,
    output tri0  id_3,
    input  tri   _id_4,
    input  tri   id_5,
    input  wire  id_6,
    input  wor   id_7
);
  reg [id_4 : -1] id_9;
  always @(negedge id_9) id_9 = -1;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6,
      id_0,
      id_3,
      id_1,
      id_6,
      id_7,
      id_3,
      id_0,
      id_3,
      id_1,
      id_6,
      id_3,
      id_5,
      id_3,
      id_0,
      id_0,
      id_6,
      id_3,
      id_5,
      id_7,
      id_1,
      id_5
  );
  assign modCall_1.id_7 = 0;
  initial assume (-1);
  wire id_10;
  wire id_11;
  always for (id_1 = id_0; id_11; id_2 = id_5) id_9 <= id_11;
endmodule
