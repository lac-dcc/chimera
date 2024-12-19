// Seed: 1611128414
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input tri id_2,
    output tri1 id_3,
    input uwire id_4,
    input tri1 id_5,
    output wor id_6
    , id_23,
    input wire id_7,
    output supply1 id_8,
    input tri0 id_9,
    input uwire id_10,
    output uwire id_11,
    input tri1 id_12,
    input supply1 id_13,
    input wand id_14,
    output supply0 id_15,
    output uwire id_16,
    input supply0 id_17,
    output wand id_18,
    input uwire id_19,
    input wand id_20,
    output wand id_21
);
  wire id_24;
  assign id_0 = 1;
  wire id_25, id_26, id_27, id_28, id_29, id_30, id_31, id_32, id_33, id_34, id_35, id_36;
  tri id_37, id_38, id_39, id_40, id_41, id_42, id_43, id_44, id_45, id_46, id_47, id_48;
  assign id_44 = 1;
  wire id_49;
  wire id_50;
  always @(*) id_42 = 1 << 1'b0;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    output wor id_5,
    input wire id_6,
    output supply1 id_7,
    input tri id_8,
    output wor id_9,
    input tri1 id_10,
    input tri id_11,
    output wand id_12,
    input supply1 id_13
);
  wire id_15;
  id_16(
      1, id_6, id_12 < 1'd0
  );
  module_0 modCall_1 (
      id_9,
      id_10,
      id_10,
      id_5,
      id_1,
      id_3,
      id_5,
      id_6,
      id_0,
      id_11,
      id_3,
      id_0,
      id_6,
      id_10,
      id_1,
      id_9,
      id_0,
      id_3,
      id_0,
      id_1,
      id_3,
      id_7
  );
  assign modCall_1.id_21 = 0;
endmodule
