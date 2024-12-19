// Seed: 1331558444
module module_0;
  tri1 id_2;
  wire id_3;
  wire id_4;
  assign id_2 = 1;
endmodule
module module_1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_8[1] = id_7[1];
  and primCall (id_10, id_2, id_3, id_5, id_6, id_7, id_8);
  module_0 modCall_1 ();
endmodule
