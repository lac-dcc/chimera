// Seed: 2267419300
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  parameter id_8 = {1{1}};
endmodule
module module_1 #(
    parameter id_8 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire _id_8;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_15,
      id_11,
      id_9,
      id_17,
      id_12
  );
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input logic [7:0] id_2;
  input wire id_1;
  wire  id_18;
  logic id_19;
  ;
  always @(id_9 or posedge id_2[!id_8 : 1'b0]) begin : LABEL_0
    wait (id_16);
  end
  tri1 id_20 = -1'd0;
endmodule
