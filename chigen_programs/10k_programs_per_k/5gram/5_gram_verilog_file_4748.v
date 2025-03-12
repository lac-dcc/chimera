// Seed: 337793400
module module_0 (
    output tri id_0
    , id_25,
    input supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    output tri0 id_4,
    output supply1 id_5,
    output tri0 id_6,
    input uwire id_7,
    input tri0 id_8,
    input wand id_9,
    output wire id_10,
    input wire id_11,
    output wand id_12,
    input wor id_13,
    input wire id_14,
    input wor id_15,
    input tri id_16,
    output tri0 id_17,
    input supply0 id_18
    , id_26,
    output uwire id_19,
    input supply1 id_20,
    input supply1 id_21,
    input supply1 id_22,
    output tri1 id_23
);
  wire module_0;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd28,
    parameter id_5 = 32'd15
) (
    input tri1 _id_0,
    input tri id_1,
    input wor id_2,
    input supply0 id_3
    , id_13,
    output uwire id_4,
    output tri0 _id_5,
    input supply1 id_6
    , id_14,
    input wand id_7,
    output wor id_8,
    output uwire id_9,
    output tri0 id_10,
    output tri0 id_11
);
  logic [id_5 : id_0] id_15 = id_7;
  and primCall (id_11, id_1, id_14, id_13, id_7, id_3, id_15, id_2, id_6);
  module_0 modCall_1 (
      id_8,
      id_7,
      id_6,
      id_2,
      id_8,
      id_9,
      id_9,
      id_6,
      id_6,
      id_2,
      id_10,
      id_1,
      id_9,
      id_7,
      id_3,
      id_7,
      id_7,
      id_8,
      id_7,
      id_9,
      id_6,
      id_6,
      id_1,
      id_11
  );
endmodule
