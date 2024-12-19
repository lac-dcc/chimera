// Seed: 1024541824
module module_0 (
    input wand id_0,
    output uwire id_1,
    input uwire id_2,
    output supply1 id_3,
    output supply1 id_4,
    output tri id_5,
    input uwire id_6,
    output tri0 id_7,
    input wire id_8,
    output wand id_9,
    output tri id_10,
    output uwire id_11,
    input uwire id_12
    , id_17,
    input tri1 id_13,
    output wor id_14,
    output tri0 id_15
);
  wire id_18;
  wire id_19;
  assign id_5 = 1;
endmodule
module module_1 (
    output wire  id_0,
    output tri0  id_1,
    input  tri0  id_2,
    output uwire id_3,
    input  wire  id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_4,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_2,
      id_3,
      id_0
  );
  assign modCall_1.id_15 = 0;
endmodule
