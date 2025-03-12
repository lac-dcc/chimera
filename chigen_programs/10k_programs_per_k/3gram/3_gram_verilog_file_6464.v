// Seed: 2056103488
module module_0 (
    output uwire id_0,
    output uwire id_1,
    output supply0 id_2,
    input tri0 id_3
);
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input supply0 id_2,
    output wire id_3
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_2
  );
endmodule
module module_2 (
    input tri0 id_0,
    input wand id_1,
    output uwire id_2,
    output supply1 id_3,
    input tri1 id_4,
    output tri1 id_5,
    output wire id_6,
    output tri1 id_7,
    output wor id_8,
    input tri0 id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_9
  );
  assign modCall_1.id_0 = 0;
endmodule
