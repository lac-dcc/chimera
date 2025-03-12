// Seed: 2160574115
module module_0 (
    output tri1 id_0,
    input wire id_1,
    input wor id_2,
    input tri1 id_3
    , id_11,
    output tri id_4
    , id_12,
    output tri0 id_5,
    output wor id_6,
    input tri id_7,
    input wor id_8,
    input supply0 id_9
);
  wire id_13;
endmodule
module module_1 #(
    parameter id_0 = 32'd45,
    parameter id_2 = 32'd95,
    parameter id_3 = 32'd22
) (
    output uwire _id_0,
    input supply0 id_1,
    input uwire _id_2,
    inout supply1 _id_3,
    input tri0 id_4,
    output supply1 id_5,
    output tri0 id_6,
    output supply1 id_7,
    output tri id_8,
    input supply0 id_9,
    input uwire id_10
    , id_14,
    input tri0 id_11,
    output wand id_12
);
  logic [1 : {  1  ,  id_0  +  -1  ,  {  id_2  ,  1 'b0 }  ,  id_2  ,  id_3  }] id_15;
  assign id_12 = id_14;
  nand primCall (id_8, id_10, id_11, id_14, id_9, id_4, id_15);
  module_0 modCall_1 (
      id_5,
      id_4,
      id_9,
      id_10,
      id_6,
      id_5,
      id_5,
      id_9,
      id_10,
      id_1
  );
  assign modCall_1.id_1 = 0;
  localparam id_16 = {-1, 1 - 1};
  wire id_17;
endmodule
