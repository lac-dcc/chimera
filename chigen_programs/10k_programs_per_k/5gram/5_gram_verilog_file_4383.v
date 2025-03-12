// Seed: 3520392808
module module_0 (
    input uwire id_0,
    input wor id_1,
    output tri id_2,
    output wor id_3,
    input supply1 id_4,
    input uwire id_5,
    input tri1 id_6,
    input tri0 id_7,
    output uwire id_8,
    input wire id_9,
    output tri id_10,
    input wand id_11,
    output tri0 id_12,
    input wand id_13,
    input tri1 id_14,
    output wand id_15,
    input wire id_16,
    input supply1 id_17,
    input wor id_18,
    input wor id_19,
    input supply1 id_20,
    input tri0 id_21,
    output wor id_22,
    output tri id_23,
    input supply1 id_24
);
  assign id_23 = id_5;
  assign id_12 = id_13 ? id_24 == 1'h0 : id_17 & (~id_11);
  assign id_10 = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd84,
    parameter id_13 = 32'd93,
    parameter id_16 = 32'd5,
    parameter id_6  = 32'd21
) (
    output tri0 id_0,
    input supply0 id_1,
    output tri id_2,
    output tri0 id_3,
    output supply0 id_4,
    input wor id_5,
    input wor _id_6,
    output supply0 id_7,
    output wand id_8,
    output wand id_9,
    output tri0 id_10,
    input tri0 _id_11,
    output wand id_12,
    input tri1 _id_13
);
  genvar id_15;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_8,
      id_4,
      id_5,
      id_5,
      id_1,
      id_5,
      id_12,
      id_1,
      id_0,
      id_1,
      id_4,
      id_1,
      id_1,
      id_0,
      id_5,
      id_5,
      id_1,
      id_5,
      id_1,
      id_1,
      id_3,
      id_10,
      id_1
  );
  assign modCall_1.id_12 = 0;
  wire [ id_6 : id_13] _id_16;
  wire [id_16 : id_11] id_17;
  assign id_10 = id_5 ? id_11 : 1;
endmodule
