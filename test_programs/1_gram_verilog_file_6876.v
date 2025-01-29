// Seed: 868240639
program module_0 (
    id_1
);
  input wire id_1;
  genvar id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (id_2);
  wire id_3;
  wire id_4;
endmodule
module module_2 ();
  wire id_2;
  assign id_1 = ~1;
  wire id_4, id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (id_4);
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_3 = 0;
endmodule
