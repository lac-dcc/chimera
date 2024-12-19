// Seed: 1529236201
module module_0 (
    output uwire id_0,
    input uwire id_1,
    output wor id_2,
    output wor id_3,
    output uwire id_4,
    input uwire id_5,
    output uwire id_6,
    output tri id_7#(
        .id_34(1),
        .id_35(1)
    ),
    output supply0 id_8,
    input tri id_9,
    input supply1 id_10,
    input wire id_11,
    input wire id_12,
    output tri1 id_13,
    input supply1 id_14
    , id_36,
    input tri id_15,
    output tri1 id_16,
    input wand id_17,
    input wire id_18,
    output wor id_19,
    output supply0 id_20,
    input supply1 id_21,
    input wand id_22,
    input supply1 id_23,
    input supply0 id_24,
    input supply1 id_25,
    output tri id_26,
    output wor id_27,
    input tri1 id_28
    , id_37,
    output tri id_29,
    input wand id_30,
    input supply1 id_31,
    output wand id_32
);
  assign module_1.type_2 = 0;
  assign id_8 = 1'b0 ? id_9 : 1;
endmodule
module module_1 (
    output wand id_0
    , id_6,
    output uwire id_1,
    output logic id_2
    , id_7,
    input wire id_3,
    input supply1 id_4
);
  always begin : LABEL_0
    id_2 <= 1 & 1;
  end
  module_0 modCall_1 (
      id_0,
      id_4,
      id_0,
      id_0,
      id_1,
      id_3,
      id_1,
      id_1,
      id_0,
      id_4,
      id_3,
      id_4,
      id_4,
      id_0,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_4,
      id_4,
      id_3,
      id_0,
      id_0,
      id_4,
      id_1,
      id_3,
      id_3,
      id_0
  );
endmodule
