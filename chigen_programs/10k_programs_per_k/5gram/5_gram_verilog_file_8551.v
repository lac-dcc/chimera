// Seed: 1682297614
module module_0 #(
    parameter id_4 = 32'd72
) (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  parameter id_4 = -1;
  wire [-1 : 1] id_5;
  assign id_1[id_4] = id_4 + 1;
  wire id_6;
  assign id_5 = id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_5 = 32'd91
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire _id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  parameter id_8 = 1;
  initial begin : LABEL_0
    cover (1);
  end
  assign id_1[id_5] = id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_8
  );
endmodule
