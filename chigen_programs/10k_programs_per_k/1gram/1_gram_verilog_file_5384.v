// Seed: 1659211316
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout tri0 id_3;
  output supply0 id_2;
  input wire id_1;
  logic id_6 = id_5;
  wire id_7, id_8;
  assign id_2 = id_3 - -1;
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd60
) (
    id_1,
    _id_2,
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
  inout reg id_13;
  output wire id_12;
  input wire id_11;
  module_0 modCall_1 (
      id_11,
      id_3,
      id_7,
      id_12,
      id_7
  );
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output reg id_6;
  output logic [7:0] id_5;
  input wire id_4;
  output wire id_3;
  input wire _id_2;
  input logic [7:0] id_1;
  always_comb begin : LABEL_0
    begin : LABEL_1
      @(posedge id_1[id_2] or posedge id_9) id_6 <= id_2;
      id_13 <= -1'd0;
    end
    @(posedge -1 or negedge id_13);
  end
  wire [1 : 1] id_14;
  assign id_5[-1] = 1 / id_9;
  assign id_3 = id_10;
  always @("" or id_8) id_6 = -1;
  assign id_13 = -1;
  wire id_15;
  assign id_13 = -1;
  logic id_16;
  ;
  parameter id_17 = 1;
endmodule
