// Seed: 3371765666
module module_0 (
    input tri0 id_0,
    output tri id_1,
    output wor id_2,
    output tri id_3,
    output supply1 id_4,
    input uwire id_5,
    output tri0 id_6,
    input wor id_7
);
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input uwire id_5,
    input supply0 id_6,
    inout supply0 id_7,
    output wire id_8,
    output tri1 id_9,
    output wand id_10,
    input uwire id_11,
    input wor id_12,
    output tri0 id_13
);
  module_0 modCall_1 (
      id_3,
      id_10,
      id_0,
      id_9,
      id_9,
      id_11,
      id_13,
      id_5
  );
  assign modCall_1.type_1 = 0;
  always @(id_7 or posedge 1) id_13 = (1);
  assign id_7 = id_6;
endmodule
