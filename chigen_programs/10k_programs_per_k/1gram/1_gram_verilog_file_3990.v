// Seed: 1520639279
module module_0 (
    id_1,
    id_2,
    id_3[!1'h0 : 1'd0],
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
    id_21
);
  output wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_15 = 32'd89
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7[id_15 :-1'b0],
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    _id_15,
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_7,
      id_3,
      id_10,
      id_3,
      id_12,
      id_4,
      id_16,
      id_17,
      id_13,
      id_8,
      id_9,
      id_14,
      id_10,
      id_12,
      id_1,
      id_14,
      id_8,
      id_13,
      id_8
  );
  input wire _id_15;
  nand primCall (id_8, id_1, id_13, id_2, id_7, id_9, id_14, id_10, id_6, id_4);
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout logic [7:0] id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  tri   id_18 = -1;
  logic id_19;
endmodule
