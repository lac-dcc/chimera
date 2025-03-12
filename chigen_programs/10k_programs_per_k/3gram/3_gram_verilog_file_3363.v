// Seed: 3187138638
module module_0 #(
    parameter id_9 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire _id_9;
  output wire id_8;
  output wire id_7;
  inout tri0 id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_17;
  wire id_18;
  assign id_6 = -1;
  always #1;
  wire [1 'b0 : id_9] id_19;
  localparam id_20 = -1;
  assign id_1 = 1'b0;
endmodule
module module_1 #(
    parameter id_2 = 32'd27
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout supply0 id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  inout wire _id_2;
  nand primCall (id_1, id_5, id_3, id_8, id_7, id_9, id_12, id_4, id_11, id_13, id_10, id_6);
  inout wire id_1;
  bit [(  1  ) : -1  ==  id_2] id_9;
  localparam id_10 = 1, id_11 = 1, id_12 = 1;
  logic [7:0] id_13;
  assign id_5 = id_11 & 1'b0 & id_13[1'b0] & id_11;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_5,
      id_6,
      id_5,
      id_5,
      id_1,
      id_12,
      id_1,
      id_1,
      id_10,
      id_5,
      id_7,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
  wire id_14;
  initial id_9 = 1;
endmodule
