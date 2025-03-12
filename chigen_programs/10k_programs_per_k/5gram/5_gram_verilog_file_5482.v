// Seed: 1840615871
module module_0;
  wire [1 'b0 : -1  -  1] id_1;
endmodule
module module_1 #(
    parameter id_6 = 32'd83,
    parameter id_8 = 32'd12
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  xnor primCall (id_1, id_10, id_11, id_12, id_13, id_2, id_3, id_7);
  inout wire id_11;
  input wire id_10;
  output reg id_9;
  input wire _id_8;
  inout wire id_7;
  input wire _id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  inout tri id_1;
  assign id_1 = 1'b0;
  logic id_13 = 1;
  always_comb @(id_8 or posedge id_2[id_6==id_8-1]) begin : LABEL_0
    id_13 <= id_8;
    id_9  <= -1;
  end
  module_0 modCall_1 ();
endmodule
