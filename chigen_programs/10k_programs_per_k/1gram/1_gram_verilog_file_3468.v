// Seed: 3596871319
module module_0 (
    output supply1 id_0,
    output uwire id_1,
    input tri1 id_2,
    input supply0 id_3,
    input wire id_4
    , id_31,
    output tri1 id_5
    , id_32 = 1,
    input wand id_6,
    input supply1 id_7,
    output tri1 id_8,
    input supply0 id_9,
    output supply1 id_10,
    output supply0 id_11,
    output supply0 id_12,
    output uwire id_13,
    output tri0 id_14,
    output tri id_15,
    input wor id_16,
    input uwire id_17,
    input wor id_18,
    output tri0 id_19,
    output tri1 id_20,
    input wand id_21,
    input tri0 id_22,
    input tri0 id_23,
    input tri0 id_24,
    input wor id_25,
    input tri id_26,
    output tri0 id_27,
    output tri id_28,
    output supply1 id_29
);
  wire id_33, id_34;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input wor id_1,
    output tri id_2,
    input supply1 id_3,
    input tri0 id_4,
    input uwire id_5,
    output tri1 id_6,
    output wire id_7,
    output supply1 id_8
);
  wor id_10 = id_4;
  initial id_2 = 1;
  assign id_6 = id_5 ? id_1 : 1'b0;
  assign id_2 = id_10 && 1'b0;
  wor id_11 = id_0;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_11,
      id_6,
      id_1,
      id_11,
      id_3,
      id_11,
      id_10,
      id_5,
      id_2,
      id_10,
      id_10,
      id_7,
      id_8,
      id_2,
      id_7,
      id_8,
      id_10,
      id_10,
      id_3,
      id_2,
      id_10,
      id_11,
      id_10,
      id_3,
      id_5,
      id_5,
      id_4,
      id_8,
      id_11,
      id_10
  );
endmodule
