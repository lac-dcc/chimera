// Seed: 636903798
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input uwire id_4,
    input wand id_5
    , id_26,
    output tri1 id_6,
    input wor id_7,
    output supply1 id_8,
    input supply1 id_9,
    input tri id_10,
    output tri0 id_11,
    input tri0 id_12,
    input wand id_13,
    input wire id_14,
    output supply1 id_15,
    output wand id_16
    , id_27,
    output wire id_17,
    input wor id_18,
    output wor id_19,
    input tri0 id_20,
    input supply1 id_21,
    input tri0 id_22,
    input supply0 id_23,
    output uwire id_24
);
  wire ["" : 1] id_28;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd43
) (
    input wand _id_0,
    output tri0 id_1,
    input supply0 id_2,
    inout wire id_3,
    input wor id_4,
    input supply1 id_5,
    input wire id_6,
    input wire id_7,
    output supply1 id_8,
    input supply1 id_9,
    input uwire id_10
);
  logic [7:0] id_12;
  or primCall (id_1, id_3, id_2, id_10);
  module_0 modCall_1 (
      id_1,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_8,
      id_6,
      id_3,
      id_6,
      id_3,
      id_8,
      id_6,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_9,
      id_9,
      id_3,
      id_1
  );
  assign id_12[~id_0] = 1;
endmodule
