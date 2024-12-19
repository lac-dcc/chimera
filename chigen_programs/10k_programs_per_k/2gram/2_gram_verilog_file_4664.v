// Seed: 1749432256
module module_0 (
    input uwire id_0,
    input wand id_1
    , id_11,
    input tri id_2,
    input tri1 id_3,
    output wand id_4,
    input supply1 id_5,
    output tri0 id_6,
    input tri1 id_7,
    input uwire id_8,
    output logic id_9
);
  always id_9 <= id_7 & 1 - id_1 & id_0;
  assign module_1.id_33 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  logic id_1,
    output tri   id_2,
    input  wand  id_3,
    input  wire  id_4
);
  logic id_6;
  assign id_6 = id_1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_3,
      id_2,
      id_3,
      id_2,
      id_4,
      id_3,
      id_6
  );
  logic
      id_7,
      id_8,
      id_9 = id_6,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22 = id_14,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36,
      id_37,
      id_38,
      id_39,
      id_40,
      id_41,
      id_42 = 1'b0,
      id_43;
  id_44(
      .id_0(id_14), .id_1(!id_37 ? 1 : 1), .id_2(id_6), .id_3(id_41), .id_4(1)
  );
  wire id_45;
  final id_37 <= id_19;
  assign id_31 = 1;
endmodule
