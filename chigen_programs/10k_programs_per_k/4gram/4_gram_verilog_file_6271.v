// Seed: 580733764
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
    id_12
);
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  assign module_1.id_3 = 0;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_13 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output logic [7:0] id_1;
  supply0 [1 : 'b0] id_3;
  assign id_1[-1] = id_3;
  assign id_3 = 1 - 1'b0;
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3
  );
endmodule
