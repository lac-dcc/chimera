// Seed: 2351298571
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25
);
  output wire id_25;
  input wire id_24;
  input wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd29,
    parameter id_14 = 32'd73
) (
    id_1,
    id_2#(
        .id_3(~-1),
        .id_4(id_5),
        .id_6(id_1)
    ),
    id_7,
    id_8,
    id_9
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_10, id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_10,
      id_9,
      id_9,
      id_8,
      id_7,
      id_10,
      id_11,
      id_10,
      id_10,
      id_2,
      id_2,
      id_10,
      id_9,
      id_2,
      id_8,
      id_2,
      id_8,
      id_7,
      id_7,
      id_11,
      id_10,
      id_10,
      id_9
  );
  wire id_12;
  defparam id_13 = {id_6{-1}}, id_14 = id_3;
  wire id_15, id_16;
endmodule
