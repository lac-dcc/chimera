// Seed: 1696932882
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
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_9;
  wire id_10 = id_9[1];
  parameter id_11 = -1;
  always force id_4 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd70
) (
    id_1,
    _id_2
);
  input wire _id_2;
  output logic [7:0] id_1;
  parameter [1 : 1] id_3 = -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign id_1[id_2] = -1 && id_2;
endmodule
