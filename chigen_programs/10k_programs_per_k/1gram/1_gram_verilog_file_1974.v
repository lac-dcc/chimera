// Seed: 664481747
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
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_13 = id_8 == 1;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd36
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
  integer id_9;
  uwire id_10, id_11;
  uwire id_12;
  assign id_6  = 1;
  assign id_11 = id_3;
  assign id_4  = 1;
  defparam id_13 = 1;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_8,
      id_3,
      id_12,
      id_9,
      id_7,
      id_11,
      id_11,
      id_8,
      id_10,
      id_11,
      id_6
  );
  wire id_14, id_15, id_16;
  assign id_10 = 1;
  assign id_4  = id_7;
  integer id_17, id_18;
  id_19(
      id_9, id_12, 1, 1
  );
  wire id_20;
  assign id_20 = id_14;
endmodule
