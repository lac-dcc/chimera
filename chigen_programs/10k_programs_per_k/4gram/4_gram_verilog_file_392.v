// Seed: 2462376192
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input wor id_2,
    output supply1 id_3,
    input supply0 id_4,
    output supply0 id_5,
    output wor id_6,
    input wand id_7,
    output uwire id_8,
    input wor id_9,
    output tri1 id_10,
    input wand id_11,
    input supply0 id_12,
    input wor id_13,
    output wire id_14
);
  wire id_16;
  wand id_17 = ~id_9;
  wire id_18;
  assign id_0 = id_17;
  wire id_19;
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1,
    output uwire id_2,
    input uwire id_3,
    output wand id_4,
    input wand id_5,
    output uwire id_6
);
  wire id_8 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_3,
      id_4,
      id_6,
      id_5,
      id_6,
      id_3,
      id_0,
      id_5,
      id_5,
      id_3,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
