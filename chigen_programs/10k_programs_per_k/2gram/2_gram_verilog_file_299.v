// Seed: 1945308349
module module_0 (
    input tri id_0,
    output wand id_1,
    input wand id_2,
    output wand id_3,
    input wire id_4,
    output wor id_5,
    input supply1 id_6,
    input tri0 id_7,
    input wand id_8,
    output tri0 id_9,
    input wire id_10,
    output wor id_11,
    output wand id_12,
    input tri id_13,
    input uwire id_14,
    input wor id_15,
    input wand id_16
    , id_19,
    output uwire id_17
);
  assign id_11 = id_14;
  assign id_12 = id_16;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    output tri1 id_2
);
  assign id_1 = id_0 ^ $display(1);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
endmodule
