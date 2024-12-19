// Seed: 4102130163
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wor id_3,
    output tri1 id_4
    , id_21,
    input supply1 id_5,
    input tri0 id_6,
    output tri id_7,
    input tri1 id_8,
    input tri0 id_9,
    input uwire id_10,
    input tri1 id_11,
    output tri0 id_12,
    output wire id_13,
    input wire id_14,
    input supply1 id_15,
    input wand id_16,
    output tri1 id_17,
    output supply0 id_18,
    input wire id_19#(.id_22(1))
);
  assign id_21 = id_16;
  wire id_23;
  always_comb {1'b0, 1, 1'd0} = id_6;
  tri0 id_24 = 1;
  tri1 id_25 = id_14;
  wire id_26;
  wire id_27;
  wire id_28;
  assign id_22 = 1;
  wire id_29, id_30;
  wire id_31;
  assign id_12 = 1;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input wor id_7
    , id_13,
    input wor id_8,
    output wire id_9
    , id_14,
    input supply1 id_10,
    input supply1 id_11
);
  wand id_15 = 1;
  wire id_16;
  xor primCall (id_3, id_6, id_2, id_5, id_11, id_4, id_0);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_3,
      id_5,
      id_9,
      id_1,
      id_11,
      id_9,
      id_0,
      id_11,
      id_2,
      id_8,
      id_9,
      id_9,
      id_1,
      id_11,
      id_0,
      id_3,
      id_9,
      id_7
  );
  assign modCall_1.type_33 = 0;
  wire id_17;
endmodule
