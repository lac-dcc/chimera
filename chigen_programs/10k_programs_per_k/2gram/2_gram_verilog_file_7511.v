// Seed: 766952589
module module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  nand primCall (id_3, id_8, id_2, id_7, id_6);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 (id_3);
  output wire id_1;
  assign id_4 = id_3;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_1 = 0;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
