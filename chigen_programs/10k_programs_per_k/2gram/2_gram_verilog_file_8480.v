// Seed: 3286893683
module module_0 (
    input supply0 id_0
    , id_17,
    input tri id_1,
    input tri id_2,
    input tri id_3,
    input wor id_4,
    input supply1 id_5,
    output tri0 id_6,
    input wor id_7,
    output tri0 id_8,
    input uwire id_9,
    input wand id_10,
    input wand id_11,
    input uwire id_12,
    input wire id_13,
    output supply0 id_14,
    input wire id_15
);
  wire  id_18;
  wire  id_19 = -1;
  logic id_20;
  ;
  parameter id_21 = 1 - 1;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input uwire id_2,
    output tri1 id_3,
    input wand id_4,
    input wire id_5,
    output supply0 id_6,
    input wand id_7,
    input tri id_8,
    output supply0 id_9,
    output tri0 id_10,
    output tri id_11,
    input wand id_12,
    output wire id_13,
    input uwire id_14,
    input supply1 id_15,
    output tri id_16,
    input supply1 id_17,
    output logic id_18,
    input tri0 id_19,
    output uwire id_20,
    output supply0 id_21,
    output wor id_22,
    input wand id_23,
    output supply1 id_24
);
  uwire id_26 = 1;
  wire  id_27;
  always_ff id_18 = id_8;
  wire id_28;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_4,
      id_1,
      id_5,
      id_23,
      id_3,
      id_1,
      id_24,
      id_2,
      id_17,
      id_23,
      id_2,
      id_14,
      id_9,
      id_17
  );
  assign modCall_1.id_11 = 0;
  logic id_29;
  ;
  wire id_30;
  xor primCall (
      id_24,
      id_14,
      id_8,
      id_2,
      id_5,
      id_4,
      id_23,
      id_7,
      id_12,
      id_15,
      id_1,
      id_26,
      id_19,
      id_0,
      id_27,
      id_28
  );
endmodule
