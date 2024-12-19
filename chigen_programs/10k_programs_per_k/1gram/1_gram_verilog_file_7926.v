// Seed: 1661766577
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    input uwire id_3,
    input wire id_4,
    output tri1 id_5,
    input wire id_6,
    input wire id_7
);
  id_9(
      .id_0(id_5)
  );
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input tri1 id_2,
    input wor id_3,
    input supply0 id_4,
    input wand id_5,
    output wor id_6
    , id_9,
    output tri1 id_7
);
  module_0 modCall_1 (
      id_3,
      id_6,
      id_1,
      id_0,
      id_5,
      id_6,
      id_5,
      id_1
  );
  assign modCall_1.type_0 = 0;
endmodule
