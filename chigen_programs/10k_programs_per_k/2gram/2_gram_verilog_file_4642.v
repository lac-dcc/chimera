// Seed: 2471413463
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input uwire id_2,
    input wand id_3,
    output supply0 id_4,
    output wor id_5,
    output tri1 id_6,
    input uwire id_7,
    input tri0 id_8,
    input tri id_9
);
  wire id_11;
endmodule
module module_1 (
    output tri0 id_0,
    output wor id_1,
    output supply0 id_2,
    input tri id_3,
    input wand id_4,
    input tri0 id_5,
    input uwire id_6
);
  or primCall (id_2, id_3, id_6);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_3,
      id_2,
      id_0,
      id_1,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
