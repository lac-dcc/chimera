// Seed: 2287489408
module module_0 (
    input wand id_0
    , id_11,
    output wire id_1,
    output supply1 id_2,
    input supply0 id_3,
    output uwire id_4,
    input wand id_5,
    input wor id_6,
    output tri0 id_7,
    output supply0 id_8,
    output tri1 id_9
);
  wire  id_12;
  wire  id_13;
  uwire id_14 = 1'b0;
endmodule
module module_1 (
    output wor id_0,
    inout wand id_1,
    input supply1 id_2
    , id_4
);
  assign id_1 = 1 - ~id_1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.type_1 = 0;
endmodule
