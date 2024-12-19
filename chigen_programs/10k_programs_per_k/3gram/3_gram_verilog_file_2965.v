// Seed: 920950354
module module_0 (
    input wire id_0,
    output supply1 id_1,
    input uwire id_2,
    output wire id_3,
    input tri id_4,
    output tri id_5,
    input uwire id_6,
    input supply0 id_7,
    input uwire id_8,
    input wor id_9,
    output tri id_10
    , id_24,
    input tri id_11,
    input tri0 id_12,
    input wor id_13,
    output wire id_14,
    input wire id_15,
    input tri0 id_16,
    output tri0 id_17,
    input tri id_18,
    output tri0 id_19,
    input wor id_20,
    input wand id_21,
    input tri0 id_22
);
  id_25(
      .id_0(1'b0), .id_1(1 | id_4), .id_2(id_11)
  );
endmodule
macromodule module_1 (
    input wand id_0,
    input supply1 id_1,
    output supply0 id_2,
    output uwire id_3,
    input tri id_4,
    input tri0 id_5,
    output uwire id_6,
    input tri1 id_7,
    output wand id_8,
    input wor id_9,
    input wor id_10,
    input wand id_11,
    output wire id_12,
    input tri0 id_13,
    output tri id_14,
    output wor id_15
);
  wire id_17;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_13,
      id_12,
      id_1,
      id_14,
      id_13,
      id_1,
      id_1,
      id_7,
      id_14,
      id_9,
      id_10,
      id_0,
      id_14,
      id_13,
      id_10,
      id_2,
      id_5,
      id_8,
      id_10,
      id_7,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
