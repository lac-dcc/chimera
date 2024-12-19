// Seed: 485220440
module module_0 (
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
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always
  `define pp_11 0
  assign id_8 = 1;
  assign id_2 = `pp_11;
  genvar id_12;
  tri1 id_13 = 1'd0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_8;
  assign id_8 = id_6[1];
  xnor primCall (id_4, id_6, id_7, id_2, id_3, id_8);
  module_0 modCall_1 (
      id_3,
      id_7,
      id_5,
      id_1,
      id_7,
      id_7,
      id_2,
      id_7,
      id_7,
      id_4
  );
endmodule
