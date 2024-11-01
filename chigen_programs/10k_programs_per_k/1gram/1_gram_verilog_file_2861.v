// Seed: 2646955199
module module_0 (
    input wand id_0,
    output uwire id_1,
    input wand id_2,
    input tri1 id_3
    , id_26,
    input tri0 id_4,
    input supply1 id_5,
    output tri id_6,
    output uwire id_7,
    input uwire id_8,
    input tri id_9,
    output tri1 id_10,
    input wand id_11,
    input supply1 id_12,
    input tri0 id_13,
    input tri1 id_14
    , id_27,
    input wor id_15#(.id_28(1)),
    output wor id_16,
    input tri0 id_17,
    output supply0 id_18,
    output wand id_19,
    input wire id_20,
    output supply0 id_21,
    output uwire id_22,
    input wire id_23,
    input wor id_24
);
  assign id_21 = id_12;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output wor id_4,
    input wire id_5,
    output supply1 id_6,
    input wor id_7,
    input wire id_8
    , id_15,
    input uwire id_9,
    input uwire id_10,
    input tri id_11,
    input tri id_12,
    input tri0 id_13
);
  assign id_4 = id_10;
  xnor (id_3, id_9, id_12, id_7, id_5, id_11, id_10, id_15);
  module_0(
      id_8,
      id_6,
      id_11,
      id_13,
      id_9,
      id_11,
      id_0,
      id_4,
      id_11,
      id_12,
      id_1,
      id_7,
      id_7,
      id_12,
      id_8,
      id_11,
      id_4,
      id_12,
      id_4,
      id_0,
      id_10,
      id_2,
      id_0,
      id_12,
      id_8
  );
endmodule
