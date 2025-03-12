// Seed: 1741336750
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_15;
endmodule
module module_1 #(
    parameter id_4 = 32'd86
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1
  );
  inout wire id_2;
  input wire id_1;
  localparam [id_4 : -1] id_5 = -1;
endmodule
