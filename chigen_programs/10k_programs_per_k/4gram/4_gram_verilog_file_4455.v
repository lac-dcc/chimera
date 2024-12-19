// Seed: 2360399656
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    output supply1 id_3,
    output tri1 id_4,
    output tri1 id_5,
    output tri id_6,
    output supply0 id_7,
    input uwire id_8,
    input wor id_9
    , id_27,
    input tri id_10,
    output tri1 id_11,
    output supply0 id_12,
    input wand id_13,
    input uwire id_14,
    input supply0 id_15,
    input wire id_16,
    output tri0 id_17,
    input tri0 id_18,
    output supply1 id_19,
    output tri1 id_20,
    input supply0 id_21,
    input wor id_22,
    output wor id_23,
    input supply0 id_24,
    output wor id_25
    , id_28
);
  wire id_29;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input wand id_2,
    input supply0 id_3
    , id_13,
    input tri1 id_4,
    output wire id_5
    , id_14,
    output wand id_6,
    input wor id_7,
    input tri0 id_8,
    output wand id_9,
    output wire id_10,
    output uwire id_11
);
  uwire id_15;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_4,
      id_14,
      id_9,
      id_11,
      id_15,
      id_5,
      id_1,
      id_13,
      id_1,
      id_10,
      id_10,
      id_13,
      id_8,
      id_1,
      id_4,
      id_13,
      id_4,
      id_5,
      id_10,
      id_2,
      id_7,
      id_13,
      id_8,
      id_9
  );
  assign modCall_1.type_38 = 0;
  wire id_16, id_17;
  supply1 id_18 = 1 - $display(id_15, id_0, id_1, 1, 1);
endmodule
