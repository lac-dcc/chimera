// Seed: 2922487501
module module_0 (
    output wand id_0,
    output wand id_1,
    output tri0 id_2,
    input tri id_3,
    input tri0 id_4,
    input uwire id_5,
    output wor id_6,
    input wire id_7,
    input wor id_8,
    input tri0 id_9,
    input supply1 id_10,
    output tri1 id_11,
    input uwire id_12
);
  generate
    assign id_0 = 1;
  endgenerate
  assign id_0 = id_5;
endmodule
module module_1 (
    input supply0 id_0,
    output tri1 id_1,
    input wand id_2,
    output wire id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    output wor id_7
);
  assign id_3 = 1 <-> 1;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_3,
      id_0,
      id_6,
      id_4,
      id_1,
      id_6,
      id_6,
      id_0,
      id_0,
      id_7,
      id_5
  );
  assign modCall_1.type_4 = 0;
endmodule
