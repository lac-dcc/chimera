// Seed: 159288402
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
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_13;
endmodule
module module_1 #(
    parameter id_11 = 32'd99
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
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  output wire id_17;
  inout tri0 id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout logic [7:0] id_12;
  inout wire _id_11;
  inout wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  output wire id_7;
  inout tri0 id_6;
  output reg id_5;
  module_0 modCall_1 (
      id_6,
      id_13,
      id_3,
      id_18,
      id_10,
      id_4,
      id_15,
      id_10,
      id_18,
      id_7,
      id_18,
      id_16
  );
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_16 = 1;
  logic id_19;
  initial begin : LABEL_0
    id_5 <= id_9;
    deassign id_11;
  end
  assign id_9[1] = id_12[id_11 : 1];
  localparam id_20 = 1;
  logic id_21;
  assign id_6 = (1) ^ id_19;
endmodule
