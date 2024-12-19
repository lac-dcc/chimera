// Seed: 2986807327
module module_0 #(
    parameter id_15 = 32'd90,
    parameter id_16 = 32'd82
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
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  defparam id_15.id_16 = 1;
  assign module_1.id_7 = 0;
  wire id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_4[1] = 1;
  uwire id_7 = id_3 - id_7;
  wire id_8, id_9;
  assign id_2 = id_7;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_1,
      id_9,
      id_6,
      id_6,
      id_7,
      id_7,
      id_1,
      id_1,
      id_9,
      id_1,
      id_6,
      id_7
  );
endmodule
