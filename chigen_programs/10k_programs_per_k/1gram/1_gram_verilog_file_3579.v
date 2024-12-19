// Seed: 2088359475
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wor id_4,
    output supply1 id_5,
    input wire id_6,
    input wor id_7
);
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output tri0 id_2,
    input supply0 id_3,
    output wand id_4,
    output wand id_5,
    input tri0 id_6,
    input tri0 id_7
);
  supply0 id_9 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3,
      id_5,
      id_6,
      id_1
  );
  assign modCall_1.type_10 = 0;
endmodule
