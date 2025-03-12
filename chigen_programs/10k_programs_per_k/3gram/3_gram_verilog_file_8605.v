// Seed: 861152252
module module_0 (
    input tri0 id_0,
    output wor id_1,
    input wand id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wire id_5,
    input supply1 id_6,
    input tri1 id_7,
    output tri1 id_8,
    output tri0 id_9,
    output tri1 id_10,
    input supply1 id_11
    , id_18,
    output tri0 id_12,
    output wand id_13,
    output wor id_14,
    input tri0 id_15,
    output wire id_16
);
  localparam id_19 = -1'b0;
  assign id_1 = -1;
endmodule
module module_1 (
    output tri1 id_0,
    input wor id_1,
    input wor id_2,
    input wand id_3,
    input tri id_4,
    input supply0 id_5,
    input tri0 id_6,
    input supply1 id_7
);
  assign id_0 = 1;
  wire id_9 = (id_6);
  assign id_9 = id_2;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_3,
      id_5,
      id_3,
      id_6,
      id_1,
      id_0,
      id_0,
      id_0,
      id_5,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_12 = 0;
endmodule
