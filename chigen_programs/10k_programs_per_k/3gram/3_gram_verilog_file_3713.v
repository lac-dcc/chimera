// Seed: 462570208
module module_0 (
    output supply0 id_0,
    output wire id_1,
    output wand id_2,
    output tri1 id_3,
    input tri id_4
);
  generate
    assign id_3 = 1;
  endgenerate
  assign id_1 = id_4;
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    output wand id_2,
    input tri id_3,
    output supply1 id_4,
    input supply0 id_5,
    output supply1 id_6,
    output wand id_7,
    input wor id_8,
    input supply1 id_9,
    input wand id_10,
    output wire id_11,
    output wand id_12,
    input tri id_13
);
  wire id_15;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_4,
      id_9
  );
  assign modCall_1.id_4 = 0;
endmodule
