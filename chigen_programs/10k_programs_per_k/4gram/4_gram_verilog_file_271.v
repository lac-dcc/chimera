// Seed: 2984165844
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_6 = id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd72,
    parameter id_2 = 32'd89
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  inout logic [7:0] id_4;
  input wire id_3;
  input wire _id_2;
  output wire _id_1;
  parameter id_5 = 1;
  logic [1 : id_1] id_6 = 1;
  always @(posedge 1'd0);
  logic [7:0] id_7 = id_3;
  assign id_4[id_2] = 1;
  parameter id_8 = id_5;
  parameter id_9 = 1;
  logic [-1 : 1] id_10 = id_7;
  for (id_11 = {id_7[-1], 1}; id_6; id_10 += 1) begin : LABEL_0
    assign id_10 = -1;
  end
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_11,
      id_9,
      id_9,
      id_11
  );
endmodule
