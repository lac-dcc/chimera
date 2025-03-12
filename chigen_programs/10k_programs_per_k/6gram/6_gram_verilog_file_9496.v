// Seed: 467546834
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
    .id_17(id_11),
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  input logic [7:0] id_16;
  inout wire id_15;
  output wire id_14;
  inout tri id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_13 = 1;
  assign id_2  = id_16[-1];
endmodule
module module_1 #(
    parameter id_10 = 32'd99
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
    _id_10,
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
  input wire id_21;
  output wire id_20;
  module_0 modCall_1 (
      id_16,
      id_13,
      id_6,
      id_4,
      id_6,
      id_6,
      id_6,
      id_13,
      id_13,
      id_9,
      id_6,
      id_5,
      id_3,
      id_14,
      id_18,
      id_7
  );
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output reg id_11;
  inout wire _id_10;
  input wire id_9;
  output wire id_8;
  input logic [7:0] id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(1 != id_7[-1 : id_10==id_10] or posedge id_17) begin : LABEL_0
    if (1) id_11 <= 1;
  end
endmodule
