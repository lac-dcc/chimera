// Seed: 3616750498
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
    id_12
);
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_8[1'b0] = !id_7;
endmodule
module module_1 #(
    parameter id_24 = 32'd74,
    parameter id_25 = 32'd78
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = 1;
  wire id_20;
  wire id_21;
  assign id_2[1] = 1'b0;
  wire id_22;
  id_23(
      .id_0(id_5), .id_1(id_1), .id_2(1), .id_3(1)
  );
  assign id_5 = id_11[1];
  module_0 modCall_1 (
      id_21,
      id_22,
      id_21,
      id_21,
      id_12,
      id_1,
      id_14,
      id_2,
      id_20,
      id_9,
      id_7,
      id_22
  );
  assign id_1 = id_14;
  defparam id_24.id_25 = id_17;
endmodule
