// Seed: 1816857022
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
    id_11
);
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output logic [7:0] id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4[1] = 1;
  wire [-1 : -1] id_12;
  assign id_10 = id_3[1'b0 : 1];
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
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_1,
      id_6,
      id_4,
      id_2,
      id_2,
      id_3,
      id_6,
      id_4
  );
  inout wire id_2;
  inout logic [7:0] id_1;
  assign id_7 = id_1[-1];
  parameter id_8 = 1;
endmodule
