// Seed: 2234081232
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    output supply1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output supply0 id_7,
    input tri0 id_8,
    input supply0 id_9,
    input wire id_10,
    input tri1 id_11,
    input wand id_12,
    input uwire id_13,
    input wor id_14,
    output tri0 id_15,
    input tri1 id_16
);
  assign id_7 = 1'h0;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output wand id_2,
    input wand id_3,
    output wor id_4,
    input tri id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_3,
      id_4,
      id_3,
      id_5,
      id_5,
      id_1,
      id_1,
      id_3,
      id_3,
      id_4,
      id_0
  );
  assign modCall_1.id_16 = 0;
  wire id_7;
endmodule
