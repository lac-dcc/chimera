// Seed: 3742903165
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
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire  id_11;
  logic id_12;
  ;
endmodule
module module_1 (
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
    id_13
);
  inout wire id_13;
  inout tri id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_5,
      id_12,
      id_13,
      id_7,
      id_13,
      id_11,
      id_8
  );
  input wire id_2;
  input wire id_1;
  assign id_12 = 1;
  nand primCall (id_8, id_5, id_9, id_3, id_6, id_12, id_10, id_2, id_11, id_1, id_13);
  localparam id_14 = 1 & 1;
endmodule
