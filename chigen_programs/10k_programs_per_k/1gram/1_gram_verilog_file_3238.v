// Seed: 2691134827
module module_0 (
    output wor id_0,
    output uwire id_1,
    output uwire id_2,
    output uwire id_3,
    input uwire id_4,
    output uwire id_5,
    input supply0 id_6,
    input tri id_7,
    input wor id_8,
    input tri id_9
);
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    output tri id_2,
    input wand id_3,
    input supply0 id_4,
    input wand id_5,
    input wor id_6,
    input wire id_7,
    input tri1 id_8,
    input wire id_9
);
  assign id_2 = (1);
  wire id_11;
  xnor primCall (id_2, id_5, id_4, id_3, id_9, id_7);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_7,
      id_1,
      id_8,
      id_8,
      id_3,
      id_6
  );
  assign modCall_1.id_5 = 0;
  wire id_12, id_13;
endmodule
