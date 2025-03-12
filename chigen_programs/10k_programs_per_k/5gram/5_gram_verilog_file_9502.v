// Seed: 280770484
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  parameter id_6 = 1;
  wire  id_7;
  logic id_8;
endmodule
module module_1 #(
    parameter id_4 = 32'd25,
    parameter id_7 = 32'd44
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  input logic [7:0] id_6;
  output wire id_5;
  inout wire _id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire _id_7;
  reg id_8;
  wire ["" : {  -1  {  id_4  }  }] id_9;
  module_0 modCall_1 (
      id_9,
      id_3,
      id_9,
      id_1,
      id_5
  );
  wire id_10;
  always @(negedge -1) begin : LABEL_0
    id_8 = id_6['b0 : id_7**1];
  end
endmodule
