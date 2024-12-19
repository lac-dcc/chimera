// Seed: 383598400
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output uwire id_2,
    output supply1 id_3,
    input wire id_4,
    input supply0 id_5,
    output supply0 id_6,
    output wire id_7,
    input tri1 id_8,
    input uwire id_9,
    input wire id_10
);
  assign id_1 = ~id_4;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output wand id_2,
    input wand id_3,
    output wand id_4,
    input tri id_5,
    output tri id_6,
    input supply0 id_7,
    output wand id_8,
    input wand id_9,
    output wire id_10,
    input wire id_11,
    output tri id_12,
    input tri id_13,
    input tri0 id_14,
    input tri1 id_15
);
  assign id_8 = id_14;
  module_0 modCall_1 (
      id_15,
      id_10,
      id_2,
      id_10,
      id_1,
      id_3,
      id_8,
      id_4,
      id_14,
      id_15,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
