// Seed: 2178805202
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input uwire id_2,
    input supply0 id_3,
    output wand id_4,
    input tri0 id_5
);
  timeprecision 1ps;
  nand primCall (id_1, id_3, id_0, id_2);
  module_2 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_1,
      id_1,
      id_3,
      id_5,
      id_2,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd93
) (
    output wand id_0,
    input  tri1 id_1,
    output wor  id_2
);
  logic _id_4 = 1;
  not primCall (id_2, id_6);
  wire [id_4 : 1] id_5;
  parameter id_6 = -1;
  assign id_2 = id_6 ? 1 : id_5 == -1'b0;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
module module_2 (
    input uwire id_0,
    input tri id_1,
    input tri1 id_2,
    input supply0 id_3,
    output tri0 id_4,
    output supply0 id_5,
    input supply0 id_6,
    input uwire id_7,
    input wire id_8,
    output supply1 id_9
);
  always @(*) force id_9 = -1;
endmodule
