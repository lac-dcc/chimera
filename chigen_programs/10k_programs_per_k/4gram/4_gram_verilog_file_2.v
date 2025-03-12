// Seed: 1054057501
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output logic [7:0] id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1
  );
  inout wire id_1;
  assign id_2[(-1)] = id_3;
endmodule
