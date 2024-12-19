// Seed: 1926453026
module module_0 (
    input wand id_0,
    input wand id_1,
    output wire id_2,
    output wand id_3,
    input wand id_4,
    input tri0 id_5,
    input wire id_6,
    input wor id_7,
    input tri id_8,
    input wor id_9,
    output supply1 id_10,
    input tri0 id_11,
    input tri0 id_12,
    output uwire id_13
    , id_15, id_16
);
  wire id_17;
endmodule
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    output wire id_2
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_4 = 0;
  id_4(
      .id_0(id_0)
  );
endmodule
