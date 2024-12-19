// Seed: 2485306080
module module_0 #(
    parameter id_11 = 32'd77,
    parameter id_12 = 32'd34
) (
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
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = id_8;
  defparam id_11.id_12 = (1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
  always
  fork
  join
  assign id_2 = id_1[1'b0 : 1];
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2,
      id_3,
      id_3,
      id_5,
      id_5,
      id_3,
      id_6
  );
  assign id_2 = 1'd0 * 1 & 1'b0;
  assign id_6 = id_6;
endmodule
