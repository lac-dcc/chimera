// Seed: 1896741716
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    module_0,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout tri1 id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  tri0 id_20 = -1'b0;
  assign id_4 = 1 ? id_8 : -1 ? -1'b0 : -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd39
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output logic [7:0] id_4;
  input wire id_3;
  input wire _id_2;
  output logic [7:0] id_1;
  assign id_4[-1] = id_3;
  logic id_7;
  wire  id_8;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_8,
      id_7,
      id_7,
      id_7,
      id_7,
      id_3,
      id_7,
      id_7,
      id_8,
      id_8,
      id_8,
      id_8,
      id_3,
      id_8,
      id_3,
      id_5,
      id_7
  );
  assign modCall_1.id_20 = 0;
  assign id_1[id_2] = 1 + id_7;
endmodule
