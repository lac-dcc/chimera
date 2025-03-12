// Seed: 3608453513
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
    id_13
);
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout supply1 id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_6 = id_1 - id_4;
endmodule
module module_1 #(
    parameter id_6 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  output reg id_7;
  inout wire _id_6;
  input wire id_5;
  input wire id_4;
  inout reg id_3;
  inout wire id_2;
  inout wire id_1;
  always @(negedge -1) id_7 = -1;
  wire [-1 : id_6] id_8;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_8,
      id_1,
      id_4,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4,
      id_5,
      id_8
  );
  localparam id_9 = ~1, id_10 = -1'd0, id_11 = id_3;
  always_latch @(posedge -1 or posedge 1) id_3 = id_1;
endmodule
