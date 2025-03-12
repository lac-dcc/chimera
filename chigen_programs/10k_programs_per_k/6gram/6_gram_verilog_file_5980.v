// Seed: 1515641989
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
    id_10
);
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_11;
  ;
endmodule
module module_1 #(
    parameter id_9 = 32'd48
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
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  output reg id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  output wor id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire _id_9;
  output reg id_8;
  output wire id_7;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_3,
      id_3,
      id_16,
      id_15,
      id_14,
      id_15,
      id_19,
      id_16
  );
  inout logic [7:0] id_6;
  inout reg id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_5 <= -1'b0 + id_19;
    id_8 <= id_6;
    disable id_20;
  end
  always @({(-1) {id_2}} or posedge -1 or posedge id_6 or -1'h0) begin : LABEL_1
    id_18 = id_1;
  end
  logic id_21 = -1;
  assign id_6[-1] = 'b0 ? 1 : id_19;
  wire [id_9 : -1] id_22;
  assign id_13 = 1 ? 1'b0 ^ id_2 != id_4 : -1 * -1;
endmodule
