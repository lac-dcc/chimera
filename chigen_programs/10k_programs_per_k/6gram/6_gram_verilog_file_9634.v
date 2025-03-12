// Seed: 2232546914
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_13 = ~id_17;
  assign id_8  = -1;
  always @(negedge -1, posedge id_17 or negedge -1) begin : LABEL_0
    disable id_20;
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd27
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0][1  -  -1 : id_4] id_5[-1 : 1];
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3
  );
  wire id_6;
  assign id_5[-1] = 1 ? id_6 > -1 : 1'd0 == id_4;
endmodule
