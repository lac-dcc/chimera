// Seed: 4123392145
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
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  genvar id_12;
  parameter id_13 = -1;
  logic id_14;
  wire  id_15;
endmodule
module module_1 #(
    parameter id_1 = 32'd16
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4
  );
  inout wire id_3;
  input wire id_2;
  inout wire _id_1;
  wire [(  ~  id_1  ) : 1] id_5;
  assign id_3 = id_5;
endmodule
