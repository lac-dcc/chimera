// Seed: 912086918
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output supply0 id_2,
    input uwire id_3,
    input wire id_4,
    output wand id_5,
    input tri id_6,
    input tri1 id_7,
    input wire id_8,
    output tri1 id_9,
    input wire id_10,
    input wand id_11,
    output tri1 id_12
    , id_30,
    input wor id_13,
    output tri id_14,
    output supply1 id_15,
    input wand id_16,
    input supply0 id_17,
    input uwire id_18,
    output uwire id_19,
    input uwire id_20
    , id_31,
    output wire id_21,
    output uwire id_22,
    input uwire id_23,
    output tri id_24,
    output wire id_25,
    output wand id_26,
    output wand id_27,
    input uwire id_28
);
  assign id_5 = id_3;
  wire id_32;
  wire id_33;
  wire id_34, id_35;
  wand id_36 = id_13;
  assign id_5 = id_1 == 1;
  wire id_37, id_38, id_39, id_40, id_41;
  wire id_42, id_43, id_44;
  initial id_5 = ~1;
  wire id_45;
  tri1 id_46 = id_11;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    output wor id_2,
    input tri id_3,
    input uwire id_4,
    output tri0 id_5,
    input wand id_6
);
  assign id_5 = 1;
  module_0(
      id_3,
      id_4,
      id_5,
      id_0,
      id_3,
      id_2,
      id_6,
      id_0,
      id_0,
      id_5,
      id_3,
      id_4,
      id_2,
      id_0,
      id_1,
      id_1,
      id_6,
      id_3,
      id_3,
      id_5,
      id_3,
      id_5,
      id_2,
      id_4,
      id_2,
      id_2,
      id_5,
      id_5,
      id_4
  );
  always @(posedge id_3 or posedge id_0 == id_0) id_5 = 1;
endmodule
