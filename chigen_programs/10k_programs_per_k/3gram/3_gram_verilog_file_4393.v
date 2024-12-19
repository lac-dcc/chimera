// Seed: 4213853283
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wire id_4,
    input wor id_5,
    output wire id_6,
    output tri1 id_7,
    input wire id_8,
    input uwire id_9,
    input supply1 id_10,
    output tri id_11,
    inout tri0 id_12,
    input tri id_13,
    output wor id_14,
    input tri0 id_15,
    input tri0 id_16,
    input tri0 id_17,
    output tri0 id_18,
    input supply0 id_19,
    output wand id_20,
    output wand id_21,
    output supply1 id_22,
    input tri0 id_23,
    input uwire id_24,
    output wand id_25,
    input wand id_26,
    output tri id_27
    , id_37,
    input tri0 id_28,
    input wire id_29,
    input wor id_30,
    output wor id_31,
    output tri1 id_32,
    input tri0 id_33,
    input supply1 id_34,
    inout wand id_35
);
  wire id_38;
  wire id_39, id_40;
endmodule
module module_1 (
    input  tri  id_0,
    input  tri0 id_1,
    output tri1 id_2,
    input  tri0 id_3
);
  uwire id_5, id_6, id_7;
  assign id_2 = id_1;
  assign id_6 = id_0;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_7,
      id_0,
      id_6,
      id_0,
      id_6,
      id_5,
      id_0,
      id_6,
      id_3,
      id_2,
      id_7,
      id_0,
      id_2,
      id_7,
      id_1,
      id_3,
      id_2,
      id_7,
      id_6,
      id_6,
      id_2,
      id_5,
      id_1,
      id_2,
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_6,
      id_5,
      id_0,
      id_1,
      id_6
  );
  assign modCall_1.type_19 = 0;
  initial begin : LABEL_0
    deassign id_5;
  end
  wire id_8, id_9;
  assign id_2 = id_7;
  assign id_2 = 1;
  supply1 id_10 = 1'd0;
endmodule
