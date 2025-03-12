// Seed: 1458750147
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input wire id_2,
    input supply1 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input tri1 id_6,
    input supply0 id_7,
    input wire id_8,
    input wor id_9,
    input wand id_10,
    output supply0 id_11,
    output wand id_12,
    output tri id_13,
    output tri1 id_14,
    input supply1 id_15,
    input tri1 id_16,
    input wire id_17,
    output tri0 id_18,
    output tri id_19,
    input tri id_20,
    output uwire id_21,
    output uwire id_22,
    input wire id_23
    , id_42,
    output supply1 id_24,
    input supply1 id_25,
    input supply0 id_26,
    input supply0 id_27,
    input wor id_28,
    input wire id_29,
    input supply1 id_30,
    input wor id_31,
    input tri0 id_32,
    output uwire id_33,
    input wand id_34
    , id_43,
    output tri1 id_35,
    input supply0 id_36,
    input tri0 id_37,
    input wire id_38,
    input wire id_39,
    input wire id_40
);
  wire  id_44;
  logic id_45;
  wire  id_46;
  assign id_24 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    output tri0 id_2,
    output wand id_3,
    output tri1 id_4,
    output logic id_5,
    output wand id_6,
    input tri1 id_7,
    input wor id_8,
    input tri id_9,
    input wire id_10
);
  wire id_12;
  parameter id_13 = 1;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_8,
      id_7,
      id_8,
      id_4,
      id_7,
      id_10,
      id_10,
      id_8,
      id_1,
      id_0,
      id_6,
      id_2,
      id_4,
      id_7,
      id_7,
      id_8,
      id_6,
      id_2,
      id_9,
      id_2,
      id_0,
      id_10,
      id_2,
      id_1,
      id_7,
      id_9,
      id_9,
      id_10,
      id_10,
      id_8,
      id_8,
      id_6,
      id_10,
      id_6,
      id_9,
      id_10,
      id_1,
      id_8,
      id_7
  );
  assign modCall_1.id_36 = 0;
  always id_5 = #id_14 id_9 == -1;
  logic ["" : ""] id_15;
  uwire id_16 = 1'h0, id_17 =
  id_5++
  , id_18 = id_10, id_19 = -1, id_20 = id_17, id_21 = -1'b0, id_22 = id_1, id_23 = -1 & -1,
      id_24 = id_15, id_25 = id_25 & -1, id_26 = 1, id_27 = id_23, id_28 = id_16;
endmodule
