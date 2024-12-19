// Seed: 2315105918
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input uwire id_2,
    output uwire id_3,
    input wor id_4,
    output supply0 id_5,
    input tri1 id_6,
    input tri id_7,
    input tri1 id_8,
    input tri1 id_9,
    output supply0 id_10,
    input wor id_11
);
  wire id_13 = id_6;
  wire id_14;
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    input wand id_2,
    input tri1 id_3,
    output wand id_4,
    input tri1 id_5,
    output supply1 id_6,
    input wor id_7,
    input wand id_8,
    output tri1 id_9,
    output tri1 id_10,
    output tri1 id_11,
    output wire id_12,
    output tri0 id_13,
    input wire id_14
);
  generate
    tri id_16 = id_8;
  endgenerate
  module_0 modCall_1 (
      id_16,
      id_10,
      id_14,
      id_10,
      id_1,
      id_4,
      id_8,
      id_5,
      id_14,
      id_16,
      id_12,
      id_8
  );
  assign modCall_1.id_1 = 0;
  wire id_17;
endmodule
