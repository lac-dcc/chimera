// Seed: 156999481
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wand id_3,
    input supply0 id_4,
    input uwire id_5,
    output wire id_6
    , id_10,
    output tri0 id_7,
    input supply0 id_8
);
  wire id_11;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    inout uwire id_2,
    input tri0 id_3,
    output wand id_4,
    input tri1 id_5,
    input wand id_6
);
  wire id_8;
  xnor primCall (id_4, id_2, id_5, id_1);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_0,
      id_6,
      id_6,
      id_4,
      id_2,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
