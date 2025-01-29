// Seed: 868297126
module module_0 ();
  generate
    tri1 id_2;
  endgenerate
  assign module_2.type_0 = 0;
  assign module_1.id_2   = 0;
  parameter id_3 = -1;
  nmos (.id_0(id_1));
  assign id_2 = {id_2, id_2, 1};
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_5, id_6, id_7, id_8;
  module_0 modCall_1 ();
  always id_2 = 1;
  always_latch id_7.id_8 <= -1'b0;
endmodule
module module_2 (
    input supply1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    output supply0 id_6,
    output supply1 id_7,
    input uwire id_8,
    input wire id_9,
    output tri1 id_10,
    input wand id_11,
    output uwire id_12,
    output wor id_13,
    input tri0 id_14
);
  wire id_16;
  xnor primCall (id_1, id_11, id_14, id_16, id_3, id_4, id_5, id_8, id_9);
  module_0 modCall_1 ();
endmodule
