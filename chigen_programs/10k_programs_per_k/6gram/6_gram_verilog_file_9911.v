// Seed: 1885779053
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_8 = 32'd14
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output logic [7:0] id_5;
  output wire id_4;
  output wire id_3;
  input logic [7:0] id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  wire _id_8;
  assign id_5[(1)] = id_2[id_8];
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_6
  );
endmodule
