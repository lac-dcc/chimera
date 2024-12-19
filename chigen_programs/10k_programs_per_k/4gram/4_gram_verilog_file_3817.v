// Seed: 4087922825
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    output uwire id_2,
    input uwire module_0,
    input wire id_4,
    output uwire id_5,
    input uwire id_6,
    input tri id_7,
    output wand id_8,
    input tri id_9,
    output wand id_10,
    output tri1 id_11,
    output wire id_12,
    input uwire id_13,
    input supply0 id_14,
    output tri0 id_15
);
  supply0 id_17;
  wire id_18;
  assign id_17 = id_3 ? (1) : id_17 * id_17 + 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output wire id_2,
    output tri1 id_3,
    input wand id_4,
    input uwire id_5,
    input tri0 id_6
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.type_2 = 0;
endmodule
