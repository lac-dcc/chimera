// Seed: 1205750955
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge -1 or negedge -1) disable id_7;
  parameter id_8 = 1;
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
    id_12
);
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_5,
      id_10,
      id_4
  );
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  xnor primCall (id_5, id_4, id_2, id_11, id_3, id_10, id_1);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  localparam id_13 = 1;
  assign id_2 = id_3;
endmodule
