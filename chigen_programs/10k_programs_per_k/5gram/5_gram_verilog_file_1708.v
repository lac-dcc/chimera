// Seed: 1729556382
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
    id_17
);
  input wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_18;
endmodule
module module_1 #(
    parameter id_4 = 32'd83
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  output logic [7:0] id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_11,
      id_6,
      id_5,
      id_9,
      id_9,
      id_6,
      id_11,
      id_11,
      id_11,
      id_9,
      id_3,
      id_2,
      id_2,
      id_2,
      id_9,
      id_3,
      id_8
  );
  input wire _id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign (strong1, weak0) id_1 = id_1;
  assign id_10[id_4%-1'b0] = id_11;
endmodule
