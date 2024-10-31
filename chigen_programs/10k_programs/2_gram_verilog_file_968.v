// Seed: 4196789790
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
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd59,
    parameter id_12 = 32'd63
) (
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
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always id_4 <= id_3;
  wire id_9;
  assign id_5 = id_3;
  wire id_10;
  generate
    defparam id_11.id_12 = 1;
  endgenerate
  module_0(
      id_9, id_1, id_9, id_8, id_6, id_2, id_9, id_9
  );
endmodule
