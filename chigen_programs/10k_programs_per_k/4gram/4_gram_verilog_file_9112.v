// Seed: 2251991757
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
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
    id_15,
    id_16
);
  output wire id_16;
  inout reg id_15;
  output wire id_14;
  module_0 modCall_1 (
      id_9,
      id_11
  );
  input wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output reg id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  assign id_12 = id_10;
  always @(posedge -1) begin : LABEL_0
    id_15 <= id_3 <= (id_4);
    @(posedge id_3[-1 : {1, 1}] < id_5 or negedge -1) begin : LABEL_1
      if (-1'b0) id_8 <= id_9;
      else $unsigned(33);
      ;
    end
  end
  wire id_17;
  initial begin : LABEL_2
    disable id_18;
  end
  always_ff @("" or posedge 1'b0) id_8 <= 1;
endmodule
