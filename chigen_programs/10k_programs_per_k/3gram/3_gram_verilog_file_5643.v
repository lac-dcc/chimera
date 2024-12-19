// Seed: 3196925312
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input wor id_2,
    output tri id_3,
    output supply1 id_4,
    input supply0 id_5,
    output supply0 id_6
    , id_10,
    input supply0 id_7
    , id_11,
    output wand id_8
);
  id_12(
      .id_0(id_4),
      .id_1(id_7),
      .id_2(1),
      .id_3(1),
      .id_4(id_10[1]),
      .id_5(1),
      .id_6(id_1),
      .id_7(id_4),
      .id_8(1),
      .id_9(id_0),
      .id_10(id_6),
      .id_11(id_7 & 1'b0),
      .id_12(1'h0),
      .id_13(1'b0),
      .id_14(),
      .id_15(id_1 | 1),
      .id_16(),
      .id_17(id_10)
  );
endmodule
module module_1 (
    output wor id_0,
    output uwire id_1,
    input uwire id_2,
    input uwire id_3,
    input uwire id_4,
    output uwire id_5,
    input supply0 id_6,
    input tri id_7,
    input wor id_8,
    input tri id_9,
    output wand id_10,
    input wire id_11
    , id_33,
    input logic id_12,
    output logic id_13,
    input wor id_14,
    input supply0 id_15,
    output supply1 id_16,
    input wand id_17,
    output tri id_18,
    output supply1 id_19,
    output wire id_20,
    input wire id_21
    , id_34,
    output tri1 id_22,
    output supply1 id_23,
    input tri1 id_24,
    output tri id_25,
    output wand id_26,
    input supply0 id_27,
    output wand id_28,
    output wor id_29,
    input wire id_30,
    output wire id_31
);
  wire id_35;
  wire id_36, id_37, id_38, id_39, id_40, id_41, id_42, id_43, id_44, id_45;
  wire id_46;
  module_0 modCall_1 (
      id_14,
      id_2,
      id_30,
      id_16,
      id_5,
      id_21,
      id_25,
      id_2,
      id_19
  );
  assign modCall_1.id_1 = 0;
  wire id_47;
  always
  fork
    id_13 <= id_12;
  join
  wire id_48;
  wire id_49;
endmodule
