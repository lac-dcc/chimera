// Seed: 2341350499
module module_0 (
    output wor id_0,
    output tri1 id_1,
    output tri1 id_2,
    output supply1 id_3,
    input supply1 id_4,
    input supply1 id_5,
    output wire id_6,
    input wire id_7,
    input wire id_8,
    output uwire id_9,
    output tri1 id_10
);
  wire id_12;
endmodule
module module_1 (
    output wand  id_0,
    input  wand  id_1,
    output uwire id_2,
    input  uwire id_3,
    output wire  id_4
);
  supply0 id_6;
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_2,
      id_6,
      id_3,
      id_6,
      id_1,
      id_6,
      id_6,
      id_0
  );
  assign modCall_1.type_5 = 0;
  assign id_2 = id_6;
endmodule
