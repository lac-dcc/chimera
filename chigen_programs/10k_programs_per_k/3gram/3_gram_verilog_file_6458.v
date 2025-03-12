// Seed: 201814531
module module_0 (
    id_1
);
  inout wire id_1;
  wire id_2;
endmodule
module module_1 #(
    parameter id_10 = 32'd62,
    parameter id_12 = 32'd27
) (
    input supply1 id_0,
    input wor id_1,
    output wire id_2,
    input wand id_3,
    output supply0 id_4,
    input tri id_5,
    input wand id_6,
    input supply1 id_7
);
  wire id_9;
  ;
  wire _id_10;
  nand primCall (id_2, id_9, id_3, id_7, id_6, id_11, id_1, id_5);
  assign id_4 = id_0;
  logic [7:0] id_11;
  ;
  wire _id_12;
  wire id_13;
  ;
  assign id_11[id_10&1'b0 : id_12] = 1'b0;
  module_0 modCall_1 (id_13);
endmodule
