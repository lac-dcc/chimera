// Seed: 2230911791
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input tri id_2,
    output wire id_3,
    output uwire id_4,
    input uwire id_5,
    input uwire id_6,
    output supply0 id_7,
    input wire id_8,
    input wand id_9,
    input wand id_10,
    input uwire id_11,
    input wand id_12,
    input tri0 id_13
);
  assign id_4 = 1;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    output tri1 id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wor id_7
);
  assign id_2 = id_3;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_0,
      id_4,
      id_5,
      id_2,
      id_3,
      id_3,
      id_3,
      id_7,
      id_5,
      id_3
  );
  assign modCall_1.type_15 = 0;
  uwire id_9 = id_6, id_10;
  wire  id_11;
  wire  id_12;
endmodule
