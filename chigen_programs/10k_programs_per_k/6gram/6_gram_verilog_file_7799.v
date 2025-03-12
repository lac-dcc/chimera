// Seed: 3647353469
module module_0 (
    output uwire id_0,
    output wand  id_1
);
endmodule
module module_1 #(
    parameter id_1  = 32'd22,
    parameter id_16 = 32'd20
) (
    output wire id_0,
    input wor _id_1,
    input tri id_2,
    input supply0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input tri id_6,
    output tri id_7,
    input wor id_8,
    output supply0 id_9,
    input wand id_10,
    input tri id_11
);
  assign id_9 = id_5;
  wor id_13;
  parameter id_14 = -1'b0 == 1;
  nand primCall (id_4, id_14, id_8, id_5, id_15, id_10, id_6, id_3, id_2, id_13);
  localparam id_15 = id_14;
  logic [1 'd0 : id_1] _id_16;
  ;
  assign id_13 = id_8 ? 1 : id_15[1 : id_1];
  module_0 modCall_1 (
      id_7,
      id_4
  );
  wire [1 : id_16] id_17;
endmodule
