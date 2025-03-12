// Seed: 1360348841
module module_0 (
    input supply0 id_0,
    output tri1 id_1,
    input wand id_2,
    output wand id_3,
    input tri1 id_4,
    input uwire id_5,
    output tri1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    input supply0 id_9,
    input wire id_10,
    input wand id_11,
    input wor id_12,
    input supply0 id_13,
    output uwire id_14,
    input uwire id_15,
    input wor id_16,
    output tri0 id_17,
    input wor id_18,
    input tri0 id_19
);
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1
);
  assign id_1 = (~|id_0);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_16 = 0;
  logic \id_3 ;
endmodule
