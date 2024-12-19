// Seed: 1448822247
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = -id_6;
  wire id_7;
  tri0 id_8;
  assign id_8 = 1'd0;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  tri1 id_7, id_8;
  always id_5 = 1 - id_7;
  tri0 id_9 = 1;
  assign id_3 = id_3;
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_9,
      id_6
  );
  assign id_4 = 1;
endmodule
