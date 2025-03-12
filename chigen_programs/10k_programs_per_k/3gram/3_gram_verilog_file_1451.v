// Seed: 2680152426
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wand id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_4 = 1;
  wire id_5;
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd40
) (
    id_1,
    _id_2
);
  inout wire _id_2;
  output wire id_1;
  logic [7:0][1 'd0 : id_2] id_3 = id_3[id_2];
  wire id_4 = id_3;
  localparam id_5 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_3 = 0;
  wire id_6, id_7, id_8, id_9, id_10;
  nand primCall (id_1, id_3, id_4);
  wire id_11 = id_5;
endmodule
