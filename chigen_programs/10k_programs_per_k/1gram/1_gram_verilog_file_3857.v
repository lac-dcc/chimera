// Seed: 855252417
module module_0 #(
    parameter id_26 = 32'd90
) (
    input tri id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wor id_3,
    input tri0 id_4,
    input supply1 id_5,
    output tri1 id_6
    , _id_26,
    input tri id_7,
    output uwire id_8[-1 : 1]
    , id_27,
    input supply0 id_9,
    input supply0 id_10,
    output tri1 id_11,
    input supply0 id_12,
    input uwire id_13,
    input supply0 id_14,
    input supply1 id_15,
    output uwire id_16,
    input wire id_17,
    input supply0 id_18,
    output wire id_19,
    input uwire id_20,
    output wand id_21,
    input wand id_22,
    input uwire id_23,
    output tri0 id_24
);
  assign module_1.id_17 = 0;
  assign id_27[id_26]   = id_2;
  parameter id_28 = 1;
  logic id_29;
endmodule
module module_1 #(
    parameter id_2 = 32'd88,
    parameter id_4 = 32'd25,
    parameter id_9 = 32'd15
) (
    input wor id_0,
    inout tri0 id_1
    , id_13,
    output tri _id_2,
    input tri1 void id_3,
    input supply1 _id_4,
    output wire id_5,
    input wand id_6,
    output wor id_7[1 'b0 : 1],
    input wor id_8,
    input tri1 _id_9
    , id_14,
    input wire id_10,
    input uwire id_11
);
  assign id_7 = id_1 - 1;
  wire id_15;
  assign id_5 = 1'b0;
  nand primCall (id_5, id_15, id_10, id_3, id_11, id_14, id_0, id_16, id_1);
  wand [id_4 : -1  ==  id_9] id_16[id_2 : 1  -  -1], id_17;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_3,
      id_8,
      id_3,
      id_8,
      id_5,
      id_3,
      id_5,
      id_10,
      id_10,
      id_1,
      id_8,
      id_1,
      id_11,
      id_3,
      id_5,
      id_1,
      id_3,
      id_1,
      id_0,
      id_7,
      id_10,
      id_6,
      id_5
  );
  assign id_16 = -1'b0;
endmodule
