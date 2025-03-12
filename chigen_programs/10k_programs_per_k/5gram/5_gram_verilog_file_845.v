// Seed: 1942813412
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    output tri1 module_0
    , id_8,
    output tri id_3,
    input wor id_4,
    input wand id_5,
    output supply1 id_6
);
  wire id_9;
endmodule
module module_1 #(
    parameter id_14 = 32'd21
) (
    output wire id_0,
    input tri id_1,
    output uwire id_2,
    input tri0 id_3,
    input supply1 id_4,
    output supply1 id_5,
    input wor id_6,
    input wand id_7,
    output wire id_8,
    input wor id_9,
    input wor id_10,
    input uwire id_11,
    input supply1 id_12,
    input wire id_13,
    input wire _id_14,
    input uwire id_15,
    output tri id_16
);
  logic [-1 : -1 'b0 ==  id_14] id_18;
  nand primCall (
      id_8, id_13, id_10, id_11, id_18, id_6, id_9, id_7, id_3, id_12, id_15, id_4, id_1
  );
  module_0 modCall_1 (
      id_6,
      id_5,
      id_2,
      id_5,
      id_1,
      id_4,
      id_8
  );
  assign modCall_1.id_4 = 0;
  id_19 :
  assert property (@(posedge id_18) 1'h0)
  else $unsigned(26);
  ;
endmodule
