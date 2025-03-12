// Seed: 4204937848
module module_0 (
    output supply1 id_0,
    output uwire id_1,
    input wor id_2,
    input wand id_3,
    output wor id_4
);
endmodule
module module_1 (
    input  tri0  id_0,
    input  wor   id_1,
    output tri   id_2,
    input  tri   id_3,
    output wor   id_4,
    input  uwire id_5
);
  assign id_4 = id_0 ^ id_3;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_0,
      id_1,
      id_2
  );
endmodule
module module_2 (
    output tri0 id_0,
    output tri0 id_1,
    output tri id_2,
    input uwire id_3,
    input tri id_4,
    input wire id_5,
    input uwire id_6,
    output supply1 id_7,
    input tri0 id_8,
    output wor id_9,
    output wand id_10,
    input tri0 id_11,
    input tri id_12,
    output uwire id_13,
    input uwire id_14,
    output logic id_15
);
  always @(posedge 1) id_15 = id_3;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_14,
      id_5,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
