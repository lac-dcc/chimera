// Seed: 797611981
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
    id_15
);
  output wire id_15;
  output wor id_14;
  output wire id_13;
  input wire id_12;
  inout wor id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output uwire id_1;
  wire id_16;
  wire id_17;
  assign id_1  = 1;
  assign id_14 = -1;
  wire id_18;
  assign id_11 = 1'h0;
endmodule
module module_1 #(
    parameter id_11 = 32'd42,
    parameter id_3  = 32'd68
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input logic [7:0] id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  output wire id_4;
  output wire _id_3;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_8,
      id_5,
      id_5,
      id_5,
      id_8,
      id_2,
      id_8,
      id_4,
      id_5,
      id_8,
      id_8,
      id_8,
      id_2
  );
  output wire id_2;
  inout logic [7:0] id_1;
  parameter id_9 = -1;
  wire id_10;
  always disable _id_11;
  assign id_6[-1] = 1'b0 == "";
  always @(*) begin : LABEL_0
    if (id_9) begin : LABEL_1
      id_1[id_11 :-1] <= id_6;
    end
  end
endmodule
