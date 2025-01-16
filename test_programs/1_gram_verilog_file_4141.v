// Seed: 397013626
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  parameter id_6 = 1 == id_4;
endmodule
module module_1;
  wire id_2, id_3;
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3
  );
endmodule
module module_2 #(
    parameter id_14 = 32'd45,
    parameter id_15 = 32'd25
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
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_13 = id_11;
  defparam id_14 = id_9, id_15 = id_13;
  wire id_16;
  wire id_17;
  wire id_18;
  wire id_19;
  assign id_8[1] = id_4;
  module_0 modCall_1 (
      id_19,
      id_19,
      id_10,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
