// Seed: 4272126259
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  assign module_1.id_1 = 0;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    input  tri   id_2
);
  assign id_0 = id_2;
  wor [-1 : 1 'b0] id_4;
  parameter id_5 = 1;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_5,
      id_5,
      id_4,
      id_6,
      id_6,
      id_4,
      id_4,
      id_4
  );
  assign id_4 = 1'b0;
  xnor primCall (id_0, id_2, id_6, id_5);
endmodule
