// Seed: 1119367649
module module_0 (
    output wand id_0,
    output supply0 id_1,
    output wor id_2,
    input tri1 id_3,
    input supply0 id_4,
    input supply0 id_5
);
  always @(posedge 1) id_0 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input uwire id_1,
    input supply0 id_2,
    input wor id_3,
    input wand id_4,
    output supply1 id_5,
    input uwire id_6,
    input wor id_7,
    output tri id_8,
    output supply1 id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_0,
      id_7,
      id_7,
      id_1
  );
  assign modCall_1.type_7 = 0;
  assign id_8 = id_7;
endmodule
