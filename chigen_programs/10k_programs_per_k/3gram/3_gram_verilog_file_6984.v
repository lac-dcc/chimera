// Seed: 627660045
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
macromodule module_1 #(
    parameter id_12 = 32'd19
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
    _id_12,
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
  inout logic [7:0] id_21;
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output tri0 id_15;
  output wire id_14;
  input wire id_13;
  module_0 modCall_1 (
      id_17,
      id_10,
      id_6,
      id_10,
      id_10,
      id_20,
      id_6,
      id_17,
      id_17
  );
  input wire _id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  nand primCall (
      id_21,
      id_17,
      id_9,
      id_13,
      id_18,
      id_8,
      id_20,
      id_6,
      id_5,
      id_10,
      id_19,
      id_11,
      id_7,
      id_1,
      id_16
  );
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_22 = id_15++ - ((-1));
  final begin : LABEL_0
    id_21[id_12] <= id_5;
  end
  wire id_23;
  logic [1 : -1] id_24;
  localparam id_25 = -1;
  logic [-1 'd0 : -1] id_26 = -1;
endmodule
