// Seed: 3543221901
module module_0 (
    input  tri1 id_0,
    output wor  id_1,
    output wand id_2,
    input  tri  id_3,
    output wand id_4,
    input  tri1 id_5
);
  parameter id_7 = 1;
  assign id_2 = -1'b0;
  assign id_1 = id_7;
  assign id_4 = id_5;
  localparam id_8 = id_7;
endmodule
module module_1 (
    output wand id_0,
    input wor id_1,
    input wire id_2,
    input supply1 id_3
);
  assign id_0 = id_3;
  assign id_0 = ~&1 + -1'd0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule
