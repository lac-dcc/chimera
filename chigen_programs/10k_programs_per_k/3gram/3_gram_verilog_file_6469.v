// Seed: 3963431738
module module_0 (
    input wor id_0,
    output wor id_1,
    input wire id_2,
    input supply0 id_3,
    input wand id_4,
    output wor id_5
);
  assign id_5 = id_3;
  tri1 id_7 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output tri id_2,
    input wire id_3,
    input wor id_4
);
  wire id_6 = {id_1 * id_4{id_3}};
  module_0 modCall_1 (
      id_3,
      id_6,
      id_0,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_0 = 0;
  supply0 id_7;
  assign id_7 = id_1;
endmodule
