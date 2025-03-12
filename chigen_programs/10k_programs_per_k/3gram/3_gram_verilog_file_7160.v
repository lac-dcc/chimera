// Seed: 3175198460
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply0 id_3,
    output wor id_4,
    output wire id_5,
    output supply0 id_6,
    input wand id_7,
    input uwire id_8,
    output tri1 id_9,
    output uwire id_10,
    input wor id_11,
    output supply0 id_12,
    output tri1 id_13,
    input tri id_14,
    input wand id_15,
    input supply0 id_16,
    output wand id_17,
    input wire id_18,
    output wire id_19
);
  logic [-1 : -1] id_21 = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd10,
    parameter id_13 = 32'd34,
    parameter id_15 = 32'd69,
    parameter id_17 = 32'd96,
    parameter id_3  = 32'd15,
    parameter id_6  = 32'd84
) (
    output tri1 id_0,
    output supply0 id_1,
    input wor id_2,
    input tri1 _id_3,
    input wand id_4,
    input supply1 id_5,
    input uwire _id_6,
    input wire id_7,
    output tri1 id_8,
    output tri0 id_9,
    input wor _id_10,
    output wor id_11
);
  logic [id_10 : id_6] _id_13;
  wire id_14 = id_7;
  logic _id_15;
  ;
  assign id_13 = (id_10);
  module_0 modCall_1 (
      id_0,
      id_7,
      id_7,
      id_7,
      id_9,
      id_1,
      id_11,
      id_5,
      id_2,
      id_11,
      id_11,
      id_4,
      id_9,
      id_0,
      id_2,
      id_2,
      id_7,
      id_8,
      id_2,
      id_1
  );
  assign modCall_1.id_21 = 0;
  wire id_16;
  tri [-1  ==  id_6 : id_3] _id_17 = -1 - id_13;
  parameter id_18 = 1;
  wire [id_13 : id_17] id_19 = id_16;
  wire [id_13 : {  id_15  ,  -1  <  1  }] id_20 = id_6;
  tri0 [-1  +  id_3 : -1] id_21 = -1 >= id_10;
  wire id_22 = ~-1;
endmodule
