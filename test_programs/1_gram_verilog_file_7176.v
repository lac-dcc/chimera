// Seed: 2563745030
module module_0 (
    input wand id_0,
    output uwire id_1,
    input wire id_2,
    input uwire id_3,
    output wire id_4,
    input tri1 id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wor id_8,
    output supply0 id_9,
    input supply1 id_10,
    output tri id_11,
    input tri id_12,
    output supply1 id_13,
    input tri0 id_14,
    input wor id_15,
    input tri1 id_16,
    input uwire id_17,
    input wire id_18
);
  wire id_20;
  wire id_21, id_22, id_23;
  wire id_24;
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wand id_4,
    input wor id_5,
    output tri0 id_6,
    input wire id_7,
    input supply1 id_8,
    input wor id_9
);
  wire id_11, id_12;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_5,
      id_1,
      id_0,
      id_1,
      id_5,
      id_1,
      id_3,
      id_0,
      id_5,
      id_8,
      id_8
  );
  assign modCall_1.id_5 = 0;
  nand primCall (id_1, id_7, id_12, id_9, id_3, id_4);
endmodule
