// Seed: 1122499235
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input wire id_2,
    input tri id_3,
    output supply1 id_4,
    output tri0 id_5,
    input tri1 id_6,
    output wand id_7,
    input supply0 id_8,
    output uwire id_9,
    input supply1 id_10,
    input supply0 id_11,
    input supply0 id_12,
    input wor id_13,
    input wire id_14,
    input wor id_15,
    output wor id_16,
    output supply1 id_17,
    input tri id_18,
    input wire id_19,
    input tri id_20
    , id_32,
    input tri1 id_21,
    input wand id_22,
    input tri0 id_23,
    output supply1 id_24,
    output supply1 id_25,
    input tri1 id_26,
    input supply0 id_27,
    output tri id_28,
    output wire id_29,
    output tri id_30
);
  rpmos ('b0, id_4);
  wire id_33;
  wire id_34;
  wire [-1 : -1] id_35;
  wire id_36;
endmodule
module module_1 (
    input  wor   id_0,
    input  uwire id_1,
    input  tri   id_2,
    output wor   id_3,
    input  wor   id_4,
    input  tri1  id_5,
    input  tri0  id_6,
    input  tri0  id_7
);
  wire id_9;
  localparam id_10 = 1;
  or primCall (id_3, id_7, id_6, id_5, id_10, id_2, id_4);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_3,
      id_3,
      id_6,
      id_3,
      id_1,
      id_3,
      id_1,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_3,
      id_3,
      id_7,
      id_6,
      id_6,
      id_0,
      id_1,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_30 = 0;
endmodule
