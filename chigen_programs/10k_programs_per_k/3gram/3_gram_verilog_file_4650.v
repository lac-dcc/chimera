// Seed: 983470827
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  logic id_5;
  parameter id_6 = 1;
  assign id_2 = ~1;
  assign id_2[1] = -1;
endmodule
module module_1 #(
    parameter id_5 = 32'd43
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  inout logic [7:0] id_8;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_1,
      id_3
  );
  output logic [7:0] id_7;
  output wire id_6;
  input wire _id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_7[-1 : (id_5)] = id_1 ^ id_8[-1&~1];
endmodule
