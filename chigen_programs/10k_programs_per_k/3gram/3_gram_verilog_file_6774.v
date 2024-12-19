// Seed: 2657312662
module module_0;
  wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  module_0 modCall_1 ();
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  module_0 modCall_1 ();
  wire id_7;
  assign id_1 = id_5;
  nand primCall (id_1, id_3, id_5, id_6);
endmodule
