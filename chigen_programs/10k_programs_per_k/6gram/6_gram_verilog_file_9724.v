// Seed: 184535537
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  assign id_1[-1] = -1;
endmodule
module module_1 (
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
  output logic [7:0] id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_7[1] = id_3 ? id_6 : -1 ? id_5 : -1;
  logic [1 'b0 : -1] id_9 = id_6;
  module_0 modCall_1 (
      id_7,
      id_9,
      id_6,
      id_9,
      id_6,
      id_6,
      id_6,
      id_9
  );
endmodule
