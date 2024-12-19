// Seed: 2479841610
module module_0 (
    input wire id_0,
    input tri id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4,
    input wand id_5,
    output tri0 id_6,
    input uwire id_7,
    output uwire id_8,
    output wire id_9,
    input uwire id_10,
    output uwire id_11,
    output uwire id_12,
    output supply0 id_13
);
  assign id_6 = id_4;
  assign id_9 = 1;
  wire id_15;
  wire id_16;
  wire id_17;
  wire id_18;
  supply1 id_19;
  wire id_20;
  wire id_21, id_22, id_23;
endmodule
module module_1 (
    input  wire id_0,
    output wand id_1,
    output wand id_2,
    input  wor  id_3
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
