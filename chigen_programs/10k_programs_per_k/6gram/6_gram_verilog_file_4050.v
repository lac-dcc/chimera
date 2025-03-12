// Seed: 3593243926
module module_0 (
    input tri id_0,
    input uwire id_1,
    input wire id_2,
    input supply0 id_3,
    input tri0 id_4,
    input tri id_5
    , id_7
);
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_16 = 32'd90
) (
    output supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    input tri0 id_3,
    input wand id_4,
    output tri0 id_5,
    input tri1 id_6,
    input uwire id_7,
    input tri id_8
    , id_20,
    input wand id_9,
    input tri1 id_10,
    input supply1 id_11,
    input wire id_12,
    input tri1 id_13,
    output supply1 id_14,
    input supply0 id_15,
    output wor _id_16,
    input wand id_17,
    output tri id_18
);
  nand primCall (
      id_2,
      id_11,
      id_21,
      id_7,
      id_13,
      id_8,
      id_20,
      id_10,
      id_22,
      id_17,
      id_6,
      id_15,
      id_3,
      id_12,
      id_4,
      id_9
  );
  assign id_2 = id_4;
  assign id_0 = (-1'd0);
  logic [-1 : id_16] id_21;
  ;
  assign id_14 = id_7 ? id_12 & 1 : id_20;
  assign id_16 = id_7;
  logic id_22;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_8,
      id_4,
      id_9,
      id_11
  );
endmodule
