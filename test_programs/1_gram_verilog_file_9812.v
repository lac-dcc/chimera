// Seed: 1958573778
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
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  bit id_9;
  bit id_10;
  parameter id_11 = "";
  bit id_12 = id_9;
  assign id_9 = -1;
  parameter id_13 = -1'b0;
  always id_10 <= id_12;
  wire id_14;
endmodule
module module_1 #(
    parameter id_6 = 32'd0
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5 = id_3;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_4,
      id_4,
      id_2,
      id_2,
      id_5
  );
  defparam id_6 = 1;
  wire id_7;
  assign id_2 = id_1;
endmodule
