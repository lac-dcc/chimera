// Seed: 2659475011
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output reg id_1;
  always id_1 <= #1  ~id_4;
endmodule
module module_1 #(
    parameter id_22 = 32'd28,
    parameter id_6  = 32'd97
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
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
    id_21,
    _id_22,
    id_23
);
  output wire id_23;
  input wire _id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input logic [7:0] id_11;
  input logic [7:0] id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire _id_6;
  output reg id_5;
  input logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_24;
  bit [-1 : -1] id_25;
  logic id_26;
  ;
  always @(id_15 or posedge id_11[1'd0-""]) begin : LABEL_0
    id_5 <= id_14;
  end
  module_0 modCall_1 (
      id_5,
      id_19,
      id_14,
      id_14
  );
  generate
    for (id_27 = id_10[{{id_22{id_6}}, 1}]; id_6; id_25 = id_4[-1] + id_4) begin : LABEL_1
      assign id_5 = 1;
    end
  endgenerate
endmodule
