// Seed: 874568269
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
    id_18
);
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  supply1 id_19 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd95,
    parameter id_7 = 32'd26
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_10,
      id_9,
      id_6,
      id_9,
      id_12,
      id_10,
      id_10,
      id_12,
      id_12,
      id_8,
      id_9,
      id_2,
      id_3,
      id_9,
      id_12,
      id_12
  );
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire _id_7;
  output wire id_6;
  output wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  inout wire _id_1;
  generate
    if (1) assign id_4[id_7 : id_1] = id_9;
  endgenerate
endmodule
