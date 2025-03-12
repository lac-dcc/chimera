// Seed: 2680131926
module module_0 #(
    parameter id_4 = 32'd43
) (
    id_1,
    id_2,
    id_3
);
  output reg id_3;
  input wire id_2;
  output logic [7:0] id_1;
  wire _id_4;
  ;
  logic [1 : -1] id_5;
  assign module_1.id_12 = 0;
  always_latch id_3 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd35,
    parameter id_9  = 32'd22
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
    id_11
);
  input wire id_11;
  input wire id_10;
  input wire _id_9;
  output logic [7:0] id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic _id_12, id_13, id_14, id_15, id_16;
  wire id_17;
  ;
  always @(1'b0)
    if (1) begin : LABEL_0
      id_14 = id_11 - id_4;
    end else begin : LABEL_1
      id_8[-1 : id_9==id_12] <= id_13;
    end
  module_0 modCall_1 (
      id_8,
      id_5,
      id_13
  );
endmodule
