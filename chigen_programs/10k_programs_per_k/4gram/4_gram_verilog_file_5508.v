// Seed: 1647400610
module module_0 (
    input wire id_0,
    input uwire id_1,
    output wand id_2,
    output supply1 id_3,
    input tri id_4,
    output tri id_5,
    input supply1 id_6,
    input tri0 id_7,
    output supply0 id_8,
    input wire id_9,
    input wor id_10,
    input uwire id_11,
    input wire id_12,
    input tri1 id_13,
    input tri1 id_14,
    output tri1 id_15
);
  wire id_17;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    input tri1 id_2,
    output supply1 id_3,
    input wand id_4
);
  generate
    assign id_3 = id_2 && !id_1;
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2,
      id_4,
      id_3,
      id_4,
      id_2,
      id_1,
      id_4,
      id_2,
      id_1,
      id_0
  );
endmodule
