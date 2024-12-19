// Seed: 990074990
module module_0 (
    id_1
);
  inout wire id_1;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  module_0 modCall_1 (id_3);
endmodule
module module_2 (
    id_1,
    id_2#(.id_3(id_4)),
    id_5
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = 1'h0;
  module_0 modCall_1 (id_5);
endmodule
