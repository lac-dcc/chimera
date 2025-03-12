// Seed: 3141859027
module module_0 (
    id_1
);
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (id_1);
  inout wire id_1;
  wire id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout logic [7:0] id_7;
  inout wire id_6;
  module_0 modCall_1 (id_3);
  inout reg id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = (id_7);
  always @(id_4 ? 1 : -1) id_5 <= id_7[-1];
  always id_7[-1] <= id_2;
endmodule
