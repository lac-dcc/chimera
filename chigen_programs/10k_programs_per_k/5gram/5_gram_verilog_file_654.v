// Seed: 542007136
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_5;
  logic [1 : 1] id_6;
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd32,
    parameter id_16 = 32'd94
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
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    _id_16
);
  input wire _id_16;
  output wire id_15;
  inout wire id_14;
  inout wire _id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_8,
      id_14,
      id_14,
      id_9
  );
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  id_17 :
  assert property (@(posedge -1'b0) -1)
  else $signed(60);
  ;
  logic id_18;
  logic [-1 'h0 ==  id_16 : id_16] id_19 = -1'b0;
  always @(*) begin : LABEL_0
    id_7#(.id_4(1)) [id_13] <= 1;
  end
endmodule
