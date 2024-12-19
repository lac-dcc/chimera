// Seed: 2079990312
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
    id_10,
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_12;
  wire id_13 = id_4;
  assign id_8 = 1;
  wire id_14;
  wire id_15 = id_12;
endmodule
module module_1 #(
    parameter id_13 = 32'd33,
    parameter id_14 = 32'd84
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
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  defparam id_13.id_14 = id_6;
  nor primCall (id_11, id_13, id_5, id_14, id_1, id_12, id_6, id_2, id_3, id_7, id_4);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_5,
      id_7,
      id_5,
      id_9,
      id_12,
      id_5,
      id_4,
      id_2,
      id_11
  );
endmodule
