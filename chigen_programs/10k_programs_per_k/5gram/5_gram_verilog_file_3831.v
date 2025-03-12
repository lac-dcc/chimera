// Seed: 254584564
module module_0 (
    input  tri0 id_0,
    input  wor  id_1,
    input  tri  module_0,
    output wire id_3,
    input  wand id_4,
    input  wor  id_5,
    input  wire id_6
);
  wire id_8;
  assign module_1.id_12 = 0;
  wor id_9 = -1 - !id_8, id_10;
  assign id_3 = id_5;
endmodule
module module_1 #(
    parameter id_16 = 32'd24,
    parameter id_2  = 32'd88
) (
    output tri0 id_0,
    input wand id_1,
    input tri0 _id_2,
    input uwire id_3
    , id_24,
    output supply1 id_4
    , id_25,
    input tri0 id_5
    , id_26,
    input uwire id_6,
    input supply1 id_7,
    input tri0 id_8,
    output tri1 id_9,
    output supply0 id_10,
    input supply0 id_11,
    output supply0 id_12,
    output wor id_13,
    output supply1 id_14,
    output wor id_15,
    input uwire _id_16,
    input supply0 id_17,
    input uwire id_18,
    output wor id_19,
    output tri0 id_20,
    input tri1 id_21,
    output wor id_22
);
  logic id_27;
  wire ["" : 1] id_28;
  nand primCall (id_20, id_18, id_1, id_28, id_26, id_21, id_24, id_25, id_7, id_5, id_6, id_29);
  wire id_29;
  ;
  module_0 modCall_1 (
      id_18,
      id_11,
      id_6,
      id_14,
      id_18,
      id_18,
      id_17
  );
  assign id_4 = id_26[id_16 : id_2>>1];
endmodule
